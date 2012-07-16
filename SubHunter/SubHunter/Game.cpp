//
//  Game.cpp
//  SubHunter
//
//  Created by Todd Pickell on 4/9/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#include <iostream>
#include "Game.h"

using namespace std;

Game::Game() {
    /** setup game variables **/
    srand(time(0)); 
    turnNumber = 1;
    subLastSighting.setPoint(0, 0);
    destroyerLastSighting.setPoint(0, 0);
    /** create game board **/
    setupBoard();
    /** create player objects **/
    cout << "Destroyer:" << endl;
    Destroyer d = Destroyer(getStartPoint(), getStartDirection());
    cout << "Sub:" << endl;
    Sub s = Sub(getStartPoint(), getStartDirection());
    /** start game loop **/
    gameLoop(d, s);
}

// setting up game board
void Game::setupBoard() 
{
    for (int i = 0; i < 10; i++) 
    {
        for (int j = 0; j < 10; j++) 
        {
            gameBoard[i][j] = 0;
        }
    }
}


void Game::gameLoop(Destroyer& d, Sub& s) 
{
    /** set game status **/
    gameStatus = Playing;
    while (gameStatus == Playing) 
    {
            //run game
        playerTurn(d, s);
        enemyTurn(d, s);
        updateDisplay(d, s);
        turnNumber++;
    }
    
}


void Game::playerTurn(Destroyer& d, Sub& s) 
{
    /***** write me *****/
    if (gameStatus == Playing) {
        int x = d.getMoves();
        int turning;
        while (x > 0) {
            cout << "****** Player Turn ******\nWhat would you like to do?" << endl;
            int choice = getInput<int>("1. Use Sonar\n2. Move Forward\n3. Turn\n4. Drop Depth Charge");
            switch (choice) {
                case 1:
                    /**** sonar *****/
                    cout << "ping...    \nping...     \nping..." << endl;
                    x--;
                    break;
                case 2:
                    /*** move fwd ***/
                    cout << "Curent Position, X: " << d.getLocation().getRow() << " Y: " << d.getLocation().getColl() << endl;
                    d.setLocation(d.moveFwd(d.getHeading(), d.getLocation()));
                    cout << "Curent heading: " << d.getHeading() << endl;
                    cout << "New Position, X: " << d.getLocation().getRow() << " Y: " << d.getLocation().getColl() << endl;
                    x--;
                    break;
                case 3:
                    /*** turn ***/
                    turning = getInput<int>("Enter Direction to turn:\n1 = Left\n2 = Right");
                    if (turning > 1) {
                        d.turn(d.getHeading(), Right);
                        cout << "Tunring Right" << endl;
                        
                    } else {
                        d.turn(d.getHeading(), Left);
                        cout << "Turning Left" << endl;
                    }
                    cout << "Curent heading: " << d.getHeading() << endl;
                    x--;
                    break;
                case 4:
                    /***** drop depth charge *****/
                    if (d.getLocation().getRow() == s.getLocation().getRow() && 
                        d.getLocation().getColl() == s.getLocation().getColl()) 
                    {
                        cout << "Direct Hit!" << endl;
                        d.decrementAmmo();
                        for (int i = 0; i < 5; i++) 
                        {
                            s.decrementArmor();
                        }//end for
                        cout << "Sub health: " << s.getArmor() << endl;
                        cout << "Moves left: " << x << endl;
                    }//else if (ping 1 radius) then destruction is 3
                    else if (subSpotted(d, s, 1)) 
                    {
                            cout << "Direct Hit!" << endl;
                            d.decrementAmmo();
                            for (int i = 0; i < 3; i++) 
                                {
                                s.decrementArmor();
                                }//end for
                            cout << "Sub health: " << s.getArmor() << endl;
                            cout << "Moves left: " << x << endl;
                    } //else if (ping 2 radius) then destruction is 2
                    else if (subSpotted(d, s, 2))
                    {
                        cout << "Good Hit!" << endl;
                        d.decrementAmmo();
                        for (int i = 0; i < 2; i++) 
                            {
                            s.decrementArmor();
                            }//end for
                        cout << "Sub health: " << s.getArmor() << endl;
                        cout << "Moves left: " << x << endl;
                    }  //else if (ping 3 radius) then destruction is 1
                    else if (subSpotted(d, s, 3))
                    {
                        cout << "A Hit!" << endl;
                        d.decrementAmmo();
                        s.decrementArmor();
                        cout << "Sub health: " << s.getArmor() << endl;
                        cout << "Moves left: " << x << endl;
                    }
                    x--;
                    break;
                default:
                    break;
            }//end switch
        }//end while
    }//end if
    checkWinLose(d, s);
}//end player turn

void Game::enemyTurn(Destroyer& d, Sub& s) 
{
    if (gameStatus == Playing) {
        cout << "\n\n****** Enemy Turn ******" << endl;
        int x = s.getMoves();
        while (x > 0) 
        {
            if (s.getAmmo() > 0) 
            {
                if (s.getEnemyLocationKnown() == false) 
                {
        /*********************** SEEK MODE ***************************/
                    //seek mode, periscope up
                    x--; // takes one turn to look thru periscope
                    cout << "Moves left: " << x << endl;
                    cout << "Sub Moves allowed: " << s.getMoves() << endl;
                    if (enemySpotted(d, s) == true) 
                    { // can see player
                        s.setEnemyLocationKnown(true);
                        cout << "Destroyer in range and seen by sub" << endl;
                        destroyerLastSighting = d.getLocation();  // record last known sighting
                    } 
                    else 
                    {
        /*********************** SEARCH GAME BOARD ******************/
                        // can't see player
                        cout << "Destroyer not in range of sub" << endl;
                        /* go into search mode */
                        cout << "Curent Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                        cout << "Curent heading: " << s.getHeading() << endl;
                        //move forward one space
                        s.setLocation(s.patrolFwd(s.getHeading(), s.getLocation()));  
                        cout << "Curent heading: " << s.getHeading() << endl;
                        cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                        x--; // takes one turn to move
                        cout << "Moves left: " << x << endl;
                        cout << "Sub Moves allowed: " << s.getMoves() << endl;
                    }//end if else
                } 
                else 
                { //end if (s.getEnemyLocationKnown() == false)
        /********************** SETUP FOR SHOT *****************************/
                    /* If get enemy known location is true */
                    // move to get a good shot
                    //is sub on same row
                    if (d.getLocation().getRow() == s.getLocation().getRow()) 
                    {
                            //is sub facing destroyer
                        cout << "Sub is on same row as Destroyer" << endl;
                        if (d.getLocation().getColl() < s.getLocation().getColl()) 
                        {//is d west of sub
        /************************** TAKE SHOT ******************************/
                            if (s.getHeading() == West) 
                            {
                                    //take shot
                                s.decrementAmmo();
                                d.decrementArmor();
                                x--;
                                cout << "Sub Scored Direct Hit!" << endl;
                                cout << "Destroyer Health: " << d.getArmor() << endl;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                /* afterwards don't move unless destroyer moves */
                            } 
                            else 
                            { //turn to face destroyer
        /**************************** TURN TO FACE DESTROYER ***************/
                                switch (s.getHeading()) 
                                {
                                    case North:
                                        s.turn(s.getHeading(), Left);
                                        cout << "Sub turned left" << endl;
                                        cout << "Sub now facing " << s.getHeading() << endl;
                                        break;
                                    case East:
                                    case South:
                                        s.turn(s.getHeading(), Right);
                                        cout << "Sub turned right" << endl;
                                        cout << "Sub now facing " << s.getHeading() << endl;
                                    default:
                                        break;
                                }//end switch
                            }//end if (s.getHeading() == West) else
                        }//end if (d.getLocation().getColl() < s.getLocation().getColl())
                        else 
                        { //destroyer is east of sub
        /***************************** TAKE SHOT *******************************/
                            if (s.getHeading() == East) 
                            {
                                    //take shot
                                s.decrementAmmo();
                                d.decrementArmor();
                                x--;
                                cout << "Sub Scored Direct Hit!" << endl;
                                cout << "Destroyer Health: " << d.getArmor() << endl;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                            } 
                            else 
                            { //turn to face destroyer
        /**************************** TURN TO FACE DESTROYER ***************/
                                switch (s.getHeading()) 
                                {
                                    case North:
                                        s.turn(s.getHeading(), Right);
                                        cout << "Sub turned left" << endl;
                                        cout << "Sub now facing " << s.getHeading() << endl;
                                        break;
                                    case West:
                                    case South:
                                        s.turn(s.getHeading(), Left);
                                        cout << "Sub turned right" << endl;
                                        cout << "Sub now facing " << s.getHeading() << endl;
                                    default:
                                        break;
                                }//end switch 
                            }//end if (s.getHeading() == West) else
                        }//end else
                    }//end if (d.getLocation().getRow() == s.getLocation().getRow())
                    else 
                    {
                            //if not on same row is sub on same coll
                        if (d.getLocation().getColl() == s.getLocation().getColl()) 
                        {
                            cout << "Sub is on same coll as Destroyer" << endl;
                                //is sub facing destroyer
                                // is destroyer north of sub
                            if (d.getLocation().getRow() < s.getLocation().getRow()) 
                            {
                                if (s.getHeading() == North) 
                                {
                                        //take shot
                                    s.decrementAmmo();
                                    d.decrementArmor();
                                    x--;
                                    cout << "Sub Scored Direct Hit!" << endl;
                                    cout << "Destroyer Health: " << d.getArmor() << endl;
                                    cout << "Moves left: " << x << endl;
                                    cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                    /* afterwards don't move unless destroyer moves */
                                } 
                                else 
                                { //turn to face destroyer
        /**************************** TURN TO FACE DESTROYER ***************/
                                    switch (s.getHeading()) 
                                    {
                                        case East:
                                            s.turn(s.getHeading(), Left);
                                            cout << "Sub turned left" << endl;
                                            cout << "Sub now facing " << s.getHeading() << endl;
                                            break;
                                        case West:
                                        case South:
                                            s.turn(s.getHeading(), Right);
                                            cout << "Sub turned right" << endl;
                                            cout << "Sub now facing " << s.getHeading() << endl;
                                        default:
                                            break;
                                    }//end switch
                                }//end else
                            } 
                            else 
                            {
        /**************************** TURN TO FACE DESTROYER ***************/
                                switch (s.getHeading()) {
                                    case East:
                                        s.turn(s.getHeading(), Left);
                                        cout << "Sub turned left" << endl;
                                        cout << "Sub now facing " << s.getHeading() << endl;
                                        break;
                                    case West:
                                    case South:
                                        s.turn(s.getHeading(), Right);
                                        cout << "Sub turned right" << endl;
                                        cout << "Sub now facing " << s.getHeading() << endl;
                                    default:
                                        break;
                                }//end switch
                            }//end else
                        }//end if (d.getLocation().getColl() == s.getLocation().getColl())
                    }//end else
        /********************* MOVE INTO SHOOTING POSITION ******************/
                        //is destroyer north of sub
                    if (d.getLocation().getRow() < s.getLocation().getRow()) 
                    {
                /************ go north *************/
                        switch (s.getHeading()) 
                        {
                            case North:
                                s.setLocation(s.moveFwd(s.getHeading(), s.getLocation()));
                                cout << "Curent heading: " << s.getHeading() << endl;
                                cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                                x--; // decrement moves
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                break;
                            case East:
                                s.turn(East, Left);
                                cout << "Curent heading: " << s.getHeading() << endl;
                                cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                                x--;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                break;
                            case South:
                            case West:
                                s.turn(South, Right);
                                cout << "Curent heading: " << s.getHeading() << endl;
                                cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                                x--;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                break;
                            default:
                                cout << "Error: Unknown heading" << endl;
                                break;
                        }//end switch
                    } 
                    else if (d.getLocation().getRow() > s.getLocation().getRow()) 
                    {
            /************ go south *************/
                        switch (s.getHeading()) 
                        {
                            case South:
                                s.setLocation(s.moveFwd(s.getHeading(), s.getLocation()));
                                cout << "Curent heading: " << s.getHeading() << endl;
                                cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                                x--;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                break;
                            case West:
                                s.turn(West, Left);
                                cout << "Curent heading: " << s.getHeading() << endl;
                                cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                                x--;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                break;
                            case North:
                            case East:
                                s.turn(North, Right);
                                cout << "Curent heading: " << s.getHeading() << endl;
                                cout << "New Position, X: " << s.getLocation().getRow() << " Y: " << s.getLocation().getColl() << endl;
                                x--;
                                cout << "Moves left: " << x << endl;
                                cout << "Sub Moves allowed: " << s.getMoves() << endl;
                                break;
                            default:
                                break;
                        }//end switch
                    }//player is on same row
                }//end else
            }//end if (s.getAmmo() > 0)
            else 
            { //out of ammo
    /************************* RUN AWAY *******************************/
                    //runAway();
            }
        }//end while (x > 0)
    }//end if
    checkWinLose(d, s);
}//end enemyTurn


Point Game::getStartPoint() 
{
    int x = rand()%9;
    int y = rand()%9;
    cout << "Random X: " << x << " Y: " << y << endl;
    Point temp = Point();
    temp.setPoint(x, y);
    return temp;
}

int Game::getStartDirection() 
{
    int d = rand()%4;
    cout << "Random heading: " << d << "\n" << endl;
    return d;
}


void Game::updateDisplay(Destroyer& d, Sub& s) 
{
    cout << "Updating Display... \n" <<endl;
    setupBoard();
    gameBoard[d.getLocation().getRow()][d.getLocation().getColl()] = 1;
    gameBoard[s.getLocation().getRow()][s.getLocation().getColl()] = 2;
    cout << "+ 0 1 2 3 4 5 6 7 8 9 " << endl;
    for (int i = 0; i < 10; i++) 
        {
        cout << i << " ";
        for (int j = 0; j < 10; j++) 
            {
            cout << gameBoard[i][j] << " ";
            }
        cout << endl;
        }
    cout << "End of Turn: " << turnNumber << "\n" << endl;
}

void Game::runAway() 
{
    cout << "Running Away" << endl;
}


bool Game::enemySpotted(Destroyer& d, Sub& s) 
{
    if ((d.getLocation().getRow() >= s.getLocation().getRow()-s.getMoves() && 
         d.getLocation().getRow() <= s.getLocation().getRow()+s.getMoves()) && 
        (d.getLocation().getColl() >= s.getLocation().getColl()-s.getMoves() &&
         d.getLocation().getColl() <= s.getLocation().getColl()+s.getMoves())) 
        {
            return true;
        } 
        else 
        {
            return false;
        }
}

bool Game::subSpotted(Destroyer& d, Sub& s, int i)
{
    if ((s.getLocation().getRow() >= d.getLocation().getRow() - i &&
        s.getLocation().getRow() <= d.getLocation().getRow() + i) &&
        (s.getLocation().getColl() >= d.getLocation().getColl() - i &&
        s.getLocation().getColl() <= d.getLocation().getColl() + i)) 
    {
        return true;
    } 
    else
    {
        return false;
    }
}

void Game::checkWinLose(Destroyer& d, Sub& s)
{
    /** check for win/lose **/
    if (gameStatus == Playing) {
        if (d.getArmor() < 1 || d.getAmmo() < 1) 
            {
            cout << "Player Loses" << endl;
            gameStatus = Lose;
            } 
        else if (s.getArmor() < 1) 
            {
            cout << "Player Wins" << endl;
            gameStatus = Win;
            } 
        else if (d.getAmmo() < 1 && s.getAmmo() < 1) 
            {
            cout << "Game is Draw" << endl;
            gameStatus = Draw;
            }
    }
}
