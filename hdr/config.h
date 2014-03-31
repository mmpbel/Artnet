/* 
 * File:   config.h
 * Author: Mikhail.Palityka
 *
 * Created on February 24, 2014, 4:26 PM
 */

#ifndef CONFIG_H
#define        CONFIG_H

#ifdef        __cplusplus
extern "C" {
#endif

typedef struct _CFG_Artnet_t
{
    UINT32 ip;
    UINT32 mask;
} CFG_Artnet_t;

typedef struct _CFG_Dmx_t
{
    UINT16 addr;
    UINT8 numPix;
    UINT8 flags;
    UINT8 polarity;
    UINT8 failLevel;
    UINT8 failTime;
} CFG_Dmx_t;

typedef struct _CFG_t
{
#ifdef _ARTNET
    CFG_Artnet_t art;
#endif // #ifdef _ARTNET
    CFG_Dmx_t dmx;
} CFG_t;

extern CFG_t cfg;
extern volatile UINT32 UID;
extern UINT8 lenFrame;

#define CFG_FLASH_START_ADDR_1  0
#define CFG_FLASH_START_ADDR_2  (CFG_FLASH_START_ADDR_1 + sizeof(CFG_t) + sizeof(UINT16))
#define CFG_DMX_OFFSET(x)        ((UINT16)(UINT32)&(((CFG_t*)0)->dmx.x))

UINT16 CFG_crc16(UINT8 src, UINT8 *buf,  UINT16 size);

enum
{
    RAM_SRC=0,
    FLASH_1_SRC,
    FLASH_2_SRC
};

#define prmDefColors (CFG_FLASH_START_ADDR_2 + sizeof(CFG_t) + sizeof(UINT16))

#define cntErrWDT       0x80
#define cntErrReIni     (cntErrWDT + 1)

extern UINT8 CFG_updateCRC(void);
extern void CFG_writeBuf(UINT16 offs, UINT8 *buf, UINT16 size);
extern void CFG_writeByte(UINT16 offs, UINT8 val);

#ifdef        __cplusplus
}
#endif

#endif        /* CONFIG_H */