//
//  Destroyer.h
//  SubHunter
//
//  Created by Todd Pickell on 4/8/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#ifndef SubHunter_Destroyer_h
#define SubHunter_Destroyer_h

#include "Ship.h"
#include "Point.h"

using namespace std;

class Destroyer : public Ship {
public:
    Destroyer(Point, int);
    bool fire();
    Point seek(int&);
    void takeTurn();
};

#endif
