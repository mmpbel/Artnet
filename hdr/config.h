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
    UINT8 align1[1];    // make 32 bit aligned
} CFG_Dmx_t;

typedef struct _CFG_t
{
#ifdef _ARTNET
    CFG_Artnet_t art;
#endif // #ifdef _ARTNET
    CFG_Dmx_t dmx;
} CFG_t;

typedef union _CFG_NVM_Entry_t
{
    struct
    {
        UINT16 magic;
        UINT16 id;
        CFG_t cfg;
        UINT8 align2[2];    // make 32 bit aligned
        UINT16 crc;
    } data;
    UINT32 buf[8];
} CFG_NVM_Entry_t;

extern CFG_t *cfg;
extern volatile UINT32 UID;
extern UINT8 lenFrame;

#define CFG_FLASH_START_ADDR_0  0xbd070000
#define CFG_FLASH_START_ADDR_1  0xbd071000

#define CFG_NVM_STEP    (1<<5)  // 32
#define CFG_NVM_BUF_SIZE    (1<<12)   // 4096
#define CFG_NVM_ERASED_PTRN    0xFFFFFFFF


UINT16 CFG_crc16(UINT8 *buf,  UINT size);

enum
{
    RAM_SRC=0,
    FLASH_1_SRC,
    FLASH_2_SRC
};

#define prmDefColors (CFG_FLASH_START_ADDR_1 + sizeof(CFG_t) + sizeof(UINT16))

#define cntErrWDT       0x80
#define cntErrReIni     (cntErrWDT + 1)

extern UINT8 CFG_updateCRC(void);
extern void CFG_writeBuf(UINT offs, UINT8 *buf, UINT size);
extern void CFG_writeByte(UINT offs, UINT8 val);

#ifdef        __cplusplus
}
#endif

#endif        /* CONFIG_H */