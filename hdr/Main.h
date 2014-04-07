/*********************************************************************
 *
 *                  Headers for TCPIP Demo App
 *
 *********************************************************************
 * FileName:        MainDemo.h
 * Dependencies:    Compiler.h
 * Processor:       PIC18, PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.05 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.30 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2010 Microchip Technology Inc.  All rights
 * reserved.
 *
 ********************************************************************/
#ifndef _MAINDEMO_H
#define _MAINDEMO_H

#define CPU_rdNVM(addr)    (*(BYTE*)(addr))
#define CPU_wrNVM(x, y)

#define strVersion "v0.0 ArtNet2Dmx"
#define FW_RELEASE_NUM  0x0100
#define OEM_CODE        (('G'<<8) | 'V')
#define ESTA_MANUF_CODE (('G'<<8) | 'V')

#define BAUD_RATE       (19200)		// bps

#define SaveAppConfig(a)

void PING_Task(void);
void ART_Task(void);
void DMX_Task(void);

void CFG_init(void);
INT CFG_updateNVM(void);

void DMX_init(void);

// Define a header structure for validating the AppConfig data structure in EEPROM/Flash
typedef struct
{
	unsigned short wConfigurationLength;	// Number of bytes saved in EEPROM/Flash (sizeof(APP_CONFIG))
	unsigned short wOriginalChecksum;		// Checksum of the original AppConfig defaults as loaded from ROM (to detect when to wipe the EEPROM/Flash record of AppConfig due to a stack change, such as when switching from Ethernet to Wi-Fi)
	unsigned short wCurrentChecksum;		// Checksum of the current EEPROM/Flash data.  This protects against using corrupt values if power failure occurs while writing them and helps detect coding errors in which some other task writes to the EEPROM in the AppConfig area.
} NVM_VALIDATION_STRUCT;


#endif // _MAINDEMO_H
