/*
 * Node.cc
 *
 *  Created on: May 30, 2026
 *      Author: Notebook
 */
/*
 * CentralNode.cc
 *
 *  Created on: May 30, 2026
 *      Author: Notebook
 */
#include <omnetpp.h>
#include <cstring>
#include "NetMsg_m.h"

using namespace omnetpp;

class Node : public cSimpleModule {
private:
    cOutVector receivedVector;
    cOutVector sentVector;
    long messageReceived = 0;
    long messageSent = 0;
    cMessage *sendEvent = nullptr;

protected:
    virtual void initialize() override {
        receivedVector.setName("MessagesReceived");
        sentVector.setName("MessagesSent");
        sendEvent = new cMessage("sendEvent");
        scheduleAt(simTime() + par("sendInterval"), sendEvent);
    }

    virtual void handleMessage(cMessage *msg) override {
        if (msg == sendEvent) {
            messageSent++;
            sentVector.record(messageSent);
            NetMsg *pkt = new NetMsg("data");
            int nodeID = atoi(getFullName() + 4);
            pkt->setSourceNode(nodeID);
            pkt->setSendTime(simTime().dbl());
            send(pkt, "gate$o");


            scheduleAt(simTime() + par("sendInterval"), sendEvent);
        } else {
            messageReceived++;

            receivedVector.record(messageReceived);

            EV << "Received messages: " << messageReceived << "\n";
            delete msg;
        }
    }
};

Define_Module(Node);









