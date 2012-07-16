//
//  Point.h
//  SubHunter
//
//  Created by Todd Pickell on 4/8/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#ifndef SubHunter_Point_h
#define SubHunter_Point_h


class Point {
private:
    int row, coll;
public:
    Point();
    int getRow();
    int getColl();
    void setPoint(int, int);
};


#endif
