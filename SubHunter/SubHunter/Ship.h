//
//  Ship.h
//  SubHunter
//
//  Created by Todd Pickell on 4/8/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#ifndef SubHunter_Ship_h
#define SubHunter_Ship_h

#include "Point.h"

using namespace std;

typedef enum {North, East, South, West} Direction;
typedef enum {Left, Right} Turn;

class Ship {
protected:
    Direction heading;
    Point location;
    int ammo, armor, moves;
    bool firingOnEnemy;
public:
    Ship(){location.setPoint(0, 0);}
    Direction getHeading() {
        return heading;
    }
    Point getLocation() {
        return location;
    }
    int getMoves() {
        return moves;
    }
    int getAmmo() {
        return ammo;
    }
    int getArmor() {
        return armor;
    }
    bool getFiringOnEnemy() {
        return firingOnEnemy;
    }
    void setFiringOnEnemy(bool boolIn) {
        firingOnEnemy = boolIn;
    }
    void setHeading(Direction directionIn) {
        heading = directionIn;
    }
    void setLocation(Point pointIn) {
        location = pointIn;
    }
    void decrementAmmo() {
        if (ammo > 0) {
            ammo--;
        }
    }
    void decrementArmor() {
        if (armor > 0) {
            armor--;
        }
    }
    
    // pass in ship direction and current point 
    // #May need to pass a pointer to object that is calling this function
    Point moveFwd(Direction d, Point l) {
        int x, y;
        switch (d) {
            case North:
                x = l.getRow();
                y = l.getColl();
                if (x > 0) {
                    l.setPoint(x-1, y);
                    cout << "Moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            case East:
                x = l.getRow();
                y = l.getColl();
                if (y < 9) {
                    l.setPoint(x, y+1);
                    cout << "Moved fwd 1. " << endl;
                } else {
                   this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            case South:
                x = l.getRow();
                y = l.getColl();
                if (x < 9) {
                    l.setPoint(x+1, y);
                    cout << "Moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            case West:
                x = l.getRow();
                y = l.getColl();
                if (y > 0) {
                    l.setPoint(x, y-1);
                    cout << "Moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            default:
                return l;// return unchanged point
                break;
        }
    };
    
    Point patrolFwd(Direction d, Point l) {
        int x, y;
        switch (d) {
            case North:
                x = l.getRow();
                y = l.getColl();
                if (x > 2) {
                    l.setPoint(x-1, y);
                    cout << "Sub moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            case East:
                x = l.getRow();
                y = l.getColl();
                if (y < 7) {
                    l.setPoint(x, y+1);
                    cout << "Sub moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            case South:
                x = l.getRow();
                y = l.getColl();
                if (x < 7) {
                    l.setPoint(x+1, y);
                    cout << "Sub moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            case West:
                x = l.getRow();
                y = l.getColl();
                if (y > 2) {
                    l.setPoint(x, y-1);
                    cout << "Sub moved fwd 1. " << endl;
                } else {
                    this->turn(d, Left); //if hit wall turn left
                }
                return l;
                break;
            default:
                return l;// return unchanged point
                break;
        }
    };
    
    // pass in ship direction and direction to turn
    void turn(Direction d, Turn t) {
        switch (t) {
            case Left:
                cout << "Turning left, Current heading: " << d << endl;
                switch (d) {
                    case North:
                        this->setHeading(West);
                        cout << this->getHeading() << endl;
                        break;
                    case East:
                        this->setHeading(North);
                        cout << this->getHeading() << endl;
                        break;
                    case South:
                        this->setHeading(East);
                        cout << this->getHeading() << endl;
                        break;
                    case West:
                        this->setHeading(South);
                        cout << this->getHeading() << endl;
                        break;
                    default:
                        break;
                }    
                break;
            case Right:
                cout << "Turning right, Current heading: " << d << endl;
                switch (d) {
                    case North:
                        this->setHeading(East);
                        cout << this->getHeading() << endl;
                        break;
                    case East:
                        this->setHeading(South);
                        cout << this->getHeading() << endl;
                        break;
                    case South:
                        this->setHeading(West);
                        cout << this->getHeading() << endl;
                        break;
                    case West:
                        this->setHeading(North);
                        cout << this->getHeading() << endl;
                        break;
                    default:
                        break;
                }
                break;
            default:
                break;
        }
    };
    
    Direction calcHeading(int h) {
        switch (h) {
            case 0:
                return North;
                break;
            case 1:
                return East;
                break;
            case 2:
                return South;
                break;
            case 3:
                return West;
                break;
                
            default:
                return North;
                break;
        }
    };
};

#endif
       