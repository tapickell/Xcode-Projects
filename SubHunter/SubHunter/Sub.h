//
//  Sub.h
//  SubHunter
//
//  Created by Todd Pickell on 4/8/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#ifndef SubHunter_Sub_h
#define SubHunter_Sub_h

#include "Ship.h"
#include "Point.h"

using namespace std;

class Sub : public Ship {
private:
    bool enemyLocationKnown;
public:
    Sub(Point, int);
    bool getEnemyLocationKnown();
    void setEnemyLocationKnown(bool);
};


#endif
