//
//  Phase three ViewController.m
//  Game
//
//  Created by Pengzhi Duan on 2013-11-05.
//  Copyright (c) 2013 pengzhi. All rights reserved.
//

#import "PhaseThreeViewController.h"
#import "config3.h"
#import "AudioController.h"


@interface PhaseThreeViewController ()

@end

@implementation PhaseThreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    level_phase3 = 0;
    win_phase3 = 0;
    //Preloads audio files
    self.audioController = [[AudioController alloc] init];
    [self.audioController preloadAudioEffects: kAudioEffectFiles];
    
    //load the images for buttons which have the different functions
    //load the letters for five buttons
    UIImageView *button1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][0]]]];
    [button1 setFrame:CGRectMake(84.0, 320.0, 60.0, 60.0)];
    [self.view addSubview:button1];
    UIImageView *button2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][1]]]];
    [button2 setFrame:CGRectMake(280.0, 500.0, 60.0, 60.0)];
    [self.view addSubview:button2];
    UIImageView *button3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][2]]]];
    [button3 setFrame:CGRectMake(480.0, 320.0, 60.0, 60.0)];
    [self.view addSubview:button3];
    UIImageView *button4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][3]]]];
    [button4 setFrame:CGRectMake(680.0, 500.0, 60.0, 60.0)];
    [self.view addSubview:button4];
    UIImageView *button5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][4]]]];
    [button5 setFrame:CGRectMake(882.0, 320.0, 60.0, 60.0)];
    [self.view addSubview:button5];
    
    
    UIImageView *nextlevel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextlevel.png"]];
    
    [nextlevel setFrame:CGRectMake(820.0, 600.0, 100.0, 100.0)];
    [self.view addSubview:nextlevel];
    
    UIImageView *speaker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speaker.png"]];
    
    [speaker setFrame:CGRectMake(78.0, 67.0, 69.0, 69.0)];
    [self.view addSubview:speaker];
    
    
    UIImageView *hint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nohint.png"]];
    
    [hint setFrame:CGRectMake(166.0, 67.0, 69.0, 69.0)];
    [self.view addSubview:hint];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//store 1 to the check array when button1 is tapped, drawing the line
- (IBAction)button1:(id)sender {
    
    
    //Makes sure you can only press a button once
	//If button was never pressed before or a mistake has not happen yet, do this
    if(![self found:check_phase3 length:5 num:1] && mistake_phase3==NO){
        k++;
        check_phase3[k-1]=1;
        
        //Plays sound of the letter
        char c = wordlist_phase3[level_phase3][0];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        //Mistake made
        if(check_phase3[k-1]!=answer_phase3[level_phase3][k-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase3 = YES;
            
        }
        else if(check_phase3[4] != 0 || mistake_phase3 == YES) {
            [self nextLevel];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
    }
    
}
//See button1 for the comments. They're identical.
//store 2 to the check array when button2 is tapped, drawing the line
- (IBAction)button2:(id)sender {
    if(![self found:check_phase3 length:5 num:2] && mistake_phase3==NO){
        k++;
        check_phase3[k-1]=2;
        //Plays sound of the letter
        char c = wordlist_phase3[level_phase3][1];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        //Mistake made
        if(check_phase3[k-1]!=answer_phase3[level_phase3][k-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase3 = YES;
            
        }

        
        //Added need extra conditions to draw a line
        if(check_phase3[0]==1 && check_phase3[1]==2&& answer_phase3[level_phase3][0]==1 && answer_phase3[level_phase3][1] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(140.0, 375.0, 145.0, 130.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[1]==3 && check_phase3[2]==2 && answer_phase3[level_phase3][1]==3 && answer_phase3[level_phase3][2] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(338.0, 370.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[3]==4 && check_phase3[4]==2 && answer_phase3[level_phase3][3]==4 && answer_phase3[level_phase3][4] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(340.0, 520.0, 340.0, 17.0)]; //GOOD 4 -> 2
            
            [self.view addSubview:Line];
        }
        //Checks to see if the check array and the answer are the same
        int sameCount = 0;
        for(int i=0; i<5; i++){
            if(check_phase3[i] == answer_phase3[level_phase3][i]){
                sameCount++;
            }
        }
        //If so then they've completed the level.
        if(sameCount == 5){
            
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase3++;
            
            if (win_phase3 > score3){
                score3 = win_phase3;
            }
        }
        sameCount = 0;
        
    }else if(check_phase3[4] != 0 || mistake_phase3 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
//See button1 and button2 for the comments. They're identical.
//store 3 to the check array when button3 is tapped, drawing the line
- (IBAction)button3:(id)sender {
    if(![self found:check_phase3 length:5 num:3] && mistake_phase3==NO){
        k++;
        check_phase3[k-1]=3;
        
        char c = wordlist_phase3[level_phase3][2];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        if(check_phase3[k-1]!=answer_phase3[level_phase3][k-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase3 = YES;
            
        }
        
        if(check_phase3[0]==1 && check_phase3[1]==3 && answer_phase3[level_phase3][0]==1 && answer_phase3[level_phase3][1] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(144.0, 340.0, 336.0, 17.0)]; //GOOD 1 -> 3
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[1]==2 && check_phase3[2]==3 && answer_phase3[level_phase3][1]==2 && answer_phase3[level_phase3][2] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(338.0, 370.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[2]==4 && check_phase3[3]==3 && answer_phase3[level_phase3][2]==4 && answer_phase3[level_phase3][3] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(538.0, 370.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[3]==5 && check_phase3[4]==3 && answer_phase3[level_phase3][3]==5 && answer_phase3[level_phase3][4] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(540.0, 340.0, 342.0, 17.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        int sameCount = 0;
        for(int i=0; i<5; i++){
            if(check_phase3[i] == answer_phase3[level_phase3][i]){
                sameCount++;
            }
        }
        if(sameCount == 5){
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase3++;
            //completed_phase3++;
            if (win_phase3 > score3){
                score3 = win_phase3;
            }
        }
        sameCount = 0;
        
    }else if(check_phase3[4] != 0 || mistake_phase3 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

- (IBAction)button4:(id)sender {
    if(![self found:check_phase3 length:5 num:4] && mistake_phase3==NO){
        k++;
        check_phase3[k-1]=4;
        
        char c = wordlist_phase3[level_phase3][3];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        if(check_phase3[k-1]!=answer_phase3[level_phase3][k-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase3 = YES;
           
        }
        
        
        if(check_phase3[2]==3 && check_phase3[3]==4 && answer_phase3[level_phase3][2]==3 && answer_phase3[level_phase3][3] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(538.0, 370.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        
        if(check_phase3[1]==2 && check_phase3[2]==4 && answer_phase3[level_phase3][1]==2 && answer_phase3[level_phase3][2] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(340.0, 520.0, 340.0, 17.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[2]==2 && check_phase3[3]==4 && answer_phase3[level_phase3][2]==2 && answer_phase3[level_phase3][3] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(340.0, 520.0, 340.0, 17.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[2]==5 && check_phase3[3]==4 && answer_phase3[level_phase3][2]==5 && answer_phase3[level_phase3][3] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(740.0, 373.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[3]==5 && check_phase3[4]==4 && answer_phase3[level_phase3][3]==5 && answer_phase3[level_phase3][4] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(740.0, 373.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        int sameCount = 0;
        for(int i=0; i<5; i++){
            if(check_phase3[i] == answer_phase3[level_phase3][i]){
                sameCount++;
            }
        }
        if(sameCount == 5){
            
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase3++;
            
            if (win_phase3 > score3){
                score3 = win_phase3;
            }
        }
        sameCount = 0;
        
    }else if(check_phase3[4] != 0 || mistake_phase3 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (IBAction)button5:(id)sender {
    if(![self found:check_phase3 length:5 num:5] && mistake_phase3==NO){
        k++;
        check_phase3[k-1]=5;
        
        char c = wordlist_phase3[level_phase3][4];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        if(check_phase3[k-1]!=answer_phase3[level_phase3][k-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase3 = YES;
            
        }
        
        if(check_phase3[2]==4 && check_phase3[3]==5 && answer_phase3[level_phase3][2]==4 && answer_phase3[level_phase3][3] == 5){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(740.0, 373.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[3]==4 && check_phase3[4]==5 && answer_phase3[level_phase3][3]==4 && answer_phase3[level_phase3][4] == 5){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(740.0, 373.0, 145.0, 135.0)]; //GOOD
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[1]==3 && check_phase3[2]==5 && answer_phase3[level_phase3][1]==3 && answer_phase3[level_phase3][2] == 5){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(540.0, 340.0, 342.0, 17.0)]; //GOOD 3 -> 5
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[2]==3 && check_phase3[3]==5 && answer_phase3[level_phase3][2]==3 && answer_phase3[level_phase3][3] == 5){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(540.0, 340.0, 342.0, 17.0)]; //GOOD 3 -> 5
            
            [self.view addSubview:Line];
        }
        
        if(check_phase3[3]==3 && check_phase3[4]==5&& answer_phase3[level_phase3][3]==3 && answer_phase3[level_phase3][4] == 5){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(540.0, 340.0, 342.0, 17.0)]; //WORK
            
            [self.view addSubview:Line];
        }
        
        int sameCount = 0;
        for(int i=0; i<5; i++){
            if(check_phase3[i] == answer_phase3[level_phase3][i]){
                sameCount++;
            }
        }
        if(sameCount == 5){
            
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"you got it :)" message:@" Press 'Next Level' to next level" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase3++;
            if (win_phase3 > score3){
                score3 = win_phase3;
            }
        }
        sameCount=0;
    }else if(check_phase3[4] != 0 || mistake_phase3 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}


// going to next level when the level is done.
- (IBAction)nextlevel:(id)sender {
    
    if(level_phase3 < 20){
    [self nextLevel];
    }
    if(level_phase3==20){
        //remove all imgages
        for (UIView *v in self.view.subviews) {
            if ([v isKindOfClass:[UIImageView class]]) {
                [v removeFromSuperview];
            }
        }
        
        //print out "WELL DONE"
        UIImageView *W= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"W.jpg"]];
        [W setFrame:CGRectMake(175.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:W];
        UIImageView *E1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"E.jpg"]];
        [E1 setFrame:CGRectMake(249.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:E1];
        UIImageView *L1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"L.jpg"]];
        [L1 setFrame:CGRectMake(324.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:L1];
        UIImageView *L2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"L.jpg"]];
        [L2 setFrame:CGRectMake(399.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:L2];
        UIImageView *D = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"D.jpg"]];
        [D setFrame:CGRectMake(570.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:D];
        UIImageView *O = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"O.jpg"]];
        [O setFrame:CGRectMake(644.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:O];
        UIImageView *N = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"N.jpg"]];
        [N setFrame:CGRectMake(718.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:N];
        UIImageView *E2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"E.jpg"]];
        [E2 setFrame:CGRectMake(793.0, 199.0, 60.0, 60.0)];
        [self.view addSubview:E2];

    
        
        if (win_phase3 > score3){
            score3 = win_phase3;
        }
        
                [self.audioController playEffect: kSoundCheer];
        
        
    }
    
    if(level_phase3>20){
        for (UIView *v in self.view.subviews) {
            if ([v isKindOfClass:[UIImageView class]]) {
                [v removeFromSuperview];
            }
        }
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"END of The Phase. " message:nil delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

- (IBAction)speaker:(id)sender {
    //tap to play the sound for each level
    
    if(level_phase3>=0 && level_phase3 <=20){
        int phase = levelindex_phase3[level_phase3];
        NSString *number = [NSString stringWithFormat:@"%d",phase];
        number = [number stringByAppendingString:@".wav"];
        [self.audioController playEffect: number];
    }
    
}



-(void) nextLevel
{   //remove all imgages
    for (UIView *v in self.view.subviews) {
        if ([v isKindOfClass:[UIImageView class]]) {
            [v removeFromSuperview];
        }
    }
    
    // go to next level and initialize the new level
	// resets all the variables
    level_phase3++;
    mistake_phase3 = NO;
    k=0;
    check_phase3[0] = 0;
    check_phase3[1] = 0;
    check_phase3[2] = 0;
    check_phase3[3] = 0;
    check_phase3[4] = 0;
    
    //load the images for buttons which have the different functions
    //load the letters for five buttons
    UIImageView *button1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][0]]]];
    [button1 setFrame:CGRectMake(84.0, 320.0, 60.0, 60.0)];
    [self.view addSubview:button1];
    UIImageView *button2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][1]]]];
    [button2 setFrame:CGRectMake(280.0, 500.0, 60.0, 60.0)];
    [self.view addSubview:button2];
    UIImageView *button3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][2]]]];
    [button3 setFrame:CGRectMake(480.0, 320.0, 60.0, 60.0)];
    [self.view addSubview:button3];
    UIImageView *button4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][3]]]];
    [button4 setFrame:CGRectMake(680.0, 500.0, 60.0, 60.0)];
    [self.view addSubview:button4];
    UIImageView *button5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase3[level_phase3][4]]]];
    [button5 setFrame:CGRectMake(882.0, 320.0, 60.0, 60.0)];
    [self.view addSubview:button5];
    
    
    UIImageView *nextlevel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextlevel.png"]];
    [nextlevel setFrame:CGRectMake(820.0, 600.0, 100.0, 100.0)];
    [self.view addSubview:nextlevel];
    UIImageView *speaker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speaker.png"]];
    [speaker setFrame:CGRectMake(78.0, 67.0, 69.0, 69.0)];
    [self.view addSubview:speaker];
    UIImageView *hint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nohint.png"]];
    [hint setFrame:CGRectMake(166.0, 67.0, 69.0, 69.0)];
    [self.view addSubview:hint];
}

- (bool) found:(int[])array length:(int)length num:(int)n {
    for(int i=0; i<length; i++){
        if(array[i] == n)
            return true;
    }
    return false;
}

@end
