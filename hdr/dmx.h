/* 
 * File:   dmx.h
 * Author: Mikhail.Palityka
 *
 * Created on January 20, 2014, 9:11 AM
 */

#ifndef DMX_H
#define        DMX_H

#ifdef        __cplusplus
extern "C" {
#endif

#ifdef _DMX_CODE

enum
{
    DMX_IDLE_STATE=0,   // no DMX data received yet
    DMX_BREAK_STATE,
    DMX_MAB_STATE,
    DMX_DATA_STATE,
    DMX_MBB_STATE,
    DMX_PAUSE_STATE,
//------------------
    DMX_RECEIVE_STATE,
//------------------
    DMX_ALL_STATE,
};

#define DMX_START_CODE   0
#define DMX_GVA_CODE     'G'

#define DMX_RETRANSMIT_TIME    TICKS_PER_SECOND

#define DMX_MBB_TIME      (100 * GetSystemClockMHz()) // DMX mark before break time in us - 0 us..1 sec
#define DMX_BREAK_TIME    (176 * GetSystemClockMHz()) // DMX break time in us - 88 us..1 sec
#define DMX_MAB_TIME      (12 * GetSystemClockMHz())  // DMX mark after break time in us - 8 us..1 sec

#define DMX_RX_TIMEOUT    (75000 * GetSystemClockMHz())  // DMX byte RX timeout us - 0 us..1 sec

#ifdef _DMX_CLIENT
#define DMX_MIN_RX_SIZE       5     // min number of bytes in DMX reply
#define DMX_MAX_RX_SIZE       17    // max number of bytes in DMX reply
#else // #ifdef _DMX_CLIENT
#define DMX_MIN_RX_SIZE       2     // min number of bytes in DMX reply
#define DMX_MAX_RX_SIZE       (MAX_DMX_SLOTS+1)    // max number of bytes in DMX reply
#endif // #ifdef _DMX_CLIENT

#endif // #ifdef _DMX_CODE

#ifdef _DMX_CLIENT
   #define MAX_DMX_SLOTS    512
#else // #ifdef _DMX_CLIENT
   #define MAX_DMX_SLOTS    10 //64     // 512
#endif // #ifdef _DMX_CLIENT

#define MAX_TX_SIZE       17    // max number of bytes in DMX request

#define DMX_MIN_CMD_SIZE  9

// GVA command structure
typedef struct _GVAcmd_t
{
    UINT8 gva;
    UINT8 size;
    UINT8 cmd;
    union
    {
        UINT32 uid;
        UINT8 dt[8];
        struct
        {
            UINT32 uid;
            UINT16 addr;
            UINT8 dt;
            UINT16 crc;
        } eep;
        struct
        {
            UINT32 uid;
            UINT16 time;
            UINT16 crc;
        } ftime;
        struct
        {
            UINT32 uid;
            UINT8 maxPix;
            UINT8 numLayers;
            UINT8 flags;
            UINT16 crc;
        } cfg;
        struct
        {
            UINT32 uid;
            UINT8 bitMask[8];
            UINT16 crc;
        } cmdBM;
        struct
        {
            UINT32 uid;
            UINT16 admx;
            UINT8 numPix;
            UINT8 flags;
            UINT16 crc;
        } dmxPrm;
        struct
        {
            UINT8 wdt;
            UINT8 reini;
        } err;
    } u;
} GVAcmd_t;

extern void GVA_init(void);
extern void GVA_handleCmd(GVAcmd_t *cmd);

extern void DMX_sendAnswer(UINT8 *buf, UINT size);
extern void DMX_stopTransfer(void);
extern void DMX_RX_ISR(void);
extern void DMX_TX_ISR(void);
extern void DMX_sendRdm(UINT8 *buf, UINT size);
extern UINT DMX_getChannel(UINT16 netAddr);
extern UINT8 * DMX_getBuf(void);
extern void DMX_activateChannel(void);

#ifdef        __cplusplus
}
#endif

#endif        /* DMX_H */