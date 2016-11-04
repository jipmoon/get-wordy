//
//  Phase three ViewController.h
//  Game
//
//  Created by Pengzhi Duan on 2013-11-05.
//  Copyright (c) 2013 pengzhi. All rights reserved.
//
//  Description: This class manages the third phase of the game.
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
char wordlist_phase3[20][5]={
    //WORDS
    {'W','O','R','D','S'},
    //ABOUT
    {'A','T','B','U','O'},
    //OCEAN
    {'O','C','E','N','A'},
    //CHECK
    {'C','E','H','C','K'},
    //WATER
    {'W','A','R','T','E'},
    //MUSIC
    {'M','U','I','S','C'},
    //WRITE
    {'W','E','R','T','I'},
    //FIRST
    {'F','R','I','S','T'},
    //PLANT
    {'P','L','N','A','T'},
    //LIGHT
    {'L','I','T','G','H'},
    //CLOSE
    {'C','E','L','S','O'},
    //PAPER
    {'P','A','P','R','E'},
    //COLOR
    {'C','R','O','O','L'},
    //TODAY
    {'T','O','Y','D','A'},
    //TABLE
    {'T','A','L','B','E'},
    //MONEY
    {'M','O','N','E','Y'},
    //POWER
    {'P','O','R','W','E'},
    //HEAVY
    {'H','A','E','V','Y'},
    //SHAPE
    {'S','H','A','P','E'},
    //HEART
    {'H','E','R','A','T'},
    
};
// the right order of buttons for each word:
int answer_phase3[20][5]={
    //WORDS:12345
    {1,2,3,4,5},
    //ABOUT:13542
    {1,3,5,4,2},
    //OCEAN:12354
    {1,2,3,5,4},
    //CHECK:13245
    {1,3,2,4,5},
    //WATER:12453
    {1,2,4,5,3},
    //MUSIC:12435
    {1,2,4,3,5},
    //WRITE:13542
    {1,3,5,4,2},
    //FIRST:13245
    {1,3,2,4,5},
    //PLANT:12435
    {1,2,4,3,5},
    //LIGHT:12453
    {1,2,4,5,3},
    //CLOSE:13542
    {1,3,5,4,2},
    //PAPER:12354
    {1,2,3,5,4},
    //COLOR:13542
    {1,3,5,4,2},
    //TODAY:12453
    {1,2,4,5,3},
    //TABLE:12435
    {1,2,4,3,5},
    //MONEY:12345
    {1,2,3,4,5},
    //POWER:12453
    {1,2,4,5,3},
    //HEAVY:13245
    {1,3,2,4,5},
    //SHAPE:12345
    {1,2,3,4,5},
    //HEART:12435
    {1,2,4,3,5}
    
};

int levelindex_phase3[20]={41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};

int k=0;
int check_phase3[5] = {0,0,0,0,0};
//the level;
int level_phase3=0;

bool mistake_phase3 = NO;

//int completed_phase3 = 0;
//int loss_phase3 = 0;
int win_phase3 = 0;

@interface PhaseThreeViewController : UIViewController

@property (strong, nonatomic) AudioController* audioController;

- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;

- (IBAction)nextlevel:(id)sender;
- (IBAction)speaker:(id)sender;


- (void) nextLevel;
- (bool) found:(int[])array length:(int)length num:(int)n;


@end
