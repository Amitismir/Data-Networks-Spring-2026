//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package Topology;
simple Node
{
    parameters:
        double sendInterval @unit(s) = default(0.5s);
    gates:
        inout gate;
}
simple CentralNode
{
    gates:
        inout gate[];
}

network MultiNodeNetwork
{
    @display("bgb=534,354");
    submodules:
        node1: Node {
            @display("p=160,64");
        }
        node2: Node {

            @display("p=88,201");
        }
        node3: Node {
            @display("p=160,316");
        }
        node4: Node {
            @display("p=354,316");
        }
        node5: Node {
            @display("p=431,207");
        }
        node6: Node {

            @display("p=354,70");
        }
        CentralModule: CentralNode {
            @display("p=259,201;b=,,oval");
        }
    connections:
        node1.gate <--> {  datarate = 100Mbps; delay = 10ms; } <--> CentralModule.gate++;
        node2.gate <--> {  datarate = 100Mbps; delay = 10ms; } <--> CentralModule.gate++;
        node3.gate <--> {  datarate = 100Mbps; delay = 10ms; } <--> CentralModule.gate++;
        node4.gate <--> {  datarate = 100Mbps; delay = 10ms; } <--> CentralModule.gate++;
        node5.gate <--> {  datarate = 100Mbps; delay = 10ms; } <--> CentralModule.gate++;
        node6.gate <--> {  datarate = 100Mbps; delay = 10ms; } <--> CentralModule.gate++;
}

