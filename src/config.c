/*
 * File:   config.c
 * Author: Mikhail.Palityka
 *
 * Created on February 24, 2014, 16:10 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <plib.h>

#include "main.h"
#include "GenericTypeDefs.h"

#include "config.h"
#include "gva_dmx.h"

//#if (CFG_NVM_STEP < sizeof(CFG_NVM_Entry_t))
//    #error("CFG_NVM_STEP is too small. Increase it.")
//#endif  // #if (sizeof(CFG_NVM_Entry_t) > CFG_NVM_STEP)

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

//const UINT8 __attribute__((space(prog), address(CFG_FLASH_START_ADDR_0))) cfgBuf_1[CFG_NVM_BUF_SIZE];
//const UINT8 __attribute__((space(prog), address(CFG_FLASH_START_ADDR_1))) cfgBuf_2[CFG_NVM_BUF_SIZE];

CFG_NVM_Entry_t cfgNVMentry;
CFG_t *cfg = &cfgNVMentry.data.cfg;

UINT32 endWrAddr[2];

UINT8 lenFrame;

const UINT32 NVM_addr[2] = {CFG_FLASH_START_ADDR_0, CFG_FLASH_START_ADDR_1};

/**
@brief  Get crc16
@return   crc16
*/
UINT16 CFG_crc16 (UINT8 *buf,  UINT size)
{
    #define GEN 0xA001

    UINT16 rg = 0xFFFF; // The initial state of the shift register

    do
    {
        UINT j = 8;

        rg ^= *buf++;

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

UINT32 NVM_scan (UINT copyId)
{
    UINT32 startAddr;
    UINT32 endAddr;
    UINT32 *curAddr;
    UINT32 midAddr;

    startAddr = NVM_addr[copyId];
    endAddr = startAddr + CFG_NVM_BUF_SIZE;
    do
    {
        midAddr = ((startAddr >> 1) + (endAddr >> 1)) & ~(CFG_NVM_STEP - 1);
        curAddr = (UINT32*)midAddr;
        for (;;)
        {
            if (*curAddr != CFG_NVM_ERASED_PTRN)
            {
                startAddr = midAddr + CFG_NVM_STEP;
                break;
            }
            ++curAddr;
            if (!((UINT32)curAddr & (CFG_NVM_STEP - 1)))
            {
                endAddr = midAddr;
                break;
            }
        };
    } while (startAddr != endAddr);

    endWrAddr[copyId] = startAddr;
    while (startAddr > NVM_addr[copyId])
    {
        startAddr -= CFG_NVM_STEP;
        if (!CFG_crc16((UINT8*)startAddr, sizeof(cfgNVMentry.data)))
        {
            return startAddr;
        }
    }

    return 0;
}

/**
@brief  Save configuration into NVM
@return   none
*/

static INT NVM_save (UINT copyId)
{
    UINT32 *addr;
    UINT32 *ptr;
    UINT32 endAddr;

    if (endWrAddr[copyId] >= (NVM_addr[copyId] + CFG_NVM_BUF_SIZE))
    {
       	if (0 != NVMErasePage((void*)NVM_addr[copyId]))
        {
            return 0;
        }
        endWrAddr[copyId] = NVM_addr[copyId];
    }
    addr = (UINT32*)endWrAddr[copyId];
    ptr = cfgNVMentry.buf;
    endAddr = (NVM_addr[copyId] + CFG_NVM_STEP);

    do
    {
        NVMWriteWord((void*)addr, *ptr);

        ++addr;
        ++ptr;
    }
    while ((UINT32)addr < endAddr);
    return 0;
}

INT CFG_updateNVM (void)
{
    cfgNVMentry.data.magic = 0x1234;
    ++cfgNVMentry.data.id;
    cfgNVMentry.data.crc = CFG_crc16((UINT8*)&cfgNVMentry.data, sizeof(cfgNVMentry.data) - sizeof(cfgNVMentry.data.crc));
    if (!NVM_save(0) || NVM_save(1))
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

/**
@brief  initialize configuration data
@return  none
*/
void CFG_init (void)
{
    UINT32 addr;
    INT copyId;
    INT goodMask = 0;

    for (copyId=0; copyId<2; copyId++)
    {
        addr = NVM_scan(copyId);
        if (0 != addr)
        {
            // copy the latest version
            memcpy(&cfgNVMentry.data.cfg, &(((CFG_NVM_Entry_t*)addr)->data.cfg), sizeof(cfgNVMentry.data.cfg));
            goodMask |= (1 << copyId);
        }
    }
    if (0 == goodMask)
    {
        memcpy(&cfgNVMentry.data.cfg, &defaultCfg, sizeof(cfgNVMentry.data.cfg));
    }

    cfgNVMentry.data.magic = 0x1234;
    ++cfgNVMentry.data.id;
    cfgNVMentry.data.crc = CFG_crc16((UINT8*)&cfgNVMentry.data, sizeof(cfgNVMentry.data) - sizeof(cfgNVMentry.data.crc));

    for (copyId=0; copyId<2; copyId++)
    {
        if (!(goodMask & (1 << copyId)))
        {
            // restore bad copy
            NVM_save(copyId);
        }
    }

    UINT i;
    for (i=0; i < MaxDataSz; i++)
    {
        CPU_wrNVM(prmDefColors+i, 0);
    }
    CPU_wrNVM(cntErrReIni, CPU_rdNVM(cntErrReIni) + 1);

    lenFrame = cfg->dmx.numPix * nLayers;   //ƒ ’Ãﬁ “œ≈»Àﬁ
}

