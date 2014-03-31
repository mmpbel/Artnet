// Copyright (c) 2002-2010,  Microchip Technology Inc.
//
#ifndef __UART_H__
#define __UART_H__

#ifdef _UART_CODE

#define DEFAULT_BAUDRATE 			250000

#define Ux(y)         U1##y

#define UxBRG           Ux(BRG)
#define UxMODE          Ux(MODE)
#define UxSTA           Ux(STA)
#define UxSTAbits       Ux(STAbits)
#define UxSTACLR        Ux(STACLR)
#define UxSTASET        Ux(STASET)
#define UxTXREG         Ux(TXREG)
#define UxRXREG         Ux(RXREG)
#define UxTXIE          Ux(TXIE)
#define UxRXIE          Ux(RXIE)

#endif  // #ifdef _UART_CODE

#ifdef __cplusplus
extern "C" {
#endif

enum
{
    NO_INT=0,
    EN_INT,
};

extern void UART_initDmx(void);
extern void UART_enableDmxRx(UINT8 en_int);
extern void UART_disableDmxRx(void);
extern void UART_setDmxTimer(UINT32 us);
extern void UART_setDmxTx(void);
extern void UART_setDmxRx(void);
extern void UART_setDmxPortLow(void);
extern void UART_setDmxPortHigh(void);
extern void UART_disableDmxTimer(void);
extern void UART_enableDmxTxIrq(void);
extern void UART_disableDmxTxIrq(void);
extern void UART_disableDmxRxIrq(void);
extern void UART_sendDmxData(UINT8 txChar);
extern UINT8 UART_recvDmxData(void);
extern UINT8 UART_isDmxIdle (void);
extern UINT8 UART_isDmxUartIdle(void);
extern UINT8 UART_isDmxRecvError(void);
extern UINT8 UART_isTimeOut(void);
extern UINT8 UART_isDmxRecv(void);

#ifdef __cplusplus
}
#endif

#endif
