/*
 * File:   config.c
 * Author: Mikhail.Palityka
 *
 * Created on February 24, 2014, 16:10 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "main.h"
#include "GenericTypeDefs.h"

#include "config.h"
#include "gva_dmx.h"

#define CFG_FLASH_ADDR    0x200

#if defined(__XC)
    #define LOCATION_1
    #define LOCATION_2
#else // #if defined(__XC)
    #define LOCATION_1
    #define LOCATION_2
#endif // #if defined(__XC)

const CFG_t defaultCfg LOCATION_1 =
{
#ifdef _ARTNET
    // art
    {
        0x02050607, // ip
        0xFF000000  // mask
    },
#endif // #ifdef _ARTNET
    // dmx
    {
        0, // addr
        1, // numPix
        fsetPWM,  // flags
        0,  // polarity
        0,  // failLevel
        0,  // failTime
    }
} LOCATION_2;

CFG_t cfg;

UINT8 lenFrame;

/**
@brief  Read configuration
@return   none
*/
void read (UINT addr, UINT8 *buf, UINT size)
{
    do
    {
        *buf++ = CPU_rdNVM(addr++);
    }
    while (--size);
}

/**
@brief  Get crc16
@return   crc16
*/
UINT16 CFG_crc16 (UINT src, UINT8 *buf,  UINT size)
{
    #define GEN 0xA001

    UINT16 rg = 0xFFFF; // The initial state of the shift register
    UINT addr;

    if (FLASH_1_SRC == src)
    {
        addr = CFG_FLASH_START_ADDR_1;
    }
    else if (FLASH_2_SRC == src)
    {
        addr = CFG_FLASH_START_ADDR_2;
    }

    do
    {
        UINT j = 8;
        if (RAM_SRC == src)
        {
            rg ^= *buf++;
        }
        else
        {
            UINT8 dt = CPU_rdNVM(addr++);
            rg ^= dt;
            if (buf)
            {
                *buf++ = dt;
            }
        }

        do
        {
            UINT flag = rg & 1;
            rg >>= 1;
            if (flag)
            {
                rg ^= GEN;
            }
        }
        while (--j);
    }
    while (--size);

    return rg;
}

static void write (UINT addr, UINT8 *buf, UINT size)
{
    do
    {
        CPU_wrNVM(addr++, *buf++);
    }
    while (--size);
}

/**
@brief  Write configuration from a buffer
@return   none
*/
void CFG_writeBuf (UINT offs, UINT8 *buf, UINT size)
{
    memcpy((UINT8*)&cfg + offs, buf, size);
//    write(CFG_FLASH_START_ADDR_1 + offs, buf, size);
//    write(CFG_FLASH_START_ADDR_2 + offs, buf, size);
}

/**
@brief  Write configuration byte
@return   none
*/
void CFG_writeByte (UINT offs, UINT8 val)
{
    ((UINT8*)&cfg)[offs] = val;
    CPU_wrNVM(CFG_FLASH_START_ADDR_1 + offs, val);
    CPU_wrNVM(CFG_FLASH_START_ADDR_2 + offs, val);
}

/**
@brief  initialize configuration data
@return  none
*/
void CFG_init (void)
{
    // if CRC1 is ok,
    if (!CFG_crc16(FLASH_1_SRC, (UINT8*)&cfg, sizeof(CFG_t) + sizeof(UINT16)))
    {
        // if the second is corrupted
        if (CFG_crc16(FLASH_2_SRC, 0, sizeof(CFG_t) + sizeof(UINT16)))
        {
            CFG_writeBuf(CFG_FLASH_START_ADDR_2, (UINT8*)&cfg, sizeof(cfg));
            CFG_updateCRC();
        }
    }
    else
    {
        // if CRC2 is ok,
        if (!CFG_crc16(FLASH_2_SRC, (UINT8*)&cfg, sizeof(CFG_t) + sizeof(UINT16)))
        {
            CFG_writeBuf(CFG_FLASH_START_ADDR_1, (UINT8*)&cfg, sizeof(cfg));
            CFG_updateCRC();
        }
        else  //обе области запорчены,
        {
            UINT i;
            // set default configuration
            memcpy(&cfg, (void*)&defaultCfg, sizeof(CFG_t));
            CFG_writeBuf(CFG_FLASH_START_ADDR_1, (UINT8*)&cfg, sizeof(cfg));
            CFG_writeBuf(CFG_FLASH_START_ADDR_2, (UINT8*)&cfg, sizeof(cfg));
            CFG_updateCRC();

            // Значения цвета по умолчанию
            for (i=0; i < MaxDataSz; i++)
            {
                CPU_wrNVM(prmDefColors+i, 0);
            }

            CPU_wrNVM(cntErrReIni, CPU_rdNVM(cntErrReIni) + 1);
        }
    }

    lenFrame = cfg.dmx.numPix * nLayers;   //длина фрейма
}

/**
@brief  update configuration CRC
@return  none
*/
UINT8 CFG_updateCRC (void)
{
    UINT i;
    UINT fCRCbad;
    UINT16 crc;

    crc = CFG_crc16(RAM_SRC, (UINT8*)&cfg, sizeof(cfg));

    write(CFG_FLASH_START_ADDR_1 + sizeof(cfg), (UINT8*)&crc, sizeof(crc));
    write(CFG_FLASH_START_ADDR_2 + sizeof(cfg), (UINT8*)&crc, sizeof(crc));

    fCRCbad = 0;

    for (i=0; i < sizeof(cfg); i++)
    {
        if (((UINT8*)&cfg)[i] != CPU_rdNVM(CFG_FLASH_START_ADDR_1 + i))
        {
            fCRCbad |= (1<<1);
        }
        if (((UINT8*)&cfg)[i] != CPU_rdNVM(CFG_FLASH_START_ADDR_2 + i))
        {
            fCRCbad |= (1<<2);
        }
    }

    return !fCRCbad;
}