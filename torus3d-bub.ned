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

// Created: 2010-11-13 for project 3buf

package _3buf;

//
// k-ary 3d torus topology.
//
network Torus3d_bub
{
    parameters:
        int kX = default(2);
        int kY = default(2);
        int kZ = default(2);
        double band @unit(bps) = default(1 Gbps); // bandwidth
        double lat @unit(s) = default(250 ns); // latency
        // external or internal generation clock?
        bool external = default(false);
        // number of bursts to generate
        int count = default(20);
        // number of packet to be produced per burst
        int packNum = default(24);
        // Packet length
        int packLen @unit(B) = default(2 KiB);        
        // delta to generate a new packet (in saturation units)
        double deltaG = default(1);    
        // generator random distribution -- 0=deterministic, 1=exponential, 2=nomrmal(av,av/10)
        int rantype= default(0);
        @display("i=block/network2;bgb=305,284");
    types:
        channel Chan extends ned.DatarateChannel
        {
            datarate = band;
            delay = lat;
        }
    submodules:
        node[kX*kY*kZ]: BubNode {
            addr = index;
            @display("p=74,49");
        }
        timer: Timer {
            @display("p=233,206");
        }
        clock: Clock_gen {
            @display("p=54,206");
        }
    connections:
        // (x,y,z) maps to x+y*kX+z*kX*kY
        for x=0..kX-1, for y=0..kY-1, for z=0..kZ-1 {
            node[x+y*kX+z*kX*kY].gate[0] <--> Chan <--> node[(x+1)%kX+y*kX+z*kX*kY].gate[1];
            node[x+y*kX+z*kX*kY].gate[2] <--> Chan <--> node[x+((y+1)%kY)*kX+z*kX*kY].gate[3];
            node[x+y*kX+z*kX*kY].gate[4] <--> Chan <--> node[x+y*kX+((z+1)%kZ)*kX*kY].gate[5];
        }
}
