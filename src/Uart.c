/*********************************************************************
 * FileName:        Uart.c
 * Dependencies:
 * Processor:       PIC32
 *
 * Compiler:        MPLAB C32
 *                  MPLAB IDE
 * Company:         Microchip Technology, Inc.
 *
 **********************************************************************/
#include <p32xxxx.h>
#include <stdlib.h>
#include <plib.h>
#include "HardwareProfile.h"

#define _UART_CODE
#include "Uart.h"
#undef _UART_CODE

#include "dmx.h"

// PORT B bits
#define DMX_DIR_PIN_BIT          (_PORTB_RB8_MASK)

#define TIMER2_PRESCALE_256      (3<<_T2CON_TCKPS_POSITION)

/**
@brief   send data into DMX UART
@return   none
*/
void UART_sendDmxData (UINT8 txChar)
{
    // polling implementation
    while(U1STAbits.UTXBF); // wait for TX buffer to be empty
    U1TXREG = txChar;
}

/**
@brief   send data into DMX UART
@return   none
*/
UINT8 UART_recvDmxData (void)
{
    return U1RXREG; // get data from UART RX FIFO
}

/**
@brief   switch DMX channel to RX
@return   none
*/
void UART_setDmxRx (void)
{
    PORTB &= ~DMX_DIR_PIN_BIT;
}

/**
@brief   switch DMX channel to TX
@return   none
*/
void UART_setDmxTx (void)
{
    PORTB |= DMX_DIR_PIN_BIT;
}

/**
@brief   enable DMX TX IRQ
@return   none
*/
void UART_enableDmxTxIrq (void)
{
    IEC0SET = _IEC0_U1TXIE_MASK;
}

/**
@brief   disable DMX TX IRQ
@return   none
*/
void UART_disableDmxTxIrq (void)
{
    IEC0CLR = _IEC0_U1TXIE_MASK;
}

/**
@brief   disable DMX RX IRQ
@return   none
*/
void UART_disableDmxRxIrq (void)
{
    IEC0CLR = _IEC0_U1RXIE_MASK;
}

/**
@brief   check if DMX UART is idle
@return   BOOL "0" - busy, "1" - idle
*/
BOOL UART_isDmxUartIdle (void)
{
    return U1STAbits.TRMT;
}

/**
@brief   set DMX TX pin high level
@return   none
*/
void UART_setDmxPortHigh (void)
{
    // change DMX UART polarity to normal
    U1STAbits.UTXINV = 0;
}

/**
@brief   set DMX TX pin low level
@return   none
*/
void UART_setDmxPortLow (void)
{
    // change DMX UART polarity to negative
    U1STAbits.UTXINV = 1;
}

/**
@brief   disable DMX timer
@return   none
*/
void UART_disableDmxTimer (void)
{
    // disable timer
    T2CON = 0;
    // disable time interrupt
    IEC0CLR = _IEC0_T2IE_MASK | _IEC0_T3IE_MASK;	// Disable interrupt
    // clear flag
    IFS0CLR = _IFS0_T2IF_MASK | _IFS0_T3IF_MASK;
}

/**
@brief   check if there was receive DMX UART error
@return   "1" - there was an error, "0" - no
*/
BOOL UART_isDmxRecvError (void)
{
    return (U1STA & _U2STA_FERR_MASK);
}

/**
@brief   check if a byte was received or in the process of receiving
@return   "0" - no, else "1"
*/
BOOL UART_isDmxRecv (void)
{
    return (U1STA & (_U2STA_RIDLE_MASK | _U2STA_URXDA_MASK));
}

/**
@brief   returns DMX timer status
@return   "1" - timeout, "0" - no
*/
BOOL UART_isTimeOut (void)
{
    return IFS0 & (_IFS0_T2IF_MASK | _IFS0_T3IF_MASK);
}

/**
@brief   enable DMX RX
@return   none
*/
void UART_enableDmxRx (UINT en_int)
{
    // dummy read
    volatile UINT8 temp = U1RXREG;
    // set DMX RX direction
    UART_setDmxRx();
    // clear OERR
    U1STAbits.OERR = 0;
    // enable RX
    U1STAbits.URXEN = 1;
    if (en_int)
    {
        // enable RX IRQ
        IEC0SET = _IEC0_U1RXIE_MASK;
    }
}

/**
@brief   disable DMX RX
@return   none
*/
void UART_disableDmxRx (void)
{
    // disable RX IRQ
    IEC0CLR = _IEC0_U1RXIE_MASK;
    // set DMX TX direction
    UART_setDmxTx();
    // disable RX
    U1STAbits.URXEN = 0;
}

/**
@brief  initialize DMX interface
@return   none
*/
void UART_initDmx (void)
{
    #if (((__PIC32_FEATURE_SET__ >= 100) && (__PIC32_FEATURE_SET__ <= 299)))
        #error("TODO: For PIC32MX1xx/PIC32MX2xx devices, user should map the UART ports to required pins using PPS");
        /* Example code
                PPSInput(2,U2RX, RPA9);  //Assign U2RX to pin RPA09
        PPSOutput(4,RPC4,U2TX);   //Assign U2TX to pin RPC4
        //Do not forget to switch-off corrresponding "analog selection".
        ANSELx = 0;
        */
    #endif
    // UART 1 (DMX) - 8-bit, 250K, 2 stop bits
    U1BRG = GetPeripheralClock() / 16 / DEFAULT_BAUDRATE - 1; // calculate actual BAUD generate value.
    U1MODE = UART_EN | UART_2STOPBITS;
    U1STA = UART_RX_ENABLE | UART_TX_ENABLE;

    IPC3SET = 0x00000005; // Timer 2/3 set priority level = 1
    IPC6SET = 0x00000005; // UART1 set priority level = 1
}

/**
@brief   check if DMX is idle
@return   BOOL "0" - busy, "1" - idle
*/
BOOL UART_isDmxIdle (void)
{
    BOOL res;
    __builtin_disable_interrupts();	// Disable interrupt
    res = U1STAbits.TRMT && !(IEC0 & (_IEC0_U1RXIE_MASK | _IEC0_U1TXIE_MASK | _IEC0_T2IE_MASK | _IEC0_T3IE_MASK));
    __builtin_enable_interrupts();	// Disable interrupt
    return res;
}

void __ISR(_TIMER_3_VECTOR, ipl4) _DmxTimerInerrupt (void)
{
    if (IEC0bits.U1RXIE && (IFS0 & (_IFS0_U1RXIF_MASK | _IFS0_T2IF_MASK | _IFS0_T3IF_MASK)))
    {
        DMX_RX_ISR();
    }
    else if ((IEC0bits.U1TXIE && IFS0bits.U1TXIF) || (IFS0 & (_IFS0_T2IF_MASK | _IFS0_T3IF_MASK)))
    {
        DMX_TX_ISR();
    }
}

void __ISR(_UART_1_VECTOR, ipl4) _DmxUartInerrupt (void)
{
    if (IEC0bits.U1RXIE && (IFS0 & (_IFS0_U1RXIF_MASK | _IFS0_T2IF_MASK | _IFS0_T3IF_MASK)))
    {
        DMX_RX_ISR();
    }
    else if ((IEC0bits.U1TXIE && IFS0bits.U1TXIF) || (IFS0 & (_IFS0_T2IF_MASK | _IFS0_T3IF_MASK)))
    {
        DMX_TX_ISR();
    }
#ifdef _DBG_PRINT
    else if (RC2IF_b)
    {
    }
    else if (TX2IF_b)
    {
        PRN_UartISR();
    }
#endif // #ifdef __PRINT_IRQ__
}

/**
@brief   setup DMX TX timer
         use Timer2
         set 1 MHz timer, 32 bit counter
@return   none
*/
void UART_setDmxTimer (UINT32 us)
{
    // stop timers
    T2CON = 0;
    T3CON = 0;
    T2CONSET = _T2CON_T32_MASK;
    TMR2 = 0;
    PR2 = us;

    IFS0CLR = _IFS0_T2IF_MASK | _IFS0_T3IF_MASK;
    IEC0bits.T3IE = 1;
    T2CONSET = _T2CON_ON_MASK;
}

/***************************************End Of File*************************************/
