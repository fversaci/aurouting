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

#ifndef __AUROUTING_TIMER_H_
#define __AUROUTING_TIMER_H_

#include <omnetpp.h>
#include "pack_m.h"

/// Simple object to record simulation end time
class Timer: public cSimpleModule {
 private:
  /// Number of total received packets
  int rcvdPacks;
  /// Number of total hops
  int hops;
  /// bisection bandwidth lower bound
  double lb;
  /// Add a number to received packets
  void addRP(int n) { rcvdPacks+=n; }
  /// Add a number to hops
  void addHops(int n) { hops+=n; }
  /// Add a number to derouted
  void addDer(int n) { derouted+=n; }
  /// Add a number to ofl
  void addOfl(int n) { ofl+=n; }
  void addOidn(int n) { oidn+=n; }
  void addWidn(int n) { widn+=n; }
  /// Add a number to cqr
  void addCqr(int n) { cqr+=n; }
  /// packets lifetime
  cOutVector lifetimes;
  cDoubleHistogram hoptimes_hist;
  cDoubleHistogram lifetimes_hist;
  /// number of derouted packets
  int derouted;
  /// number of OutFlanked packets
  int ofl;
  int oidn;
  int widn;
  /// number of CQRed packets
  int cqr;
  /// Varia
  double B,lat,L,count,T,x,y,z,max;
 public:
  /// Constructor
  Timer() : rcvdPacks(0), hops(0), derouted(0), ofl(0), oidn(0), widn(0), cqr(0) {}
 protected:
  virtual void finish();
  virtual void initialize();
  virtual void handleMessage(cMessage *msg);
};

#endif
