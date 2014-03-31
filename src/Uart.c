/*********************************************************************
 *
 *                  PIC32 Boot Loader
 *
 *********************************************************************
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
    while(UxSTAbits.UTXBF); // wait for TX buffer to be empty
    UxTXREG = txChar;
}

/**
@brief   send data into DMX UART
@return   none
*/
UINT8 UART_recvDmxData (void)
{
    return UxRXREG; // get data from UART RX FIFO
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
@return   UINT8 "0" - busy, "1" - idle
*/
UINT8 UART_isDmxUartIdle (void)
{
    return UxSTAbits.TRMT;
}

/**
@brief   set DMX TX pin high level
@return   none
*/
void UART_setDmxPortHigh (void)
{
    // change DMX UART polarity to normal
    UxSTAbits.UTXINV = 0;
}

/**
@brief   set DMX TX pin low level
@return   none
*/
void UART_setDmxPortLow (void)
{
    // change DMX UART polarity to negative
    UxSTAbits.UTXINV = 1;
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
    IEC0CLR = _IEC0_T2IE_MASK;	// Disable interrupt
    // clear flag
    IFS0CLR = _IFS0_T2IF_MASK;
}

/**
@brief   check if there was receive DMX UART error
@return   "1" - there was an error, "0" - no
*/
UINT8 UART_isDmxRecvError (void)
{
    return (UxSTA & _U2STA_FERR_MASK);
}

/**
@brief   check if a byte was received or in the process of receiving
@return   "0" - no, else "1"
*/
UINT8 UART_isDmxRecv (void)
{
    return (UxSTA & (_U2STA_RIDLE_MASK | _U2STA_URXDA_MASK));
}

/**
@brief   returns DMX timer status
@return   "1" - timeout, "0" - no
*/
UINT8 UART_isTimeOut (void)
{
    return IFS0bits.T2IF;
}

/**
@brief   enable DMX RX
@return   none
*/
void UART_enableDmxRx (UINT8 en_int)
{
    // dummy read
    volatile UINT8 temp = UxRXREG;
    // set DMX RX direction
    UART_setDmxRx();
    // clear OERR
    UxSTAbits.OERR = 0;
    // enable RX
    UxSTAbits.URXEN = 1;
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
    UxSTAbits.URXEN = 0;
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
    UxBRG = GetPeripheralClock() / 16 / DEFAULT_BAUDRATE - 1; // calculate actual BAUD generate value.
    UxMODE = UART_EN | UART_2STOPBITS;
    UxSTA = UART_RX_ENABLE | UART_TX_ENABLE;
}

/**
@brief   check if DMX is idle
@return   UINT8 "0" - busy, "1" - idle
*/
UINT8 UART_isDmxIdle (void)
{
    UINT8 res;
    IEC0CLR = _IEC0_U1TXIE_MASK | _IEC0_U1RXIE_MASK | _IEC0_T2IE_MASK;	// Disable interrupt
    res = UxSTAbits.TRMT && !IEC0bits.U1RXIE && !IEC0bits.U1TXIE && !IEC0bits.T2IE;
    IEC0SET = _IEC0_U1TXIE_MASK | _IEC0_U1RXIE_MASK | _IEC0_T2IE_MASK;	// Disable interrupt
    return res;
}

void __attribute((interrupt(ipl2), vector(_UART_1_VECTOR, _TIMER_2_VECTOR), nomips16)) _DmxInerrupt(void)
{
    if (IEC0bits.U1RXIE && (IFS0 & (_IFS0_U1RXIF_MASK || _IFS0_T2IF_MASK)))
    {
        DMX_RX_ISR();
    }
    else if ((IEC0bits.U1TXIE && IFS0bits.U1TXIF) || IFS0bits.T2IF)
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
    T2CON = _T2CON_ON_MASK | _T2CON_T32_MASK;
    PR2 = us;
    TMR2 = 0;
    IFS0bits.T2IF = 0;
    IEC0bits.T2IE = 1;
}

/***************************************End Of File*************************************/
