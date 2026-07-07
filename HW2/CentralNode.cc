#include <omnetpp.h>
#include "NetMsg_m.h"

using namespace omnetpp;

class CentralNode : public cSimpleModule {
private:
    cOutVector forwardedVector;
    long forwarded = 0;

protected:
    virtual void initialize() override {

        forwardedVector.setName("MessagesForwarded");
    }

    virtual void handleMessage(cMessage *msg) override {

        forwarded++;


        forwardedVector.record(forwarded);

        EV << "Messages forwarded: " << forwarded << "\n";


        int n = gateSize("gate");
        int arrival = msg->getArrivalGate()->getIndex();

        int leftNeighbor = (arrival - 1 + n) % n;
        int rightNeighbor = (arrival + 1) % n;


        send(msg->dup(), "gate$o", leftNeighbor);
        send(msg->dup(), "gate$o", rightNeighbor);

        delete msg;
    }
    virtual void finish() override {
        recordScalar("TotalMessagesForwarded", forwarded);
    }
};

Define_Module(CentralNode);
