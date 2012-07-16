//
//  Sub.cpp
//  SubHunter
//
//  Created by Todd Pickell on 4/9/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#include <iostream>
#include "Sub.h"

using namespace std;

Sub::Sub(Point p, int h) {
    firingOnEnemy = false;
    armor = 10;
    ammo = 12;
    moves = 2;
    location = p;
    heading = calcHeading(h);
    enemyLocationKnown = false;
}

bool Sub::getEnemyLocationKnown() {
    return enemyLocationKnown;
}
void Sub::setEnemyLocationKnown(bool b) {
    enemyLocationKnown = b;
}