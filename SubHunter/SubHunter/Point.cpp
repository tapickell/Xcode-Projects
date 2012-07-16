//
//  Point.cpp
//  SubHunter
//
//  Created by Todd Pickell on 4/9/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#include <iostream>
#include "Point.h"

Point::Point() {
    row = 0;
    coll = 0;
}

int Point::getRow() {
    return row;
}

int Point::getColl() {
    return coll;
}

void Point::setPoint(int r, int c) {
    row = r;
    coll = c;
}
