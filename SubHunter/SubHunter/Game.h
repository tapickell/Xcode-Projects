//
//  Game.h
//  SubHunter
//
//  Created by Todd Pickell on 4/8/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#ifndef SubHunter_Game_h
#define SubHunter_Game_h

#include <iostream>
#include <math.h>
#include <time.h>
#include "Point.h"
#include "Destroyer.h"
#include "Sub.h"
#include "Functions.h"

using namespace std;

typedef enum {Win, Lose, Draw, Playing} Status;

class Game {
private:
    int gameBoard[10][10];
    int turnNumber;
    Point subLastSighting;
    Point destroyerLastSighting;
    Status gameStatus;
    Point getStartPoint();
    int getStartDirection();
    void gameLoop(Destroyer&, Sub&);
    void setupBoard();
    void playerTurn(Destroyer&, Sub&);
    void enemyTurn(Destroyer&, Sub&);
public:
    Game();
    void updateDisplay(Destroyer&, Sub&);
    void runAway();
    void checkWinLose(Destroyer&, Sub&);
    bool enemySpotted(Destroyer&, Sub&);
    bool subSpotted(Destroyer&, Sub&, int);
};


#endif
