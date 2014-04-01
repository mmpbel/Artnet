/* 
 * File:   artnet.h
 * Author: Mikhail.Palityka
 *
 * Created on January 17, 2014, 8:04 AM
 */

#ifndef ARTNET_H
#define ARTNET_H

#ifdef _ARTNET_CODE

#ifdef __cplusplus
extern "C" {
#endif

#define ARTNET_PORT     0x1936
#define ARTNET_PROTO_HI     0//2
#define ARTNET_PROTO_LO     14

#define ARTNET_RPLY_MAX_DELAY_MS   3000

#define PRIMARY_ARTNET_IP      0x02000000   // 2.0.0.0
#define DIRECTED_BROADCAST_IP  0x02FFFFFF   // 2.255.255.255
#define SECONDARY_ARTNET_IP    0x0A000000   // 10.0.0.0

#define CLASS_A_SUBNET_MASK    0xFF000000   // 255.0.0.0

// types of RDM commands - not from the spec
enum
{
    RDM_REQUEST = 0,
    RDM_REPLY
};

typedef struct _ArtPollPack_t
{
    UINT8 ID[8];
    UINT16 OpCode;      // The OpCode defines the class of data following ArtPoll within this UDP packet. Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14.
                            // Controllers should ignore communication with nodes using a protocol version lower than 14.
    UINT8 TalkToMe;     // Set behaviour of Node
    UINT8 Priority;     // The lowest priority of diagnostics message that should be sent.
    
} ArtPollPack_t;

// OpCodes
enum
{
    OpPoll=0x2000,      // This is an ArtPoll packet, no other data is contained in this UDP packet.
    OpPollReply=0x2100, // This is an ArtPollReply Packet. It contains device status information.
    OpDiagData=0x2300,  // Diagnostics and data logging packet.
    OpCommand=0x2400,   // Used to send text based parameter commands.
    OpOutput=0x5000,    // This is an ArtDmx data packet. It contains zero start code DMX512 information for a single Universe.
    OpNzs=0x5100,       // This is an ArtNzs data packet. It contains non-zero start code (except RDM) DMX512 information for a single Universe.
    OpAddress=0x6000,       // This is an ArtAddress packet. It contains remote programming information for a Node.
    OpInput=0x7000,         // This is an ArtInput packet. It contains enable ? disable data for DMX inputs.
    OpTodRequest=(int)0x8000,    // This is an ArtTodRequest packet. It is used to request a Table of Devices (ToD) for RDM discovery.
    OpTodData=(int)0x8100,       // This is an ArtTodData packet. It is used to send a Table of Devices (ToD) for RDM discovery.
    OpTodControl=(int)0x8200,    // This is an ArtTodControl packet. It is used to send RDM discovery control messages.
    OpRdm=(int)0x8300,           // This is an ArtRdm packet. It is used to send all non discovery RDM messages.
    OpRdmSub=(int)0x8400,        // This is an ArtRdmSub packet. It is used to send compressed, RDM Sub-Device data.
    OpVideoSetup=(int)0xa010,        // This is an ArtVideoSetup packet. It contains video screen setup information for nodes that implement the extended video features.
    OpVideoPalette=(int)0xa020,      // This is an ArtVideoPalette packet. It contains colour palette setup information for nodes that implement the extended video features.
    OpVideoData=(int)0xa040,         // This is an ArtVideoData packet. It contains display data for nodes that implement the extended video features.
    OpMacMaster=(int)0xf000,         // This is an ArtMacMaster packet. It is used to program the Node?s MAC address, Oem device type and ESTA manufacturer code.
                                    // This is for factory initialisation of a Node. It is not to be used by applications.
    OpMacSlave=(int)0xf100,          // This is an ArtMacSlave packet. It is returned by the node to acknowledge receipt of an ArtMacMaster packet.
    OpFirmwareMaster=(int)0xf200,    // This is an ArtFirmwareMaster packet. It is used to upload new firmware or firmware extensions to the Node.
    OpFirmwareReply=(int)0xf300,     // This is an ArtFirmwareReply packet. It is returned by the node
                                    // to acknowledge receipt of an ArtFirmwareMaster packet or ArtFileTnMaster packet.
    OpFileTnMaster=(int)0xf400,      // Uploads user file to node.

    OpFileFnMaster=(int)0xf500,      // Downloads user file from node.
    OpFileFnReply=(int)0xf600,       // Node acknowledge for downloads.
    OpIpProg=(int)0xf800,            // This is an ArtIpProg packet. It is used to reprogramme the IP, Mask and Port address of the Node.
    OpIpProgReply=(int)0xf900,       // This is an ArtIpProgReply packet. It is returned by the node to acknowledge receipt of an ArtIpProg packet.
    OpMedia=(int)0x9000,             // This is an ArtMedia packet. It is Unicast by a Media Server and acted upon by a Controller.
    OpMediaPatch=(int)0x9100,        // This is an ArtMediaPatch packet. It is Unicast by a Controller and acted upon by a Media Server.
    OpMediaControl=(int)0x9200,      // This is an ArtMediaControl packet. It is Unicast by a Controller and acted upon by a Media Server.
    OpMediaContrlReply=(int)0x9300,  // This is an ArtMediaControlReply packet. It is Unicast by a Media Server and acted upon by a Controller.
    OpTimeCode=(int)0x9700,          // This is an ArtTimeCode packet. It is used to transport time code over the network.
    OpTimeSync=(int)0x9800,          // Used to synchronise real time date and clock
    OpTrigger=(int)0x9900,           // Used to send trigger macros
    OpDirectory=(int)0x9a00,         // Requests a node's file list
    OpDirectoryReply=(int)0x9b00     // Replies to OpDirectory with file list
};

// NodeReport Codes
enum
{
    RcDebug=0x0000,             // Booted in debug mode (Only used in development)
    RcPowerOk=0x0001,           // Power On Tests successful
    RcPowerFail=0x0002,         // Hardware tests failed at Power On
    RcSocketWr1=0x0003,         // Last UDP from Node failed due to truncated length, Most likely caused by a collision.
    RcParseFail=0x0004,         // Unable to identify last UDP transmission. Check OpCode and packet length.
    RcUdpFail=0x0005,           // Unable to open Udp Socket in last transmission attempt
    RcShNameOk=0x0006,          // Confirms that Short Name programming via ArtAddress, was successful.
    RcLoNameOk=0x0007,          // Confirms that Long Name programming via ArtAddress, was successful.
    RcDmxError=0x0008,          // DMX512 receive errors detected.
    RcDmxUdpFull=0x0009,        // Ran out of internal DMX transmit buffers.
    RcDmxRxFull=0x000a,         // Ran out of internal DMX Rx buffers.
    RcSwitchErr=0x000b,         // Rx Universe switches conflict.
    RcConfigErr=0x000c,         // Product configuration does not match firmware.
    RcDmxShort=0x000d,          // DMX output short detected. See GoodOutput field.
    RcFirmwareFail=0x000e,      // Last attempt to upload new firmware failed.
    RcUserFail=0x000f          // User changed switch settings when address locked by remote programming. User changes ignored.
};

// Style Codes
enum
{
    StNode=0x00,            // A DMX to / from Art-Net device
    StController=0x01,      // A lighting console.
    StMedia=0x02,           // A Media Server.
    StRoute=0x03,           // A network routing device.
    StBackup=0x04,          // A backup device.
    StConfig=0x05,          // A configuration or diagnostic tool.
    StVisual=0x06           // A visualiser.
};

typedef struct _ArtPollReplyPack_t
{
    UINT8 ID[8];
    UINT16 OpCode;          // OpPollReply. Transmitted low byte first.
    UINT8 IpAddress[4];     // Array containing the Node?s IP address. First array entry is most significant byte of address.
    UINT16 Port;            // The Port is always 0x1936. Transmitted low byte first.
    UINT8 VersInfoH;        // High byte of Node?s firmware revision number. The Controller should only use this field to decide
                                // if a firmware update should proceed. The convention is that a higher number is a more recent release of firmware.
    UINT8 VersInfoL;        // Low byte of Node?s firmware revision number.
    UINT8 NetSwitch;        // Bits 14-8 of the 15 bit Port-Address are encoded into the bottom 7 bits of this field.
                                // This is used in combination with SubSwitch and SwIn[] or SwOut[] to produce the full universe address.
    UINT8 SubSwitch;        // Bits 7-4 of the 15 bit Port-Address are encoded into the bottom 4 bits of this field.
                                // This is used in combination with NetSwitch and SwIn[] or SwOut[] to produce the full universe address.
    UINT8 OemHi;            // The high byte of the Oem value.
    UINT8 OemL;             // The low byte of the Oem value. The Oem word describes the equipment vendor and
                                // the feature set available. Bit 15 high indicates extended features available.
    UINT8 UbeaVersion;      // This field contains the firmware version of the User Bios Extension Area (UBEA).
                                // If the UBEA is not programmed, this field contains zero.
    UINT8 Status1;          // General Status register
                                // Bit:
                                // 7-6 Indicator state.
                                //      00 Indicator state unknown.
                                //      01 Indicators in Locate Mode.
                                //      10 Indicators in Mute Mode.
                                //      11 Indicators in Normal Mode.
                                // 5-4 Port Address Programming Authority
                                //      00 Port Address Programming Authority unknown.
                                //      01 All Port Address set by front panel controls.
                                //      10 All or part of Port Address programmed by network.
                                //      11 Not used.
                                // 3 Not implemented, transmit as zero, receivers do not test.
                                // 2 0 = Normal firmware boot (from flash). Nodes that do not support dual boot, clear this field to zero.
                                //   1 = Booted from ROM.
                                // 1 0 = Not capable of Remote Device Management (RDM).
                                //   1 = Capable of Remote Device Management (RDM).
                                // 0 0 = UBEA not present or corrupt
                                //   1 = UBEA present
    UINT8 EstaManLo;        // The ESTA manufacturer code. These codes are used to represent equipment manufacturer. They are assigned by ESTA.
                                // This field can be interpreted as two ASCII bytes representing the manufacturer initials.
    UINT8 EstaManHi;        // Hi byte of above
    UINT8 ShortName [18];   // The array represents a null terminated short name for the Node. The Controller uses the ArtAddress packet
                                // to program this string. Max length is 17 characters plus the null. This is a fixed length field,
                                // although the string it contains can be shorter than the field.
    UINT8 LongName [64];    // The array represents a null terminated long name for the Node. The Controller uses the ArtAddress packet
                                // to program this string. Max length is 63 characters plus the null. This is a fixed length field,
                                // although the string it contains can be shorter than the field.
    UINT8 NodeReport[64];   // The array is a textual report of the Node?s operating status or operational errors. It is primarily intended
                                // for ?engineering? data rather than ?end user? data. The field is formatted as: ?#xxxx [yyyy..] zzzzz??
                                // xxxx is a hex status code as defined in Table 3. yyyy is a decimal counter
                                // that increments every time the Node sends an ArtPollResponse. This allows the controller to monitor event changes in the Node.
                                // zzzz is an English text string defining the status.
                                // This is a fixed length field, although the string it contains can be shorter than the field.
    UINT8 NumPortsHi;       // The high byte of the word describing the number of input or output ports.
                                // The high byte is for future expansion and is currently zero.
    UINT8 NumPortsLo;       // The low byte of the word describing the number of input or output ports. If number of inputs is not equal to number of outputs,
                                // the largest value is taken. Zero is a legal value if no input or output ports are implemented. The maximum value is 4.
    UINT8 PortTypes[4];     // This array defines the operation and protocol of each channel. (Ether-Lynx example = 0xc0, 0xc0, 0xc0, 0xc0).
                                // The array length is fixed, independent of the number of inputs or outputs physically available on the Node.
                                // Bit:
                                // 7 Set is this channel can output data from the Art-Net Network.
                                // 6 Set if this channel can input onto the Art-NetNetwork.
                                // 5-0 00000 = DMX512
                                //     00001 = MIDI
                                //     00010 = Avab
                                //     00011 = Colortran CMX
                                //     00100 = ADB 62.5
                                //     00101 = Art-Net
    UINT8 GoodInput[4];     // This array defines input status of the node.
                                // Bit:
                                // 7 Set ? Data received.
                                // 6 Set ? Channel includes DMX512 test packets.
                                // 5 Set ? Channel includes DMX512 SIP?s.
                                // 4 Set ? Channel includes DMX512 text packets.
                                // 3 Set ? Input is disabled.
                                // 2 Set ? Receive errors detected.
                                // 1-0 Unused and transmitted as zero.
    UINT8 GoodOutput[4];    // This array defines output status of the node.
                                // Bit:
                                // 7 Set ? Data is being transmitted.
                                // 6 Set ? Channel includes DMX512 test packets.
                                // 5 Set ? Channel includes DMX512 SIP?s.
                                // 4 Set ? Channel includes DMX512 text packets.
                                // 3 Set ? Output is merging ArtNet data.
                                // 2 Set ? DMX output short detected on power up
                                // 1 Set ? Merge Mode is LTP.
                                // 0 Unused and transmitted as zero.
    UINT8 SwIn[4];          // Bits 3-0 of the 15 bit Port-Address for each of the 4 possible input ports are encoded into the low nibble.
    UINT8 SwOut[4];         // Bits 3-0 of the 15 bit Port-Address for each of the 4 possible output ports are encoded into the low nibble.
    UINT8 SwVideo;          // Set to 00 when video display is showing local data. Set to 01 when video is showing ethernet data.
    UINT8 SwMacro;          // If the Node supports macro key inputs, this byte represents the trigger values.
                                // The Node is responsible for ?debouncing? inputs. When the ArtPollReply is set to transmit automatically,
                                // (TalkToMe Bit 1), the ArtPollReply will be sent on both key down and key up events.
                                // However, the Controller should not assume that only one bit position has changed.
                                // The Macro inputs are used for remote event triggering or cueing. Bit fields are active high.
                                // Bit:
                                // 7 Set ? Macro 8 active.
                                // 6 Set ? Macro 7 active.
                                // 5 Set ? Macro 6 active.
                                // 4 Set ? Macro 5 active.
                                // 3 Set ? Macro 4 active.
                                // 2 Set ? Macro 3 active.
                                // 1 Set ? Macro 2 active.
                                // 0 Set ? Macro 1 active.
    UINT8 SwRemote;         // If the Node supports remote trigger inputs, this byte represents the trigger values.
                                // The Node is responsible for ?debouncing? inputs. When the ArtPollReply is set to transmit automatically,
                                // (TalkToMe Bit 1), the ArtPollReply will be sent on both key down and key up events.
                                // However, the Controller should not assume that only one bit position has changed.
                                // The Remote inputs are used for remote event triggering or cueing. Bit fields are active high.
                                // Bit:
                                // 7 Set ? Remote 8 active.
                                // 6 Set ? Remote 7 active.
                                // 5 Set ? Remote 6 active.
                                // 4 Set ? Remote 5 active.
                                // 3 Set ? Remote 4 active.
                                // 2 Set ? Remote 3 active.
                                // 1 Set ? Remote 2 active.
                                // 0 Set ? Remote 1 active.
    UINT8 Spare1[3];        // Not used, set to zero
    UINT8 Style;            // The Style code defines the equipment style of the device.
    UINT8 MAC[6];           // MAC Address.  Hi Byte is sent first. Set to zero if node cannot supply this information.
    UINT8 BindIp[4];        // If this unit is part of a larger or modular product, this is the IP of the root device.
    UINT8 BindIndex;        // Set to zero if no binding, otherwise this number represents the order of bound devices.
                                // A lower number means closer to root device. A value of 1 means root device.
    UINT8 Status2;          // Bit:
                                // 0 Set = Product supports web browser configuration.
                                // 1 Clr = Node?s IP is manually configured.
                                //   Set = Node?s IP is DHCP configured.
                                // 2 Clr = Node is not DHCP capable.
                                //   Set = Node is DHCP capable.
                                // 3 Clr = Node supports 8 bit Port-Address (Art-Net II).
                                //   Set = Node supports 15 bit Port-Address (Art-Net 3).
    UINT8 Filler[26];       // Transmit as zero. For future expansion.

} ArtPollReplyPack_t;

typedef struct _ArtIpProgPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpIpProg Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Pad length to match ArtPoll.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 Command;      // Action this packet as follows:
                            // Defines the how this packet is processed. If all bits are clear, this is an enquiry only.
                            // 7 Set to enable any programming.
                            // 6 Set to enable DHCP (if set ignore lower bits).
                            // 5-4 Not used, transmit as zero
                            // 3 Set to return all three parameters to default
                            // 2 Program IP Address
                            // 1 Program Subnet Mask
                            // 0 Program Port
    UINT8 Filler4;  // Set to zero. Pads data structure for word alignment.
    UINT8 ProgIpHi; // IP Address to be programmed into Node if enabled by Command Field
    UINT8 ProgIp2;
    UINT8 ProgIp1;
    UINT8 ProgIpLo;
    UINT8 ProgSmHi; // Subnet mask to be programmed into Node if enabled by Command Field
    UINT8 ProgSm2;
    UINT8 ProgSm1;
    UINT8 ProgSmLo;
    UINT8 ProgPortHi;   // PortAddress to be programmed into Node if enabled by Command Field
    UINT8 ProgPortLo;
    UINT8 Spare[8];     // Transmit as zero, receivers don?t test.
    
} ArtIpProgPack_t;

typedef struct _ArtIpProgReplyPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpIpProgReply Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. (14)
    UINT8 Filler1[2];   // Pad length to match ArtPoll.
    UINT8 Filler2[2];   // Pad length to match ArtIpProg.
    UINT8 ProgIpHi;     // IP Address of Node.
    UINT8 ProgIp2;
    UINT8 ProgIp1;
    UINT8 ProgIpLo;
    UINT8 ProgSmHi;     // Subnet mask of Node.
    UINT8 ProgSm2;
    UINT8 ProgSm1;
    UINT8 ProgSmLo;
    UINT8 ProgPortHi;   // Port Address of Node.
    UINT8 ProgPortLo;
    UINT8 Status;       // Bit 7 0
                        // Bit 6 DHCP enabled.
                        // Bit 5-0 0
    UINT8 Spare[7];     // Transmit as zero, receivers don?t test.
    
} ArtIpProgReplyPack_t;


typedef struct _ArtAddressPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpAddress. Transmitted low byte first.
    UINT8  ProtVerHi;   // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 NetSwitch;        // Bits 14-8 of the 15 bit Port-Address are encoded into the bottom 7 bits of this field.
                                // This is used in combination with SubSwitch and SwIn[] or SwOut[] to produce the full universe address.
                                // This value is ignored unless bit 7 is high. i.e. to program a value 0x07, send the value as 0x87.
                                // Send 0x00 to reset this value to the physical switch setting.
                                // Use value 0x7f for no change.
    UINT8 Filler2;          // Pad length to match ArtPoll.
    UINT8 ShortName[18];    // The array represents a null terminated short name for the Node.
                                // The Controller uses the ArtAddress packet to program this string.
                                // Max length is 17 characters plus the null. The Node will ignore this value if the string is null.
                                // This is a fixed length field, although the string it contains can be shorter than the field.
    UINT8 LongName[64];     // The array represents a null terminated long name for the Node.
                                // The Controller uses the ArtAddress packet to program this string. Max length is 63 characters plus the null.
                                // The Node will ignore this value if the string is null.
                                // This is a fixed length field, although the string it contains can be shorter than the field.
    UINT8 SwIn[4];          // Bits 3-0 of the 15 bit Port-Address for a given input port are encoded into the bottom 4 bits of this field.
                                // This is used in combination with NetSwitch and SubSwitch to produce the full universe address.
                                // This value is ignored unless bit 7 is high. i.e. to program a value 0x07, send the value as 0x87.
                                // Send 0x00 to reset this value to the physical switch setting. Use value 0x7f for no change.
    UINT8 SwOut[4];         // Bits 3-0 of the 15 bit Port-Address for a given output port are encoded into the bottom 4 bits of this field.
                                // This is used in combination with NetSwitch and SubSwitch to produce the full universe address.
                                // This value is ignored unless bit 7 is high. i.e. to program a value 0x07, send the value as 0x87.
                                // Send 0x00 to reset this value to the physical switch setting. Use value 0x7f for no change.
    UINT8 SubSwitch;        // Bits 7-4 of the 15 bit Port-Address are encoded into the bottom 4 bits of this field.
                                // This is used in combination with NetSwitch and SwIn[] or SwOut[] to produce the full universe address.
                                // This value is ignored unless bit 7 is high. i.e. to program a value 0x07, send the value as 0x87.
                                // Send 0x00 to reset this value to the physical switch setting. Use value 0x7f for no change.
    UINT8 SwVideo;          // Reserved.
    UINT8 Command;          // Node configuration commands:
    
} ArtAddressPack_t;

// Node configuration commands
enum
{
    AcNone=0x00,            // No action
    AcCancelMerge=0x01,     // If Node is currently in merge mode, cancel merge mode upon receipt of next ArtDmx packet.
    AcLedNormal=0x02,       // The front panel indicators of the Node operate normally.
    AcLedMute=0x03,         // The front panel indicators of the Node are disabled and switched off.
    AcLedLocate=0x04,       // Rapid flashing of the Node?s front panel indicators. It is intended as an outlet locator for large installations.
    AcResetRx=0x05,         // Flags Resets the Node?s Sip, Text, Test and data error flags. If an output short is being flagged, forces the test to rerun.
                            // Node configuration commands: Note that Ltp / Htp settings should be retained by the node during power cycling.
    AcMergeLtp0=0x10,       // Set DMX Port 0 to Merge in LTP mode.
    AcMergeLtp1=0x11,       // Set DMX Port 1 to Merge in LTP mode.
    AcMergeLtp2=0x12,       // Set DMX Port 2 to Merge in LTP mode.
    AcMergeLtp3=0x13,       // Set DMX Port 3 to Merge in LTP mode.
    AcMergeHtp0=0x50,       // Set DMX Port 0 to Merge in HTP (default) mode.
    AcMergeHtp1=0x51,       // Set DMX Port 1 to Merge in HTP (default) mode.
    AcMergeHtp2=0x52,       // Set DMX Port 2 to Merge in HTP (default) mode.
    AcMergeHtp3=0x53,       // Set DMX Port 3 to Merge in HTP (default) mode.
    AcClearOp0=0x90,        // Clear DMX Output buffer for Port 0
    AcClearOp1=0x91,        // Clear DMX Output buffer for Port 1
    AcClearOp2=0x92,        // Clear DMX Output buffer for Port 2
    AcClearOp3=0x93         // Clear DMX Output buffer for Port 3
};

typedef struct _ArtDiagDataPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT16 ProtVerHi;   // High byte of the Art-Net protocol revision number.
    UINT16 ProtVerLo;   // Low byte of the Art-Net protocol revision number. Current value 14
    UINT16 Filler1;     // Ignore by receiver, set to zero by sender.
    UINT16 Priority;    // The priority of this diagnostic data.
    UINT16 Filler2;     // Ignore by receiver, set to zero by sender.
    UINT16 Filler3;     // Ignore by receiver, set to zero by sender.
    UINT16 LengthHi;    // The length of the text array below. High Byte.
    UINT16 LengthLo;    // Low Byte.
    UINT16 Data[512];   // ASCII text array, null terminated. Max length is 512 bytes including the null terminator.

} ArtDiagDataPack_t;

// Priority Codes
enum
{
    DpLow=0x10,         // Low priority message.
    DpMed=0x40,         // Medium priority message.
    DpHigh=0x80,        // High priority message.
    DpCritical=0xe0,    // Critical priority message.
    DpVolatile=0xff,    // Volatile message. Messages of this type are displayed on a single line in the DMX-Workshop diagnostics display.
                            // All other types are displayed in a list box.
};

typedef struct _ArtTimeCodePack_t
{
    UINT8 ID[8];    // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;  // OpTimeCode. Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Ignore by receiver, set to zero by sender.
    UINT8 Filler2;      // Ignore by receiver, set to zero by sender.
    UINT8 Frames;       // Frames time. 0 ? 29 depending on mode.
    UINT8 Seconds;      // Seconds. 0 - 59.
    UINT8 Minutes;      // Minutes. 0 - 59.
    UINT8 Hours;        // Hours. 0 - 23.
    UINT8 Type;         // 0 = Film (24fps)
                        // 1 = EBU (25fps)
                        // 2 = DF (29.97fps)
                        // 3 = SMPTE (30fps)

} ArtTimeCodePack_t;

typedef struct _ArtDmxPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Sequence;     // The sequence number is used to ensure that ArtDmx packets are used in the correct order.
                            // When Art-Net is carried over a medium such as the Internet,
                            // it is possible that ArtDmx packets will reach the receiver out of order.
                            // This field is incremented in the range 0x01 to 0xff to allow the receiving node to resequence packets.
                            // The Sequence field is set to 0x00 to disable this feature.
    UINT8 Physical;     // The physical input port from which DMX512 data was input. This field is for information only.
                            // Use Universe for data routing.
    UINT8 SubUni;       // The low byte of the 15 bit Port-Address to which this packet is destined.
    UINT8 Net;          // The top 7 bits of the 15 bit Port-Address to which this packet is destined.
    UINT8 LengthHi;     // The length of the DMX512 data array. This value should be an even number in the range 2 ? 512.
                            // It represents the number of DMX512 channels encoded in packet.
                            // NB: Products which convert Art-Net to DMX512 may opt to always send 512 channels. High Byte.
    UINT8 Length;       // Low Byte of above.
#ifdef _WINDOWS
    UINT8 Data[MAX_DMX_SLOTS];    // An variable length array of DMX512 lighting data.
#else // #ifdef _WINDOWS
    UINT8 Data[1/*512*/];    // An variable length array of DMX512 lighting data.
#endif // #ifdef _WINDOWS
} ArtDmxPack_t;

typedef struct _ArtInputPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Pad length to match ArtPoll.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 NumPortsHi;   // The high byte of the word describing the number of input or output ports.
                            // The high byte is for future expansion and is currently zero.
    UINT8 NumPortsLo;       // The low byte of the word describing the number of input or output ports.
                            // If number of inputs is not equal to number of outputs, the largest value is taken.
                            // The maximum value is 4.
    UINT8 Input[4];      // This array defines input disable status of each channel.
                            // (Example = 0x01, 0x00, 0x01, 0x00 to disable first and third inputs)
                            // 7-1 Not currently used
                            // 0 Set to disable this input.
    
} ArtInputPack_t;

typedef struct _ArtFirmwareMasterPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Pad length to match ArtPoll.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 Type;         // Defines the packet contents
    UINT8 BlockId;      // Counts the consecutive blocks of firmware upload. Starting at 0x00 for the FirmFirst or UbeaFirst packet.
    UINT8 FirmwareLength3;      // The total number of words (Int16) in the firmware upload plus the firmware header size.
                                    // Eg a 32K word upload plus 530 words of header information == 0x00008212.
                                    // This value is also the file size (in words) of the file to be uploaded.
    UINT8 FirmwareLength2;
    UINT8 FirmwareLength1;
    UINT8 FirmwareLength0;      // LSB
    UINT8 Spare[20];            // Controller sets to zero, Node does not test.
    UINT8 Data[512];            // This array contains the firmware or UBEA data block. The order is hi byte first.
                                    // The interpretation of this data is manufacturer specific.

} ArtFirmwareMasterPack_t;

// FirmwareMaster packet content type
enum
{
    FirmFirst=0x00,     // The first packet of a firmware upload.
    FirmCont=0x01,      // A consecutive continuation packet of a firmware upload.
    FirmLast=0x02,      // The last packet of a firmware upload.
    UbeaFirst=0x03,     // The first packet of a UBEA upload.
    UbeaCont=0x04,      // A consecutive continuation packet of a UBEA upload.
    UbeaLast=0x05       // The last packet of a UBEA upload.
};

typedef struct _ArtFirmwareReplyPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Pad length to match ArtPoll.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 Type;         // Defines the packet contents as follows. Codes are used for both firmware and UBEA.
    UINT8 Spare[21];    // Node sets to zero, Controller does not test.
} ArtFirmwareReplyPack_t;

// ArtFirmwareReply packet content type
enum
{
    FirmBlockGood=0x00, // Last packet received successfully.
    FirmAll=0x01,       // Good All firmware received successfully.
    FirmFail=0xff       // Firmware upload failed. (All error conditions).
};

typedef struct _FirmwareFileFormat_t
{
    UINT8 ChecksumHi;   // This is a 16 bit, one?s compliment checksum of the firmware data area.
    UINT8 ChecksumLo;   // LSB of above
    UINT8 VersInfoHi;   // High byte of Node?s firmware revision number. The Controller should only use this field to decide if a firmware update should proceed.
                            // The convention is that a higher number is a more recent release of firmware.
    UINT8 VersInfoLo;   // LSB of above
    UINT8 UserName[30]; // user name information. This information is not checked by the Node. It is purely for display by the Controller.
                            // It should contain a human readable description of file and version number. Whilst this is a fixed length field,
                            // it must contain a null termination.
    UINT8 Oem[256];     // An array of 256 words. Each word is hi byte first and represents an Oem code for which this file is valid.
                            // Unused entries must be filled with 0xffff.
    UINT8 Spare[254];   // An array of 254 words. Currently unused and should be set to zero.
    UINT8 Length3;      // The total length in words of the firmware information following this field.
    UINT8 Length2;
    UINT8 Length1;
    UINT8 Length0;      // LSB
    UINT8 Data[1];       // The firmware data as an array of 16 bit values ordered hi byte first. The actual data is manufacturer specific.

} FirmwareFileFormat_t;

typedef struct _ArtTodRequestPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Pad length to match ArtPoll.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 Spare[7];     // Transmit as zero, receivers don?t test.
    UINT8 Net;          // The top 7 bits of the 15 bit Port-Address of Nodes that must respond to this packet.
    UINT8 Command;      // Value Mnemonic Function
    UINT8 AddCount;     // The array size of the Address field. Max value is 32.
    UINT8 Address[32];  // This array defines the low byte of the Port-Address of the Output Gateway nodes that must respond to this packet.
                            // The high nibble is the Sub-Net switch. The low nibble corresponds to the Universe.
                            // This is combined with the 'Net' field above to form the 15 bit address.

} ArtTodRequestPack_t;

// ArtTodRequest command types
enum
{
    TodRequestFull=0x00    // Send the entire TOD.
};

typedef struct _ArtTodDataPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 RdmVer;       // Art-Net Devices that only support RDM DRAFT V1.0 set field to 0x00.
                            // Devices that support RDM STANDARD V1.0 set field to 0x01.
    UINT8 Port;         // Physical Port. Range 1-4.
    UINT8 Spare[7];     // Transmit as zero, receivers don?t test.
    UINT8 Net;          // The top 7 bits of the Port-Address of the Output Gateway DMX Port that generated this packet.
    UINT8 CommandResponse;  // Defines the packet contents as follows.
    UINT8 Address;      // The low 8 bits of the Port-Address of the Output Gateway DMX Port that generated this packet.
                            // The high nibble is the Sub-Net switch. The low nibble corresponds to the Universe.
    UINT8 UidTotalHi;   // The total number of RDM devices discovered by this Universe.
    UINT8 UidTotalLo;
    UINT8 BlockCount;   // The index number of this packet. When UidTotal exceeds 200, multiple ArtTodData packets are used.
                            // BlockCount is set to zero for the first packet, and incremented for each subsequent packet containing blocks of TOD information.
    UINT8 UidCount;     // The number of UIDs encoded in this packet. This is the index of the following array.
    UINT8 TOD[6];       // 48 bit An array of RDM UID.
    
} ArtTodDataPack_t;

// ArtTodData CommandResponse types
enum
{
    TodDataFull=0x00,   // The packet contains the entire TOD or is the first packet in a sequence of packets that contains the entire TOD.
    TodDataNak=0xff     // The TOD is not available.
};

typedef struct _ArtTodControlPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 Filler1;      // Pad length to match ArtPoll.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 Spare[7];     // Transmit as zero, receivers don?t test.
    UINT8 Net;          // The top 7 bits of the Port-Address of the Output Gateway DMX Port that should action this command.
    UINT8 Command;      // Defines the packet action.
    UINT8 Address;      // The low byte of the 15 bit Port-Address of the DMX Port that should action this command.

} ArtTodControlPack_t;

// ArtTodControl packet action types
enum
{
    AtcNone=0x00,   // No action.
    AtcFlush=0x01   // The node flushes it?s TOD and instigates full discovery.
};

typedef struct _ArtRdmPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 RdmVer;       // Art-Net Devices that only support RDM DRAFT V1.0 set field to 0x00. Devices that support RDM STANDARD V1.0 set field to 0x01.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 Spare[7];     // Transmit as zero, receivers don?t test.
    UINT8 Net;          // The top 7 bits of 15 bit Port-Address that should action this command.
    UINT8 Command;      // Defines the packet action.
    UINT8 Address;      // The low 8 bits of the Port-Address that should action this command.
#ifdef _WINDOWS
    UINT8 RdmPacket[MAX_DMX_SLOTS]; // The RDM data packet excluding the DMX StartCode.
#else // #ifdef _WINDOWS
    UINT8 RdmPacket[MAX_TX_SIZE]; // The RDM data packet excluding the DMX StartCode.
#endif // #ifdef _WINDOWS
    
} ArtRdmPack_t;

// ArtRdm packet action type
enum
{
    ArProcess=0x00  // Process RDM Packet.
};

typedef struct _ArtRdmSubPack_t
{
    UINT8 ID[8];        // Array of 8 characters, the final character is a null termination. Value = ?A? ?r? ?t? ?-? ?N? ?e? ?t? 0x00
    UINT16 OpCode;      // OpOutput Transmitted low byte first.
    UINT8 ProtVerHi;    // High byte of the Art-Net protocol revision number.
    UINT8 ProtVerLo;    // Low byte of the Art-Net protocol revision number. Current value 14
    UINT8 RdmVer;       // Art-Net Devices that only support RDM DRAFT V1.0 set field to 0x00. Devices that support RDM STANDARD V1.0 set field to 0x01.
    UINT8 Filler2;      // Pad length to match ArtPoll.
    UINT8 UID[6];       // UID of target RDM device.
    UINT8 Spare1;       // Transmit as zero, receivers don?t test.
    UINT8 CommandClass; // As per RDM specification. This field defines whether this is a Get, Set, GetResponse, SetResponse.
    UINT16 ParameterId; // As per RDM specification. This field defines the type of parameter contained in this packet.
    UINT16 SubDevice;   // Defines the first device information contained in packet. This follows the RDM convention that 0 = root device and 1 = first subdevice.
    UINT16 SubCount;    // The number of sub devices packed into packet. Zero is illegal.
    UINT8 Spare2;       // Transmit as zero, receivers don?t test.
    UINT8 Spare3;       // Transmit as zero, receivers don?t test.
    UINT8 Spare4;       // Transmit as zero, receivers don?t test.
    UINT8 Spare5;       // Transmit as zero, receivers don?t test.
    UINT16 Data[1];     // The size of the data array is defined by the contents of CommandClass and SubCount:
                            // CommandClass     Array Size
                            // Get              0
                            // Set              SubCount
                            // GetResponse      SubCount
                            // SetResponse      0

} ArtRdmSubPack_t;

typedef union _ArtPack_t
{
    ArtPollPack_t       poll;
    ArtPollReplyPack_t  pollrply;
    ArtDmxPack_t        dmx;
    ArtRdmPack_t        rdm;
} ArtPack_t;

#endif // #ifdef _ARTNET_CODE

extern void ART_sendReply(UINT16 size);


#ifdef __cplusplus
}
#endif

#endif /* ARTNET_H */