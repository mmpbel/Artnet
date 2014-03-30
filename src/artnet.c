
/*
 * File:   artnet.c
 * Author: Mikhail.Palityka
 *
 * Created on January 17, 2014, 7:59 PM
 */

#ifdef _ARTNET

#include <stdio.h>
#include <string.h>

#include "main.h"

#include "GenericTypeDefs.h"
#include "TCPIPConfig.h"
#include "TCPIP Stack/TCPIP.h"

#include "dmx.h"
#include "artnet.h"

extern NODE_INFO remoteNode;

static const UINT8 ArtNetId[] = {'A', 'r', 't', '-', 'N', 'e', 't', 0x00};

static union _ArtPack_t
{
    ArtPollPack_t       poll;
    ArtPollReplyPack_t  pollrply;
    ArtDmxPack_t        dmx;
    ArtRdmPack_t        rdm;
} artBuf;


/**
@brief  Check artnet packet ID.

@return UINT8 0-error, 1-correct.
*/
static UINT8 checkPackId (UINT8 ID[])
{
    UINT8 i;

    for (i=0; i<sizeof(ArtNetId); i++)
    {
        if (ID[i] != ArtNetId[i])
        {
            return 0;
        }
    }

    return 1;
}

/**
@brief  Send ArtPollReply packet.

@return none.
*/
static void sendArtPollReply (ArtPollReplyPack_t *pkt)
{
//    UINT32 ipAddr = DIRECTED_BROADCAST_IP;

    memset((UINT8*)pkt, 0, sizeof(ArtPollReplyPack_t));

    memcpy(pkt->ID, (void*)ArtNetId, sizeof(pkt->ID));
    pkt->OpCode = OpPollReply;

    pkt->IpAddress[0] = AppConfig.MyIPAddr.byte.MB;
    pkt->IpAddress[1] = AppConfig.MyIPAddr.byte.UB;
    pkt->IpAddress[2] = AppConfig.MyIPAddr.byte.HB;
    pkt->IpAddress[3] = AppConfig.MyIPAddr.byte.LB;

    pkt->Port = ARTNET_PORT;

    pkt->VersInfoH = (UINT8)(FW_RELEASE_NUM >> 8);
    pkt->VersInfoL = (UINT8)FW_RELEASE_NUM;

    pkt->NetSwitch = 0; // TODO:
    pkt->SubSwitch = 0; // TODO:

    pkt->OemHi = (UINT8)(OEM_CODE >> 8);
    pkt->OemL = (UINT8)OEM_CODE;

    pkt->UbeaVersion = 0;
    pkt->Status1 = 0xF0;  // TODO:

    pkt->EstaManLo = (UINT8)ESTA_MANUF_CODE;
    pkt->EstaManHi = (UINT8)(ESTA_MANUF_CODE >> 8);

    // 18 bytes
    strcpy((char*)pkt->ShortName, "GVA");  // TODO:
    // 64 bytes
    strcpy((char*)pkt->LongName, "ArtNet2Dmx converter");  // TODO:
    // 64 bytes
    strcpy((char*)pkt->NodeReport, "Works well");  // TODO:

    pkt->NumPortsLo = 1;

    pkt->PortTypes[0] = (1<<7);

    pkt->GoodInput[0] = 0;  // TODO:

    pkt->GoodOutput[0] = 0;  // TODO:

    pkt->SwOut[0] = 0;  // TODO:

    pkt->Style = StNode;

    pkt->MAC[0] = AppConfig.MyMACAddr.v[5];
    pkt->MAC[1] = AppConfig.MyMACAddr.v[4];
    pkt->MAC[2] = AppConfig.MyMACAddr.v[3];
    pkt->MAC[3] = AppConfig.MyMACAddr.v[2];
    pkt->MAC[4] = AppConfig.MyMACAddr.v[1];
    pkt->MAC[5] = AppConfig.MyMACAddr.v[0];

    pkt->Status2 = (1<<3);

//    SOC_sendto(ARTNET_SOCKET, (UINT8*)pkt, sizeof(ArtPollReplyPack_t), (UINT8*)&ipAddr, ARTNET_PORT);
    UDPPutArray((BYTE*)pkt, sizeof(ArtPollReplyPack_t));
}

/**
@brief  Send ArtRdm packet.

@return none.
*/
static void sendArtRdm (ArtRdmPack_t *pkt, UINT16 size)
{
    memset((UINT8*)pkt, 0, pkt->RdmPacket - pkt->ID);

    memcpy(pkt->ID, (void*)ArtNetId, sizeof(pkt->ID));
    pkt->OpCode = OpRdm;

    pkt->ProtVerHi = ARTNET_PROTO_HI;
    pkt->ProtVerLo = ARTNET_PROTO_LO;
    pkt->RdmVer = 0;       // Art-Net Devices that only support RDM DRAFT V1.0 set field to 0x00. Devices that support RDM STANDARD V1.0 set field to 0x01.
    pkt->Net = 0;          // The top 7 bits of 15 bit Port-Address that should action this command.
    pkt->Command = RDM_REPLY;      // Defines the packet action.
    pkt->Address = 0;      // The low 8 bits of the Port-Address that should action this command.

//    SOC_sendto(ARTNET_SOCKET, (UINT8*)pkt, , (UINT8*)&destIp, ARTNET_PORT);
    UDPPutArray((BYTE*)pkt, pkt->RdmPacket - pkt->ID + size);
}

/**
@brief  Send a reply to the request.

@return none.
*/
void ART_sendReply (UINT16 size)
{
    sendArtRdm(&artBuf.rdm, size);
}

/**
@brief  start RDM transfer

@return none.
*/
static void handleRdm (ArtRdmPack_t* pack, UINT16 size)
{
#ifdef _DMX
    // handle RDM request
    DMX_sendRdm(pack->RdmPacket, size);
#endif // #ifdef _DMX
}

/*********************************************************************
 * Function:        void ART_Task(void)
 *
 * Summary:         Announce callback task.
 *
 * PreCondition:    Stack is initialized()
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Recurring task used to listen for Discovery
 *                  messages on the specified ANNOUNCE_PORT.  These
 *                  messages can be sent using the Microchip Device
 *                  Discoverer tool. If one is received, this
 *                  function will transmit a reply.
 *
 * Note:            A UDP socket must be available before this
 *					function is called.  It is freed at the end of
 *					the function.  MAX_UDP_SOCKETS may need to be
 *					increased if other modules use UDP sockets.
 ********************************************************************/
void ART_Task (void)
{
    static enum {
        ART_HOME = 0,
        ART_LISTEN,
        ART_REQUEST_RECEIVED,
        ART_DISABLED
    } DiscoverySM = ART_HOME;

    static UDP_SOCKET   MySocket;

    switch(DiscoverySM)
    {
        case ART_HOME:
            // Open a UDP socket for inbound and outbound transmission
            // Since we expect to only receive broadcast packets and
            // only send unicast packets directly to the node we last
            // received from, the remote NodeInfo parameter can be anything
            MySocket = UDPOpenEx(0, UDP_OPEN_SERVER, ARTNET_PORT, ARTNET_PORT);

            if (MySocket == INVALID_UDP_SOCKET)
            {
                return;
            }
            else
            {
                DiscoverySM++;
            }
            break;

        case ART_LISTEN:
            // Do nothing if no data is waiting
            if (!UDPIsGetReady(MySocket))
            {
                return;
            }

            UINT16 sizeRcvd;

            sizeRcvd = UDPGetArray((UINT8*)&artBuf, sizeof(ArtPollPack_t));

            // check if it's a proper packet
            if ((sizeRcvd >= sizeof(ArtPollPack_t))
                && checkPackId(artBuf.poll.ID)
                && (ARTNET_PROTO_HI <= artBuf.poll.ProtVerHi)
                && (ARTNET_PROTO_LO == artBuf.poll.ProtVerLo)
                )
            {
#ifdef _DMX
                // stop all DMX activity
                DMX_stopTransfer();
#endif  // #ifdef _DMX
                switch (artBuf.poll.OpCode)
                {
                    case OpPoll:
                        sendArtPollReply(&artBuf.pollrply);
                        break;
                    case OpOutput:
                        if (sizeRcvd >= sizeof(ArtDmxPack_t))
                        {
                            UINT8 ch;
                            UINT16 dmxSize;
                            // read out SubUni, Net, LengthHi, Length
                            UDPGetArray(&artBuf.dmx.SubUni, artBuf.dmx.Data - &artBuf.dmx.SubUni);
                            // check if the size is correct
                            dmxSize = ((((UINT16)artBuf.dmx.LengthHi) << 8) | artBuf.dmx.Length);
                            if (MAX_DMX_SLOTS != dmxSize)
                            {
                                // error
                                break;
                            }
#ifdef _DMX
                            ch = DMX_getChannel((((UINT16)artBuf.dmx.Net) << 8) | artBuf.dmx.SubUni);
                            // copy DMX data from ethernet controller into DMX channel buffer
                            UDPGetArray(DMX_getBuf(), dmxSize);
                            // activate DMX channel if it was not active yet
                            DMX_activateChannel();
#endif // #ifdef _DMX
                        }
                        break;
                    case OpRdm:
                        if (sizeRcvd > (artBuf.rdm.RdmPacket - artBuf.rdm.ID))
                        {
                            UINT8 ch;
                            UINT16 dataSize = sizeRcvd - (artBuf.rdm.RdmPacket - artBuf.rdm.ID);
                            if (dataSize > sizeof(artBuf.rdm.RdmPacket))
                            {
                                // error
                                break;
                            }
                            // read out Spare[7], Net, Command, Address
                            UDPGetArray(artBuf.rdm.Spare, artBuf.rdm.RdmPacket - artBuf.rdm.Spare);
                            if (RDM_REQUEST == sizeof(artBuf.rdm.RdmPacket))
                            {
                                // error
                                break;
                            }
#ifdef _DMX
                            ch = DMX_getChannel((((UINT16)artBuf.rdm.Net) << 8) | artBuf.rdm.Address);
#endif // #ifdef _DMX
                            // copy RDM data from ethernet controller into RDM channel buffer
                            UDPGetArray(artBuf.rdm.RdmPacket, dataSize);
                            // handle RDM packet
                            handleRdm(&artBuf.rdm, dataSize);
                        }
                        break;
                    default:
                        break;
                }
            }

            UDPDiscard();

            // We received a discovery request, reply when we can
            DiscoverySM++;

            // Change the destination to the unicast address of the last received packet
            memcpy((void*)&UDPSocketInfo[MySocket].remote.remoteNode, (const void*)&remoteNode, sizeof(remoteNode));

            // No break needed.  If we get down here, we are now ready for the ART_REQUEST_RECEIVED state

        case ART_REQUEST_RECEIVED:
            if (!UDPIsPutReady(MySocket))
            {
                return;
            }

            // Begin sending our MAC address in human readable form.
            // The MAC address theoretically could be obtained from the
            // packet header when the computer receives our UDP packet,
            // however, in practice, the OS will abstract away the useful
            // information and it would be difficult to obtain.  It also
            // would be lost if this broadcast packet were forwarded by a
            // router to a different portion of the network (note that
            // broadcasts are normally not forwarded by routers).
            UDPPutArray((BYTE*)AppConfig.NetBIOSName, sizeof(AppConfig.NetBIOSName)-1);

            // Send the packet
            UDPFlush();

            // Listen for other discovery requests
            DiscoverySM = ART_LISTEN;
            break;

        case ART_DISABLED:
            break;
    }
}


#endif // #ifdef _ARTNET