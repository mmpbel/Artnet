#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-XC32-PIC32_ETH_SK_ETH795.mk)" "nbproject/Makefile-local-XC32-PIC32_ETH_SK_ETH795.mk"
include nbproject/Makefile-local-XC32-PIC32_ETH_SK_ETH795.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC32-PIC32_ETH_SK_ETH795
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../BerkeleyTCPClientDemo.c ../BerkeleyTCPServerDemo.c ../BerkeleyUDPClientDemo.c ../GenericTCPClient.c ../GenericTCPServer.c ../PingDemo.c ../SMTPDemo.c ../UARTConfig.c "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARCFOUR.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Announce.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/AutoIP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BerkeleyAPI.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt_helper_PIC32.S" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCPs.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNS.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNSs.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Delay.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DynDNS.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhyDP83848.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32IntMac.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FTP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FileSystem.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/HTTP2.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Hashes.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Helpers.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ICMP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/IP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/MPFS2.c" ../MPFSImg2.c "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/NBNS.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/RSA.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Random.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Reboot.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/SMTP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/StackTsk.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCPPerformanceTest.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Telnet.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Tick.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UART.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDP.c" "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDPPerformanceTest.c" ../CustomHTTPApp.c ../MainDemo.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o ${OBJECTDIR}/_ext/1472/GenericTCPClient.o ${OBJECTDIR}/_ext/1472/GenericTCPServer.o ${OBJECTDIR}/_ext/1472/PingDemo.o ${OBJECTDIR}/_ext/1472/SMTPDemo.o ${OBJECTDIR}/_ext/1472/UARTConfig.o ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o ${OBJECTDIR}/_ext/1840844407/ARP.o ${OBJECTDIR}/_ext/1840844407/Announce.o ${OBJECTDIR}/_ext/1840844407/AutoIP.o ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o ${OBJECTDIR}/_ext/1840844407/BigInt.o ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o ${OBJECTDIR}/_ext/1840844407/DHCP.o ${OBJECTDIR}/_ext/1840844407/DHCPs.o ${OBJECTDIR}/_ext/1840844407/DNS.o ${OBJECTDIR}/_ext/1840844407/DNSs.o ${OBJECTDIR}/_ext/1840844407/Delay.o ${OBJECTDIR}/_ext/1840844407/DynDNS.o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1840844407/FTP.o ${OBJECTDIR}/_ext/1840844407/FileSystem.o ${OBJECTDIR}/_ext/1840844407/HTTP2.o ${OBJECTDIR}/_ext/1840844407/Hashes.o ${OBJECTDIR}/_ext/1840844407/Helpers.o ${OBJECTDIR}/_ext/1840844407/ICMP.o ${OBJECTDIR}/_ext/1840844407/IP.o ${OBJECTDIR}/_ext/1840844407/MPFS2.o ${OBJECTDIR}/_ext/1472/MPFSImg2.o ${OBJECTDIR}/_ext/1840844407/NBNS.o ${OBJECTDIR}/_ext/1840844407/RSA.o ${OBJECTDIR}/_ext/1840844407/Random.o ${OBJECTDIR}/_ext/1840844407/Reboot.o ${OBJECTDIR}/_ext/1840844407/SMTP.o ${OBJECTDIR}/_ext/1840844407/StackTsk.o ${OBJECTDIR}/_ext/1840844407/TCP.o ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1840844407/Telnet.o ${OBJECTDIR}/_ext/1840844407/Tick.o ${OBJECTDIR}/_ext/1840844407/UART.o ${OBJECTDIR}/_ext/1840844407/UDP.o ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ${OBJECTDIR}/_ext/1472/MainDemo.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d ${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d ${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d ${OBJECTDIR}/_ext/1472/PingDemo.o.d ${OBJECTDIR}/_ext/1472/SMTPDemo.o.d ${OBJECTDIR}/_ext/1472/UARTConfig.o.d ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d ${OBJECTDIR}/_ext/1840844407/ARP.o.d ${OBJECTDIR}/_ext/1840844407/Announce.o.d ${OBJECTDIR}/_ext/1840844407/AutoIP.o.d ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d ${OBJECTDIR}/_ext/1840844407/BigInt.o.d ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d ${OBJECTDIR}/_ext/1840844407/DHCP.o.d ${OBJECTDIR}/_ext/1840844407/DHCPs.o.d ${OBJECTDIR}/_ext/1840844407/DNS.o.d ${OBJECTDIR}/_ext/1840844407/DNSs.o.d ${OBJECTDIR}/_ext/1840844407/Delay.o.d ${OBJECTDIR}/_ext/1840844407/DynDNS.o.d ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d ${OBJECTDIR}/_ext/1840844407/FTP.o.d ${OBJECTDIR}/_ext/1840844407/FileSystem.o.d ${OBJECTDIR}/_ext/1840844407/HTTP2.o.d ${OBJECTDIR}/_ext/1840844407/Hashes.o.d ${OBJECTDIR}/_ext/1840844407/Helpers.o.d ${OBJECTDIR}/_ext/1840844407/ICMP.o.d ${OBJECTDIR}/_ext/1840844407/IP.o.d ${OBJECTDIR}/_ext/1840844407/MPFS2.o.d ${OBJECTDIR}/_ext/1472/MPFSImg2.o.d ${OBJECTDIR}/_ext/1840844407/NBNS.o.d ${OBJECTDIR}/_ext/1840844407/RSA.o.d ${OBJECTDIR}/_ext/1840844407/Random.o.d ${OBJECTDIR}/_ext/1840844407/Reboot.o.d ${OBJECTDIR}/_ext/1840844407/SMTP.o.d ${OBJECTDIR}/_ext/1840844407/StackTsk.o.d ${OBJECTDIR}/_ext/1840844407/TCP.o.d ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d ${OBJECTDIR}/_ext/1840844407/Telnet.o.d ${OBJECTDIR}/_ext/1840844407/Tick.o.d ${OBJECTDIR}/_ext/1840844407/UART.o.d ${OBJECTDIR}/_ext/1840844407/UDP.o.d ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d ${OBJECTDIR}/_ext/1472/MainDemo.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o ${OBJECTDIR}/_ext/1472/GenericTCPClient.o ${OBJECTDIR}/_ext/1472/GenericTCPServer.o ${OBJECTDIR}/_ext/1472/PingDemo.o ${OBJECTDIR}/_ext/1472/SMTPDemo.o ${OBJECTDIR}/_ext/1472/UARTConfig.o ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o ${OBJECTDIR}/_ext/1840844407/ARP.o ${OBJECTDIR}/_ext/1840844407/Announce.o ${OBJECTDIR}/_ext/1840844407/AutoIP.o ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o ${OBJECTDIR}/_ext/1840844407/BigInt.o ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o ${OBJECTDIR}/_ext/1840844407/DHCP.o ${OBJECTDIR}/_ext/1840844407/DHCPs.o ${OBJECTDIR}/_ext/1840844407/DNS.o ${OBJECTDIR}/_ext/1840844407/DNSs.o ${OBJECTDIR}/_ext/1840844407/Delay.o ${OBJECTDIR}/_ext/1840844407/DynDNS.o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/1840844407/FTP.o ${OBJECTDIR}/_ext/1840844407/FileSystem.o ${OBJECTDIR}/_ext/1840844407/HTTP2.o ${OBJECTDIR}/_ext/1840844407/Hashes.o ${OBJECTDIR}/_ext/1840844407/Helpers.o ${OBJECTDIR}/_ext/1840844407/ICMP.o ${OBJECTDIR}/_ext/1840844407/IP.o ${OBJECTDIR}/_ext/1840844407/MPFS2.o ${OBJECTDIR}/_ext/1472/MPFSImg2.o ${OBJECTDIR}/_ext/1840844407/NBNS.o ${OBJECTDIR}/_ext/1840844407/RSA.o ${OBJECTDIR}/_ext/1840844407/Random.o ${OBJECTDIR}/_ext/1840844407/Reboot.o ${OBJECTDIR}/_ext/1840844407/SMTP.o ${OBJECTDIR}/_ext/1840844407/StackTsk.o ${OBJECTDIR}/_ext/1840844407/TCP.o ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1840844407/Telnet.o ${OBJECTDIR}/_ext/1840844407/Tick.o ${OBJECTDIR}/_ext/1840844407/UART.o ${OBJECTDIR}/_ext/1840844407/UDP.o ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ${OBJECTDIR}/_ext/1472/MainDemo.o

# Source Files
SOURCEFILES=../BerkeleyTCPClientDemo.c ../BerkeleyTCPServerDemo.c ../BerkeleyUDPClientDemo.c ../GenericTCPClient.c ../GenericTCPServer.c ../PingDemo.c ../SMTPDemo.c ../UARTConfig.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARCFOUR.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Announce.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/AutoIP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BerkeleyAPI.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt_helper_PIC32.S D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCPs.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNS.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNSs.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Delay.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DynDNS.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhyDP83848.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32IntMac.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FTP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FileSystem.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/HTTP2.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Hashes.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Helpers.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ICMP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/IP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/MPFS2.c ../MPFSImg2.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/NBNS.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/RSA.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Random.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Reboot.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/SMTP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/StackTsk.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCPPerformanceTest.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Telnet.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Tick.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UART.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDP.c D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDPPerformanceTest.c ../CustomHTTPApp.c ../MainDemo.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-XC32-PIC32_ETH_SK_ETH795.mk dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/BigInt_helper_PIC32.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.ok ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d" "${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/" -I"../Configs" -MMD -MF "${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d"  -o ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt_helper_PIC32.S"  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1 -I".."
	
else
${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/BigInt_helper_PIC32.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.ok ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d" "${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/" -I"../Configs" -MMD -MF "${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.d"  -o ${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt_helper_PIC32.S"  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1840844407/BigInt_helper_PIC32.o.asm.d",--gdwarf-2 -I".."
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o: ../BerkeleyTCPClientDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d" -o ${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o ../BerkeleyTCPClientDemo.c   
	
${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o: ../BerkeleyTCPServerDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d" -o ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o ../BerkeleyTCPServerDemo.c   
	
${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o: ../BerkeleyUDPClientDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d" -o ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o ../BerkeleyUDPClientDemo.c   
	
${OBJECTDIR}/_ext/1472/GenericTCPClient.o: ../GenericTCPClient.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPClient.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d" -o ${OBJECTDIR}/_ext/1472/GenericTCPClient.o ../GenericTCPClient.c   
	
${OBJECTDIR}/_ext/1472/GenericTCPServer.o: ../GenericTCPServer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPServer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d" -o ${OBJECTDIR}/_ext/1472/GenericTCPServer.o ../GenericTCPServer.c   
	
${OBJECTDIR}/_ext/1472/PingDemo.o: ../PingDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/PingDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PingDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/PingDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/PingDemo.o.d" -o ${OBJECTDIR}/_ext/1472/PingDemo.o ../PingDemo.c   
	
${OBJECTDIR}/_ext/1472/SMTPDemo.o: ../SMTPDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/SMTPDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/SMTPDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/SMTPDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/SMTPDemo.o.d" -o ${OBJECTDIR}/_ext/1472/SMTPDemo.o ../SMTPDemo.c   
	
${OBJECTDIR}/_ext/1472/UARTConfig.o: ../UARTConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/UARTConfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/UARTConfig.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/UARTConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/UARTConfig.o.d" -o ${OBJECTDIR}/_ext/1472/UARTConfig.o ../UARTConfig.c   
	
${OBJECTDIR}/_ext/1840844407/ARCFOUR.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d" -o ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARCFOUR.c"   
	
${OBJECTDIR}/_ext/1840844407/ARP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ARP.o.d" -o ${OBJECTDIR}/_ext/1840844407/ARP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARP.c"   
	
${OBJECTDIR}/_ext/1840844407/Announce.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Announce.o.d" -o ${OBJECTDIR}/_ext/1840844407/Announce.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Announce.c"   
	
${OBJECTDIR}/_ext/1840844407/AutoIP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/AutoIP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/AutoIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/AutoIP.o.d" -o ${OBJECTDIR}/_ext/1840844407/AutoIP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/AutoIP.c"   
	
${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d" -o ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BerkeleyAPI.c"   
	
${OBJECTDIR}/_ext/1840844407/BigInt.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/BigInt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/BigInt.o.d" -o ${OBJECTDIR}/_ext/1840844407/BigInt.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt.c"   
	
${OBJECTDIR}/_ext/1840844407/DHCP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DHCP.o.d" -o ${OBJECTDIR}/_ext/1840844407/DHCP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCP.c"   
	
${OBJECTDIR}/_ext/1840844407/DHCPs.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCPs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DHCPs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DHCPs.o.d" -o ${OBJECTDIR}/_ext/1840844407/DHCPs.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCPs.c"   
	
${OBJECTDIR}/_ext/1840844407/DNS.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DNS.o.d" -o ${OBJECTDIR}/_ext/1840844407/DNS.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNS.c"   
	
${OBJECTDIR}/_ext/1840844407/DNSs.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNSs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNSs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DNSs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DNSs.o.d" -o ${OBJECTDIR}/_ext/1840844407/DNSs.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNSs.c"   
	
${OBJECTDIR}/_ext/1840844407/Delay.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Delay.o.d" -o ${OBJECTDIR}/_ext/1840844407/Delay.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Delay.c"   
	
${OBJECTDIR}/_ext/1840844407/DynDNS.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DynDNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DynDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DynDNS.o.d" -o ${OBJECTDIR}/_ext/1840844407/DynDNS.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DynDNS.c"   
	
${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c"   
	
${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d" -o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhyDP83848.c"   
	
${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d" -o ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32IntMac.c"   
	
${OBJECTDIR}/_ext/1840844407/FTP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/FTP.o.d" -o ${OBJECTDIR}/_ext/1840844407/FTP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FTP.c"   
	
${OBJECTDIR}/_ext/1840844407/FileSystem.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FileSystem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FileSystem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/FileSystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/FileSystem.o.d" -o ${OBJECTDIR}/_ext/1840844407/FileSystem.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FileSystem.c"   
	
${OBJECTDIR}/_ext/1840844407/HTTP2.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/HTTP2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/HTTP2.o.d" -o ${OBJECTDIR}/_ext/1840844407/HTTP2.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/HTTP2.c"   
	
${OBJECTDIR}/_ext/1840844407/Hashes.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Hashes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Hashes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Hashes.o.d" -o ${OBJECTDIR}/_ext/1840844407/Hashes.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Hashes.c"   
	
${OBJECTDIR}/_ext/1840844407/Helpers.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Helpers.o.d" -o ${OBJECTDIR}/_ext/1840844407/Helpers.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Helpers.c"   
	
${OBJECTDIR}/_ext/1840844407/ICMP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ICMP.o.d" -o ${OBJECTDIR}/_ext/1840844407/ICMP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ICMP.c"   
	
${OBJECTDIR}/_ext/1840844407/IP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/IP.o.d" -o ${OBJECTDIR}/_ext/1840844407/IP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/IP.c"   
	
${OBJECTDIR}/_ext/1840844407/MPFS2.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/MPFS2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/MPFS2.o.d" -o ${OBJECTDIR}/_ext/1840844407/MPFS2.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/MPFS2.c"   
	
${OBJECTDIR}/_ext/1472/MPFSImg2.o: ../MPFSImg2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/MPFSImg2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/MPFSImg2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/MPFSImg2.o.d" -o ${OBJECTDIR}/_ext/1472/MPFSImg2.o ../MPFSImg2.c   
	
${OBJECTDIR}/_ext/1840844407/NBNS.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/NBNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/NBNS.o.d" -o ${OBJECTDIR}/_ext/1840844407/NBNS.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/NBNS.c"   
	
${OBJECTDIR}/_ext/1840844407/RSA.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/RSA.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/RSA.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/RSA.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/RSA.o.d" -o ${OBJECTDIR}/_ext/1840844407/RSA.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/RSA.c"   
	
${OBJECTDIR}/_ext/1840844407/Random.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Random.o.d" -o ${OBJECTDIR}/_ext/1840844407/Random.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Random.c"   
	
${OBJECTDIR}/_ext/1840844407/Reboot.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Reboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Reboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Reboot.o.d" -o ${OBJECTDIR}/_ext/1840844407/Reboot.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Reboot.c"   
	
${OBJECTDIR}/_ext/1840844407/SMTP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/SMTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/SMTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/SMTP.o.d" -o ${OBJECTDIR}/_ext/1840844407/SMTP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/SMTP.c"   
	
${OBJECTDIR}/_ext/1840844407/StackTsk.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/StackTsk.o.d" -o ${OBJECTDIR}/_ext/1840844407/StackTsk.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/StackTsk.c"   
	
${OBJECTDIR}/_ext/1840844407/TCP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/TCP.o.d" -o ${OBJECTDIR}/_ext/1840844407/TCP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCP.c"   
	
${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCPPerformanceTest.c"   
	
${OBJECTDIR}/_ext/1840844407/Telnet.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Telnet.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Telnet.o.d" -o ${OBJECTDIR}/_ext/1840844407/Telnet.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Telnet.c"   
	
${OBJECTDIR}/_ext/1840844407/Tick.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Tick.o.d" -o ${OBJECTDIR}/_ext/1840844407/Tick.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Tick.c"   
	
${OBJECTDIR}/_ext/1840844407/UART.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UART.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/UART.o.d" -o ${OBJECTDIR}/_ext/1840844407/UART.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UART.c"   
	
${OBJECTDIR}/_ext/1840844407/UDP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/UDP.o.d" -o ${OBJECTDIR}/_ext/1840844407/UDP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDP.c"   
	
${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDPPerformanceTest.c"   
	
${OBJECTDIR}/_ext/1472/CustomHTTPApp.o: ../CustomHTTPApp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d" -o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ../CustomHTTPApp.c   
	
${OBJECTDIR}/_ext/1472/MainDemo.o: ../MainDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/MainDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/MainDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/MainDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/MainDemo.o.d" -o ${OBJECTDIR}/_ext/1472/MainDemo.o ../MainDemo.c   
	
else
${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o: ../BerkeleyTCPClientDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o.d" -o ${OBJECTDIR}/_ext/1472/BerkeleyTCPClientDemo.o ../BerkeleyTCPClientDemo.c   
	
${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o: ../BerkeleyTCPServerDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o.d" -o ${OBJECTDIR}/_ext/1472/BerkeleyTCPServerDemo.o ../BerkeleyTCPServerDemo.c   
	
${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o: ../BerkeleyUDPClientDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o.d" -o ${OBJECTDIR}/_ext/1472/BerkeleyUDPClientDemo.o ../BerkeleyUDPClientDemo.c   
	
${OBJECTDIR}/_ext/1472/GenericTCPClient.o: ../GenericTCPClient.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPClient.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/GenericTCPClient.o.d" -o ${OBJECTDIR}/_ext/1472/GenericTCPClient.o ../GenericTCPClient.c   
	
${OBJECTDIR}/_ext/1472/GenericTCPServer.o: ../GenericTCPServer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/GenericTCPServer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/GenericTCPServer.o.d" -o ${OBJECTDIR}/_ext/1472/GenericTCPServer.o ../GenericTCPServer.c   
	
${OBJECTDIR}/_ext/1472/PingDemo.o: ../PingDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/PingDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PingDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/PingDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/PingDemo.o.d" -o ${OBJECTDIR}/_ext/1472/PingDemo.o ../PingDemo.c   
	
${OBJECTDIR}/_ext/1472/SMTPDemo.o: ../SMTPDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/SMTPDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/SMTPDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/SMTPDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/SMTPDemo.o.d" -o ${OBJECTDIR}/_ext/1472/SMTPDemo.o ../SMTPDemo.c   
	
${OBJECTDIR}/_ext/1472/UARTConfig.o: ../UARTConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/UARTConfig.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/UARTConfig.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/UARTConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/UARTConfig.o.d" -o ${OBJECTDIR}/_ext/1472/UARTConfig.o ../UARTConfig.c   
	
${OBJECTDIR}/_ext/1840844407/ARCFOUR.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ARCFOUR.o.d" -o ${OBJECTDIR}/_ext/1840844407/ARCFOUR.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARCFOUR.c"   
	
${OBJECTDIR}/_ext/1840844407/ARP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ARP.o.d" -o ${OBJECTDIR}/_ext/1840844407/ARP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ARP.c"   
	
${OBJECTDIR}/_ext/1840844407/Announce.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Announce.o.d" -o ${OBJECTDIR}/_ext/1840844407/Announce.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Announce.c"   
	
${OBJECTDIR}/_ext/1840844407/AutoIP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/AutoIP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/AutoIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/AutoIP.o.d" -o ${OBJECTDIR}/_ext/1840844407/AutoIP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/AutoIP.c"   
	
${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o.d" -o ${OBJECTDIR}/_ext/1840844407/BerkeleyAPI.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BerkeleyAPI.c"   
	
${OBJECTDIR}/_ext/1840844407/BigInt.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/BigInt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/BigInt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/BigInt.o.d" -o ${OBJECTDIR}/_ext/1840844407/BigInt.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/BigInt.c"   
	
${OBJECTDIR}/_ext/1840844407/DHCP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DHCP.o.d" -o ${OBJECTDIR}/_ext/1840844407/DHCP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCP.c"   
	
${OBJECTDIR}/_ext/1840844407/DHCPs.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCPs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DHCPs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DHCPs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DHCPs.o.d" -o ${OBJECTDIR}/_ext/1840844407/DHCPs.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DHCPs.c"   
	
${OBJECTDIR}/_ext/1840844407/DNS.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DNS.o.d" -o ${OBJECTDIR}/_ext/1840844407/DNS.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNS.c"   
	
${OBJECTDIR}/_ext/1840844407/DNSs.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNSs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DNSs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DNSs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DNSs.o.d" -o ${OBJECTDIR}/_ext/1840844407/DNSs.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DNSs.c"   
	
${OBJECTDIR}/_ext/1840844407/Delay.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Delay.o.d" -o ${OBJECTDIR}/_ext/1840844407/Delay.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Delay.c"   
	
${OBJECTDIR}/_ext/1840844407/DynDNS.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DynDNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/DynDNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/DynDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/DynDNS.o.d" -o ${OBJECTDIR}/_ext/1840844407/DynDNS.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/DynDNS.c"   
	
${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhy.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhy.c"   
	
${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o.d" -o ${OBJECTDIR}/_ext/1840844407/ETHPIC32ExtPhyDP83848.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32ExtPhyDP83848.c"   
	
${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o.d" -o ${OBJECTDIR}/_ext/1840844407/ETHPIC32IntMac.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ETHPIC32IntMac.c"   
	
${OBJECTDIR}/_ext/1840844407/FTP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/FTP.o.d" -o ${OBJECTDIR}/_ext/1840844407/FTP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FTP.c"   
	
${OBJECTDIR}/_ext/1840844407/FileSystem.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FileSystem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/FileSystem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/FileSystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/FileSystem.o.d" -o ${OBJECTDIR}/_ext/1840844407/FileSystem.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/FileSystem.c"   
	
${OBJECTDIR}/_ext/1840844407/HTTP2.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/HTTP2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/HTTP2.o.d" -o ${OBJECTDIR}/_ext/1840844407/HTTP2.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/HTTP2.c"   
	
${OBJECTDIR}/_ext/1840844407/Hashes.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Hashes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Hashes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Hashes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Hashes.o.d" -o ${OBJECTDIR}/_ext/1840844407/Hashes.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Hashes.c"   
	
${OBJECTDIR}/_ext/1840844407/Helpers.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Helpers.o.d" -o ${OBJECTDIR}/_ext/1840844407/Helpers.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Helpers.c"   
	
${OBJECTDIR}/_ext/1840844407/ICMP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/ICMP.o.d" -o ${OBJECTDIR}/_ext/1840844407/ICMP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/ICMP.c"   
	
${OBJECTDIR}/_ext/1840844407/IP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/IP.o.d" -o ${OBJECTDIR}/_ext/1840844407/IP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/IP.c"   
	
${OBJECTDIR}/_ext/1840844407/MPFS2.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/MPFS2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/MPFS2.o.d" -o ${OBJECTDIR}/_ext/1840844407/MPFS2.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/MPFS2.c"   
	
${OBJECTDIR}/_ext/1472/MPFSImg2.o: ../MPFSImg2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/MPFSImg2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/MPFSImg2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/MPFSImg2.o.d" -o ${OBJECTDIR}/_ext/1472/MPFSImg2.o ../MPFSImg2.c   
	
${OBJECTDIR}/_ext/1840844407/NBNS.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/NBNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/NBNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/NBNS.o.d" -o ${OBJECTDIR}/_ext/1840844407/NBNS.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/NBNS.c"   
	
${OBJECTDIR}/_ext/1840844407/RSA.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/RSA.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/RSA.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/RSA.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/RSA.o.d" -o ${OBJECTDIR}/_ext/1840844407/RSA.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/RSA.c"   
	
${OBJECTDIR}/_ext/1840844407/Random.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Random.o.d" -o ${OBJECTDIR}/_ext/1840844407/Random.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Random.c"   
	
${OBJECTDIR}/_ext/1840844407/Reboot.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Reboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Reboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Reboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Reboot.o.d" -o ${OBJECTDIR}/_ext/1840844407/Reboot.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Reboot.c"   
	
${OBJECTDIR}/_ext/1840844407/SMTP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/SMTP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/SMTP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/SMTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/SMTP.o.d" -o ${OBJECTDIR}/_ext/1840844407/SMTP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/SMTP.c"   
	
${OBJECTDIR}/_ext/1840844407/StackTsk.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/StackTsk.o.d" -o ${OBJECTDIR}/_ext/1840844407/StackTsk.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/StackTsk.c"   
	
${OBJECTDIR}/_ext/1840844407/TCP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/TCP.o.d" -o ${OBJECTDIR}/_ext/1840844407/TCP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCP.c"   
	
${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1840844407/TCPPerformanceTest.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/TCPPerformanceTest.c"   
	
${OBJECTDIR}/_ext/1840844407/Telnet.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Telnet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Telnet.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Telnet.o.d" -o ${OBJECTDIR}/_ext/1840844407/Telnet.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Telnet.c"   
	
${OBJECTDIR}/_ext/1840844407/Tick.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/Tick.o.d" -o ${OBJECTDIR}/_ext/1840844407/Tick.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/Tick.c"   
	
${OBJECTDIR}/_ext/1840844407/UART.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UART.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UART.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/UART.o.d" -o ${OBJECTDIR}/_ext/1840844407/UART.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UART.c"   
	
${OBJECTDIR}/_ext/1840844407/UDP.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/UDP.o.d" -o ${OBJECTDIR}/_ext/1840844407/UDP.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDP.c"   
	
${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o: D:/microchip_solutions_v2013-06-15/Microchip/TCPIP\ Stack/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1840844407 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o.d" -o ${OBJECTDIR}/_ext/1840844407/UDPPerformanceTest.o "D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack/UDPPerformanceTest.c"   
	
${OBJECTDIR}/_ext/1472/CustomHTTPApp.o: ../CustomHTTPApp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/CustomHTTPApp.o.d" -o ${OBJECTDIR}/_ext/1472/CustomHTTPApp.o ../CustomHTTPApp.c   
	
${OBJECTDIR}/_ext/1472/MainDemo.o: ../MainDemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/MainDemo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/MainDemo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/MainDemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -I".." -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/microchip_solutions_v2013-06-15/Microchip/TCPIP Stack" -I"../Configs" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/MainDemo.o.d" -o ${OBJECTDIR}/_ext/1472/MainDemo.o ../MainDemo.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}              -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=16000,--defsym=_min_stack_size=2048,-L"..",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem "-mperipheral-libs"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=16000,--defsym=_min_stack_size=2048,-L"..",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem "-mperipheral-libs"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/XC32-PIC32_ETH_SK_ETH795
	${RM} -r dist/XC32-PIC32_ETH_SK_ETH795

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
