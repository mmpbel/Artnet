
/*
 * File:   dmx.c
 * Author: Mikhail.Palityka
 *
 * Created on January 20, 2014, 8:10 PM
 */

#ifdef _DMX

#include <stdio.h>
#include <string.h>

#include "main.h"
#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "TCPIP Stack/Tick.h"

#include "Uart.h"
#include "artnet.h"

#define _DMX_CODE
#include "dmx.h"
#undef _DMX_CODE

static UINT8 DMX_channelData[MAX_DMX_SLOTS+1];
static INT dmxState;
static UINT16 dmxBufPtr;

static UINT8* txBuf;
static UINT16 txSize;
static UINT16 rcvdSize = 0;

static UINT8 *rxRequest = 0;
static UINT8* rxBuf;
static UINT rxSize;

/**
@brief  start DMX receiving.

@return none.
*/
static void startReceive (UINT8 *buf, UINT size)
{
    rxBuf = buf;
    rxSize = size;
    // init data pointer
    dmxBufPtr = 0;
    // enable RX
    UART_enableDmxRx(EN_INT);
    // set DMX timer for receiving
    UART_setDmxTimer(DMX_RX_TIMEOUT);
}

/**
@brief  DMX init.

@return none.
*/
void DMX_init (void)
{
    UART_initDmx();
    dmxState = DMX_IDLE_STATE;
    GVA_init();
}

/**
@brief  Starts dmx transfer.

@return none.
*/
static void startTransfer (UINT8 *buf, UINT size)
{
    // wait DMX UART is idle
    while (!UART_isDmxUartIdle()) {};

#ifdef __DEF_DBG__
    if (!UART_isDmxIdle())
    {
        UART_disableDmxRx();
    }
#endif // #ifdef __DEF_DBG__
    txBuf = buf;
    txSize = size;
    // switch to output
    UART_setDmxTx();
    // send "break" - "0" for 88 us...1 sec
    UART_setDmxPortLow();
    dmxState = DMX_BREAK_STATE;
    UART_setDmxTimer(DMX_BREAK_TIME);
}

/**
@brief  Send DMX general packet.

@return none.
*/
static void sendDmxData (void)
{
    DMX_channelData[0] = DMX_START_CODE;
    rxRequest = 0;
    startTransfer(DMX_channelData, sizeof(DMX_channelData));
}

#ifdef _ARTNET
/**
@brief  Handle GVA command.

@return none.
*/
void handleGvaCmd (GVAcmd_t *cmd)
{
/*    // check CRC
    if (!CFG_crc16(RAM_SRC, (UINT8*)cmd, cmd->size + 5))
    {
        switch (cmd->cmd)
        {
            case 0x81:
                if ((7 == cmd->size) &&
                    (cmd->u.eep.uid == UID))
                {
                    // EEPROM write
                    CFG_writeBuf(cmd->u.eep.addr, &cmd->u.eep.dt, 1);
                    // send reply
                    cmd->cmd = 'Y';
                    cmd->u.eep.crc = CFG_crc16(RAM_SRC, (UINT8*)cmd, cmd->size + 3);
                    startTransfer((UINT8*)cmd, cmd->size + 5);
                }
                break;
            default:
                break;
        }
    }
*/
}
#endif // #ifdef _ARTNET

/**
@brief  Handle dmx transfer.

@return none.
*/
void DMX_Task (void)
{
#ifdef _DMX_CLIENT
    static UINT32 dmxTimer=0;
#endif // #ifdef _DMX_CLIENT

    if (rcvdSize)
    {
        // general DMX command
        if (DMX_START_CODE == rxBuf[0])
        {
            if (rcvdSize >= DMX_MIN_RX_SIZE)
            {
#ifdef _DALI
                DALI_setDaliData(&rxBuf[1 + cfg.dmx.addr]);
#endif // #ifdef _DALI
            }
        }
        else if (DMX_GVA_CODE == rxBuf[0])
        {
#ifdef _ARTNET
            // GVA reply
            if (   ('Y' == rxBuf[2])
                || ('N' == rxBuf[2])
                || ('P' == rxBuf[2])
                || ('d' == rxBuf[2]))
            {
                ART_sendReply(rcvdSize);
            }
            else    // GVA command
            {
                handleGvaCmd((GVAcmd_t*)rxBuf);
            }
#else // #ifdef _ARTNET
            if (rcvdSize >= DMX_MIN_CMD_SIZE)
            {
                //handle other commands
                GVA_handleCmd((GVAcmd_t*)rxBuf);
            }
#endif // #ifdef _ARTNET
        }
        rcvdSize = 0;
    }
#ifdef _DMX_CLIENT
    // send DMX packets every DMX_RETRANSMIT_TIME_MS
    if ((TickGet() - dmxTimer) >= DMX_RETRANSMIT_TIME)
    {
        dmxTimer = TickGet();
        if (DMX_PAUSE_STATE == dmxState)
        {
            // start DMX transfer if there was data received from ARTNET
//                sendDmxData();
        }
    }
#endif  // #ifdef _DMX_CLIENT
    // if DMX is IDLE then start receiving
    if (UART_isDmxIdle())
    {
        // if there is a receive request
        if (rxRequest)
        {
            startReceive(rxRequest, DMX_MAX_RX_SIZE);
            rxRequest = 0;
        }
        else
        {
            startReceive(DMX_channelData, sizeof(DMX_channelData));
        }
    }
}

/**
@brief  DMX TX ISR.

@return none.
*/
void DMX_TX_ISR (void)
{
    switch (dmxState)
    {
        case DMX_BREAK_STATE:
            // break was sent
            // send "Mark After Break" - "1" for 8 us - 1 sec
            UART_setDmxPortHigh();
            dmxState = DMX_MAB_STATE;
            UART_setDmxTimer(DMX_MAB_TIME);
            break;
        case DMX_MAB_STATE:
            // MAB was sent
            // send "start code"
            UART_disableDmxTimer();
            dmxBufPtr = 0;
            dmxState = DMX_DATA_STATE;
            UART_enableDmxTxIrq();
        case DMX_DATA_STATE:
            // send "start code" and data
            UART_sendDmxData(txBuf[dmxBufPtr]);
            if (++dmxBufPtr >= txSize)
            {
                dmxState = DMX_MBB_STATE;
            }
            break;
        case DMX_MBB_STATE:
            // Data was sent
            // send "Mark Before Break" - "1" for 0 us - 1 sec
            // stop DMX UART IRQ
            UART_disableDmxTxIrq();
            UART_setDmxTimer(DMX_MBB_TIME);
            dmxState = DMX_PAUSE_STATE;
            break;
        case DMX_PAUSE_STATE:
            // transfer is complete
            UART_disableDmxTimer();
        default:
            break;
    }
}

/**
@brief  returns DMX channel number based on the net address

@return none.
*/
UINT DMX_getChannel (UINT16 netAddr)
{
    // TODO: map netAddr to DMX channel
    return 0;
}

/**
@brief  returns DMX channel buffer address

@return none.
*/
UINT8 * DMX_getBuf (void)
{
    return &DMX_channelData[1];
}

/**
@brief  activate channel after receiving data for it

@return none.
*/
void DMX_activateChannel (void)
{
//    if (DMX_IDLE_STATE == dmxState)
    {
        // start DMX transfer
        sendDmxData();
    }
}

#ifdef _ARTNET
/**
@brief  start RDM transfer

@return none.
*/
void DMX_sendRdm (UINT8 *buf, UINT size)
{
    rxRequest = buf;
    startTransfer(buf, size);
}
#endif // #ifdef _ARTNET

/**
@brief  start DMX answer

@return none.
*/
void DMX_sendAnswer (UINT8 *buf, UINT size)
{
    rxRequest = 0;
    startTransfer(buf, size);
}

/**
@brief  DMX RX ISR.

@return none.
*/
void DMX_RX_ISR (void)
{
    if (UART_isDmxRecvError() // received a corrupted byte
        || UART_isTimeOut()  // timeout
        || (dmxBufPtr >= rxSize))  // received the maximum number of bytes
    {
        // reset receiving
        dmxState = DMX_PAUSE_STATE;
        // if enough data was received
        if (dmxBufPtr >= (DMX_MIN_RX_SIZE - 1))
        {
            // stop receiving
            UART_disableDmxRx();
            // send DMX data to ARTNET
            rcvdSize = dmxBufPtr + 1;
            dmxBufPtr = 0;
            return;
        }
#if 0//def _DMX_CLIENT
        else if (UART_isTimeOut())
        {
            // stop receiving
            UART_disableDmxRx();
            return;
        }
#endif // #ifdef _DMX_CLIENT
    }
    else if (DMX_PAUSE_STATE == dmxState)
    {
        dmxState = DMX_RECEIVE_STATE;
        dmxBufPtr = 0;
    }
    else
    {
        ++dmxBufPtr;
    }

    // receive one byte
    rxBuf[dmxBufPtr] = UART_recvDmxData();

    // restart DMX timer
    UART_setDmxTimer(DMX_RX_TIMEOUT);

#if 0//def _DMX_CLIENT
    // we don't expect to get any regular data here
    // so wait just for command starting with a nonzero byte
    if ((0 == dmxBufPtr) && (0 == rxBuf[0]))
    {
        // skip all zeros at the beginning
        dmxState = DMX_PAUSE_STATE;
    }
#endif // #ifdef _DMX_CLIENT
}

/**
@brief  Disable DMX activity.

@return none.
*/
void DMX_stopTransfer (void)
{
    UART_disableDmxTimer();
    UART_disableDmxRxIrq();
    UART_disableDmxTxIrq();
    dmxState = DMX_PAUSE_STATE;
    UART_setDmxRx();
}

#ifdef UNIT_TEST

void DMX_unitTest (void, UINT val)
{
    UINT i;

    for (i=1; i<(MAX_DMX_SLOTS + 1); i++)
    {
        DMX_channelData[i] = val;
    }
    // kickstart DMX
    startTransfer(DMX_channelData, sizeof(DMX_channelData));
}

#endif // #ifdef UNITTEST

#endif // #ifdef _DMX
