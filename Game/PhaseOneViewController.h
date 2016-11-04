//
//  Phase One ViewController.h
//  Game
//
//  Created by Hyung Jip Moon on 2013-11-05.
//  Copyright (c) 2013 hyungjip. All rights reserved.
//
//  Description: This class manages the first phase of the game.
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
char wordlist[20][3]={//WAY
    {'W','Y','A'},
    //CAR
    {'R','C','A'},
    //PEN
    {'P','E','N'},
    //CAT
    {'A','C','T'},
    //DOG
    {'G','D','O'},
    //LEG
    {'L','G','E'},
    //MAN
    {'M','N','A'},
    //HAT
    {'H','A','T'},
    //OIL
    {'I','O','L'},
    //TWO
    {'W','T','O'},
    //ONE
    {'E','O','N'},
    //EAT
    {'A','E','T'},
    //RUN
    {'N','R','U'},
    //GET
    {'G','E','T'},
    //THE
    {'T','E','H'},
    //CAN
    {'A','C','N'},
    //YOU
    {'Y','U','O'},
    //BUT
    {'T','B','U'},
    //USE
    {'U','E','S'},
    //DAY:
    {'A','D','Y'}    };

// the right order of buttons for each word:
int answer[20][3]={  //WAY:132
    {1,3,2},
    //CAR:231
    {2,3,1},
    //PEN:123
    {1,2,3},
    //CAT:213
    {2,1,3},
    //DOG:231
    {2,3,1},
    //LEG:132
    {1,3,2},
    //MAN:132
    {1,3,2},
    //HAT:123
    {1,2,3},
    //OIL;213
    {2,1,3},
    //TWO:213
    {2,1,3},
    //ONE:231
    {2,3,1},
    //EAT:213
    {2,1,3},
    //RUN:231
    {2,3,1},
    //GET:123
    {1,2,3},
    //THE:132
    {1,3,2},
    //CAN:213
    {2,1,3},
    //YOU:132
    {1,3,2},
    //BUT:231
    {2,3,1},
    //USE:132
    {1,3,2},
    //DAY:213
    {2,1,3}   };
int levelindex[20]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};

int i = 0;

int check[3] = {0, 0, 0};
//the level;
int level=0;

bool mistake = NO;

//int completed = 0;
//int loss = 0;
int win = 0;

@interface PhaseOneViewController : UIViewController{
    //MyManager *globalVarObj;
}

@property (strong, nonatomic) AudioController* audioController;


-(IBAction)button1:(id)sender;
-(IBAction)button2:(id)sender;
-(IBAction)button3:(id)sender;

-(IBAction)nextlevel:(id)sender;
-(IBAction)speaker:(id)sender;
-(IBAction)hint:(id)sender;

-(void) nextLevel;
-(bool) found:(int[])array length:(int)length num:(int)n;


@end
