
/*
 * File:   pic32.c
 * Author: Mikhail.Palityka
 *
 * Created on January 14, 2014, 12:07 PM
 */

#include "main.h"
#include "Compiler.h"

static UINT32 msTime;

//******************************************************************
//* Configuration Fuse Setings
//******************************************************************

/**
@brief  Initialize CPU.
@return   none
*/
void CPU_init (void)
{
}

#ifdef _SPI
/**
@brief   send a byte to SPI.
@return   none
*/
void spiSendData (char dt)
{
    volatile UINT8 temp = SSP1BUF; // read buffer reg to clear BF
    SSP1CON1 &= ~_SSP1CON1_WCOL_MASK;    // clear collisn flag
    SSP1BUF = dt;
#ifndef SIMULATOR
    while (!(SSP1STAT & _SSP1STAT_BF_MASK)) {};
#endif // #ifndef SIMULATOR
}

/**
@brief   receive a byte from SPI.
@return   char data
*/
char spiRecvData (void)
{
    return SSP1BUF;
}

#endif // #ifdef _SPI

/**
@brief  High-priority ISR
@return   none
*/
#if defined(__XC) || defined(HI_TECH_C)
void interrupt high_isr (void)
#elif defined (__18CXX)
#pragma code high_isr=0x08
#pragma interrupt high_isr
void high_isr (void)
#else
void interrupt (void)
#endif
{
    // Determine which flag generated the interrupt
    if (TMR2IF_b)
    {
        // restart timer
        TMR2 = 0;
        // cleart interrupt request flag
        TMR2IF_b = 0;
        ++msTime;   // increment second counter

#ifdef UNIT_TEST
        PORTC ^= TEST_PIN_P8_BIT;  // toggle P8
#endif // #ifdef UNIT_TEST

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
    else if (RC1IE_b && (RC1IF_b || TMR0IF_b))
    {
        DMX_RX_ISR();
    }
    else if ((TX1IE_b && TX1IF_b) || TMR0IF_b)
    {
        DMX_TX_ISR();
    }
}

/**
@brief   send data into DMX UART
@return   none
*/
void CPU_sendDmxData (UINT8 dt)
{
    // polling implementation
    while (! TX1IF_b) {};
    TXREG1 = dt;
}

/**
@brief   send data into DMX UART
@return   none
*/
UINT8 CPU_recvDmxData (void)
{
    return RCREG1;
}

/**
@brief   switch DMX channel to RX
@return   none
*/
void CPU_setDmxRx (void)
{
    PORTB &= ~DMX_DIR_PIN_BIT;
}

/**
@brief   switch DMX channel to TX
@return   none
*/
void CPU_setDmxTx (void)
{
    PORTB |= DMX_DIR_PIN_BIT;
}

/**
@brief   enable DMX TX IRQ
@return   none
*/
void CPU_enableDmxTxIrq (void)
{
    TX1IE_b = 1;
}

/**
@brief   disable DMX TX IRQ
@return   none
*/
void CPU_disableDmxTxIrq (void)
{
    TX1IE_b = 0;
}

/**
@brief   disable DMX RX IRQ
@return   none
*/
void CPU_disableDmxRxIrq (void)
{
    RC1IE_b = 0;
}

/**
@brief   check if DMX UART is idle
@return   UINT8 "0" - busy, "1" - idle
*/
UINT8  CPU_isDmxUartIdle (void)
{
    return TXSTA1 & _TXSTA1_TRMT_MASK;
}

/**
@brief   set DMX TX pin high level
@return   none
*/
void CPU_setDmxPortHigh (void)
{
    // change DMX UART polarity to normal
    BAUDCON1 &= ~_BAUDCON1_CKTXP_MASK;
}

/**
@brief   set DMX TX pin low level
@return   none
*/
void CPU_setDmxPortLow (void)
{
    // change DMX UART polarity to negative
    BAUDCON1 |= _BAUDCON1_CKTXP_MASK;
}

/**
@brief   disable DMX timer
@return   none
*/
void CPU_disableDmxTimer (void)
{
    // disable timer
    T0CON = 0;
    // disable time interrupt
    TMR0IE_b = 0;
    // clear flag
    TMR0IF_b = 0;
}

/**
@brief   enable DMX UART
@return   none
*/
void CPU_enableDmxUart (void)
{
    // enable UART
    RCSTA1 |= _RCSTA1_SPEN_MASK;
    // set DMX TX pin as input
    TRISC |= DMX_TX_PIN_BIT;
}

/**
@brief   disable DMX UART
@return   none
*/
void CPU_disableDmxUart (void)
{
    // disable UART
    RCSTA1 &= ~_RCSTA1_SPEN_MASK;
    // set DMX TX pin as output
    TRISC &= ~DMX_TX_PIN_BIT;
    // disable DMX UART interrupts
    TX1IE_b = 0;
}

/**
@brief   check if there was receive DMX UART error
@return   "1" - there was an error, "0" - no
*/
UINT8 CPU_isDmxRecvError (void)
{
    return (RCSTA1 & _RCSTA1_FERR_MASK);
}

/**
@brief   check if a byte was received or in the process of receiving
@return   "0" - no, else "1"
*/
UINT8 CPU_isDmxRecv (void)
{
    return RC1IF_b || !(BAUDCON1 & _BAUDCON1_RCIDL1_MASK);
}

/**
@brief   returns DMX timer status
@return   "1" - timeout, "0" - no
*/
UINT8 CPU_isTimeOut (void)
{
    return TMR0IF_b;
}

/**
@brief   enable DMX RX
@return   none
*/
void CPU_enableDmxRx (UINT8 en_int)
{
    // dummy read
    volatile UINT8 temp = RCREG1;
    // set DMX RX direction
    PORTB &= ~DMX_DIR_PIN_BIT;
    // clear OERR
    RCSTA1 &= ~_RCSTA1_CREN_MASK;
    // enable RX
    RCSTA1 |= _RCSTA1_CREN_MASK;
    if (en_int)
    {
        // enable RX IRQ
        RC1IE_b = 1;
    }
}

/**
@brief   disable DMX RX
@return   none
*/
void CPU_disableDmxRx (void)
{
    // disable RX IRQ
    RC1IE_b = 0;
    // set DMX TX direction
    PORTB |= DMX_DIR_PIN_BIT;
    // disable RX
    RCSTA1 &= ~_RCSTA1_CREN_MASK;
}

/**
@brief  initialize DMX interface
@return   none
*/
void CPU_initDmx (void)
{
    // UART 1 (DMX) - 8-bit, 250K
    // TX9D is used as a second stop bit
    BAUDCON1 = _BAUDCON1_BRG16_MASK;
    SPBRGH1 = 0;
    SPBRG1 = 31;
    TXSTA1 = _TXSTA1_TXEN_MASK | _TXSTA1_BRGH_MASK | _TXSTA1_TX9_MASK | _TXSTA1_TX9D_MASK;
    RCSTA1 = _RCSTA1_SPEN_MASK;
}

/**
@brief   check if DMX is idle
@return   UINT8 "0" - busy, "1" - idle
*/
UINT8 CPU_isDmxIdle (void)
{
    UINT8 res;
    GINT_DISABLE();
    res = (TXSTA1 & _TXSTA1_TRMT_MASK) && !RC1IE_b && !TX1IE_b && !TMR0IE_b;
    GINT_ENABLE();
    return res;
}

/**
@brief   make a delay of us
@return   none
*/
void CPU_delay_us (UINT8 us)
{
    do
    {
        int i;
        for (i=0; i<((CLK_CPU / 1000000)>>3); i++)
        {
            Nop();
        }
    } while (--us);
}
