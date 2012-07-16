//
//  Functions.h
//  craps
//
//  Created by Todd Pickell on 3/29/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//
//  Includes: <iostream> <cstdlib> <ctime>
//
//  Course: CISS 242A Programming II
//
//  Description:
//  This is my functions header that stores my most commonly used C++ functions.
//
//***************************************************************************
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <vector>

#ifndef craps_Functions_h
#define craps_Functions_h

using namespace std;

/* sexy template for getting user input from prompt
 * usage: getInput <myReturnDataTypeIwantBack> (myStringImPassingIn);
 * myStringImPassingIn is the question you want to ask the user 
 */
template <class returnDataType>
returnDataType getInput(string stringIn)
{
    returnDataType userInput;// var to store user input
    cout << stringIn;//   display prompt
    cin >> userInput;//   get input from prompt
    cout << endl;//   endLine
    return userInput;// return the user input
}//end getInput

#endif
