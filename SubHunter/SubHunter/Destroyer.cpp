//
//  Destroyer.cpp
//  SubHunter
//
//  Created by Todd Pickell on 4/9/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#include <iostream>
#include "Destroyer.h"

using namespace std;

Destroyer::Destroyer(Point p, int h) {
    armor = 10;
    ammo = 12;
    moves = 3;
    location = p;
    heading = calcHeading(h);
}

bool Destroyer::fire() {
    bool directHit = true;
    return directHit;
}

Point Destroyer::seek(int& p) {
    Point currentPoint = Point();
    return currentPoint;
}

void Destroyer::takeTurn() {
    cout << "Destroyer turn" << endl;
    
}