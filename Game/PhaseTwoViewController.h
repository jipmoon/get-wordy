//
//  Phase two ViewController.h
//  Game
//
//  Created by Pengzhi Duan on 2013-11-05.
//  Copyright (c) 2013 pengzhi. All rights reserved.
//
//  Description: This class manages the second phase of the game.
//
//  Functions:  (void) nextLevel - resets the screen and variables and has the player go to the next level
//              (bool) found - Returns true if the number is found in the array. Otherwise it returns false
//
//  Bugs: None
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AudioController.h"
#import "Shared.h"

//with the other properties
// wordlist for 20 levels:
char wordlist_phase2[20][4]={
    //BOOK
    {'B','K','O','O'},
    //FIRE
    {'F','I','R','E'},
    //WOOD
    {'W','O','D','O'},
    //ROAD
    {'R','A','O','D'},
    //OPEN
    {'O','E','P','N'},
    //GIRL
    {'G','I','R','L'},
    //STEP
    {'S','T','P','E'},
    //KING
    {'K','I','N','G'},
    //FARM
    {'F','A','M','R'},
    //TIME
    {'T','M','I','E'},
    //SHIP
    {'S','H','I','P'},
    //BIRD
    {'B','R','I','D'},
    //STOP
    {'S','T','P','O'},
    //MOON
    {'M','O','N','O'},
    //RAIN
    {'R','I','A','N'},
    //BABY
    {'B','A','Y','B'},
    //FOOD
    {'F','O','D','O'},
    //CITY
    {'C','I','T','Y'},
    //HEAD
    {'H','E','D','A'},
    //DOOR
    {'D','O','R','O'} };

// the right order of buttons for each word:
int answer_phase2[20][4]={
    //BOOK:1342
    {1,3,4,2},
    //FIRE:1234
    {1,2,3,4},
    //WOOD:1243
    {1,2,4,3},
    //ROAD:1324
    {1,3,2,4},
    //OPEN:1324
    {1,3,2,4},
    //GIRL:1234
    {1,2,3,4},
    //STEP:1243
    {1,2,4,3},
    //KING:1234
    {1,2,3,4},
    //FARM:1243
    {1,2,4,3},
    //TIME:1324
    {1,3,2,4},
    //SHIP:1234
    {1,2,3,4},
    //BIRD:1342
    {1,3,2,4},
    //STOP:1243
    {1,2,4,3},
    //MOON:1243
    {1,2,4,3},
    //RAIN:1324
    {1,3,2,4},
    //BABY:1342
    {1,2,4,3},
    //FOOD:1342
    {1,2,4,3},
    //CITY:1234
    {1,2,3,4},
    //HEAD:1243
    {1,2,4,3},
    //DOOR:1243
    {1,2,4,3} };

int levelindex_phase2[20]={21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40};

int j=0;
int check_phase2[4] = {0, 0, 0,0};
//the level;
int level_phase2=0;

bool mistake_phase2 = NO;

//int completed_phase2 = 0;
//int loss_phase2 = 0;
int win_phase2 = 0;

@interface PhaseTwoViewController : UIViewController

@property (strong, nonatomic) AudioController* audioController;

- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;

- (IBAction)nextlevel:(id)sender;
- (IBAction)speaker:(id)sender;
- (IBAction)hint:(id)sender;

- (void) nextLevel;
- (bool) found:(int[])array length:(int)length num:(int)n;


@end
