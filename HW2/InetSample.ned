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
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;


//
// TODO documentation
//
network InetSampleNetwork
{
    @display("bgb=988,423");
    submodules:
        host3: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=359,46");
        }
        host4: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=487,46");
        }
        host5: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=614,46");
        }
        host0: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=50,177");
        }
        host1: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=53,260");
        }
        host2: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=46,344");
        }
        host6: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=900,165");
        }
        host7: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=899,257");
        }
        host8: StandardHost {
            parameters:
            numEthInterfaces = 1;
            @display("p=898,361");
        }
        router1: Router {
            parameters:
            numEthInterfaces = 3;
            @display("p=473,206");
        }
        router2: Router {
            parameters:
            numEthInterfaces = 3;
            @display("p=617,276");
        }
        router0: Router {
            parameters:
            numEthInterfaces = 3;
            @display("p=336,276");
        }
        switch0: EthernetSwitch {
            parameters:
            numEthInterfaces = 4;
            @display("p=166,258");
        }
        switch1: EthernetSwitch {
            parameters:
            numEthInterfaces = 4;
            @display("p=481,114");
        }
        switch2: EthernetSwitch {
            parameters:
            numEthInterfaces = 4;
            @display("p=765,278");
        }
        visualizer: IntegratedCanvasVisualizer {
            @display("p=43,90");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,24");
        }
    connections:
        host5.ethg[0] <--> Eth100M <--> switch1.ethg[2];
        host4.ethg[0] <--> Eth100M <--> switch1.ethg[1];
        host3.ethg[0] <--> Eth100M <--> switch1.ethg[0];
        host6.ethg[0] <--> Eth100M <--> switch2.ethg[0];
        host7.ethg[0] <--> Eth100M <--> switch2.ethg[1];
        host8.ethg[0] <--> Eth100M <--> switch2.ethg[2];
        switch2.ethg[3] <--> Eth100M <--> router2.ethg[0];
        router0.ethg[1] <--> Eth100M <--> router1.ethg[1];
        router1.ethg[2] <--> Eth100M <--> router2.ethg[1];
        router0.ethg[2] <--> Eth100M <--> router2.ethg[2];
        switch1.ethg[3] <--> Eth100M <--> router1.ethg[0];
        host0.ethg[0] <--> Eth100M <--> switch0.ethg[0];
        host1.ethg[0] <--> Eth100M <--> switch0.ethg[1];
        host2.ethg[0] <--> Eth100M <--> switch0.ethg[2];
        switch0.ethg[3] <--> Eth100M <--> router0.ethg[0];
}

