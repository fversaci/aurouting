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

package _3buf;

//
// Simple module to record simulation end time
//
simple Timer
{    
    parameters:
        // histogram range (in bisection bandwidth lower bound units)
        double histrange = default(2.0);    
    @display("i=block/timer");
    gates:
        input addCow @directIn; // port to increment packet counter
}
