//
//  Phase two ViewController.m
//  Game
//
//  Created by Hyung Jip Moon on 2013-11-05.
//  Copyright (c) 2013 Hyung Jip Moon. All rights reserved.
//

#import "PhaseTwoViewController.h"
#import "config2.h"
#import "AudioController.h"


@interface PhaseTwoViewController ()

@end

@implementation PhaseTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    level_phase2 = 0;
    win_phase2 = 0;
    //Preloads audio files
    self.audioController = [[AudioController alloc] init];
    [self.audioController preloadAudioEffects: kAudioEffectFiles];
    
    //load the images for buttons which have the different functions
    //load the letters for four buttons
    UIImageView *button1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][0]]]];
    [button1 setFrame:CGRectMake(174.0, 322.0, 60.0, 60.0)];
    [self.view addSubview:button1];
    UIImageView *button2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][1]]]];
    [button2 setFrame:CGRectMake(368.0, 512.0, 60.0, 60.0)];
    [self.view addSubview:button2];
    UIImageView *button3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][2]]]];
    [button3 setFrame:CGRectMake(570.0, 322.0, 60.0, 60.0)];
    [self.view addSubview:button3];
    UIImageView *button4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][3]]]];
    [button4 setFrame:CGRectMake(770.0, 512.0, 60.0, 60.0)];
    [self.view addSubview:button4];
    
    
    
    UIImageView *nextlevel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextlevel.png"]];
    
    [nextlevel setFrame:CGRectMake(820.0, 600.0, 100.0, 100.0)];
    [self.view addSubview:nextlevel];
    
    UIImageView *speaker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speaker.png"]];
    
    [speaker setFrame:CGRectMake(78.0, 67.0, 69.0, 69.0)];
    [self.view addSubview:speaker];
    
    
    UIImageView *hint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hint.png"]];
    
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
    if(![self found:check_phase2 length:4 num:1] && mistake_phase2==NO){
        j++;
        check_phase2[j-1]=1;
        
        //Plays sound of the letter
        char c = wordlist_phase2[level_phase2][0];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        //Mistake made
        if(check_phase2[j-1]!=answer_phase2[level_phase2][j-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase2 = YES;
            
        }
    } else if(check_phase2[3] != 0 || mistake_phase2 == YES){
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
//See button1 for the comments. They're identical.
//store 2 to the check array when button2 is tapped, drawing the line
- (IBAction)button2:(id)sender {
    if(![self found:check_phase2 length:4 num:2] && mistake_phase2==NO){
        j++;
        check_phase2[j-1]=2;
        
        //Plays sound of the letter
        char c = wordlist_phase2[level_phase2][1];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        //Mistake made
        if(check_phase2[j-1]!=answer_phase2[level_phase2][j-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase2 = YES;
            
            
        }
        
        //Added need extra conditions to draw a line
        if(check_phase2[0]==1 && check_phase2[1]==2 && answer_phase2[level_phase2][0]==1 && answer_phase2[level_phase2][1] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(230.0, 380.0, 145.0, 132.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[1]==3 && check_phase2[2]==2 && answer_phase2[level_phase2][1]==3 && answer_phase2[level_phase2][2] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(425.0, 375.0, 145.0, 140.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[2]==4 && check_phase2[3]==2 && answer_phase2[level_phase2][2]==4 && answer_phase2[level_phase2][3] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(429.0, 535.0, 342.0, 17.0)];
            
            [self.view addSubview:Line];
        }
        //Checks to see if the check array and the answer are the same
        int sameCount = 0;
        for(int i=0; i<4; i++){
            if(check_phase2[i] == answer_phase2[level_phase2][i]){
                sameCount++;
            }
        }
        //If so then they've completed the level.
        if(sameCount==4){
            
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"you got it :)" message:@" Press 'Next Level' to next level" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase2++;
            
            if (win_phase2 > score2){
                score2 = win_phase2;
            }
        }
        
        sameCount = 0;
    }else if(check_phase2[3] != 0 || mistake_phase2 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
//See button1 and button2 for the comments. They're identical.
//store 3 to the check array when button3 is tapped, drawing the line
- (IBAction)button3:(id)sender {
    if(![self found:check_phase2 length:4 num:3] && mistake_phase2==NO){
        j++;
        check_phase2[j-1]=3;
        
        char c = wordlist_phase2[level_phase2][2];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        
        if(check_phase2[j-1]!=answer_phase2[level_phase2][j-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase2 = YES;
            
        }
        
        if(check_phase2[0]==1 && check_phase2[1]==3 && answer_phase2[level_phase2][0]==1 && answer_phase2[level_phase2][1] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(235.0, 345.0, 335.0, 17.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[1]==2 && check_phase2[2]==3 && answer_phase2[level_phase2][1]==2 && answer_phase2[level_phase2][2] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(425.0, 375.0, 145.0, 140.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[2]==4 && check_phase2[3]==3 && answer_phase2[level_phase2][2]==4 && answer_phase2[level_phase2][3] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(630.0, 375.0, 145.0, 135.0)];
            
            [self.view addSubview:Line];
        }
        int sameCount = 0;
        for(int i=0; i<4; i++){
            if(check_phase2[i] == answer_phase2[level_phase2][i]){
                sameCount++;
            }
        }
        if(sameCount == 4){
            
            [self.audioController playEffect:kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase2++;
            
            if (win_phase2 > score2){
                score2 = win_phase2;
            }
        }
        sameCount = 0;
    }
    else if(check_phase2[3] != 0 || mistake_phase2 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

- (IBAction)button4:(id)sender {
    if(![self found:check_phase2 length:4 num:4] && mistake_phase2==NO){
        j++;
        check_phase2[j-1]=4;
        
        char c = wordlist_phase2[level_phase2][3];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        if(check_phase2[j-1]!=answer_phase2[level_phase2][j-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake_phase2 = YES;
            
        }
        
        if(check_phase2[1]==3 && check_phase2[2]==4 && answer_phase2[level_phase2][1]==3 && answer_phase2[level_phase2][2] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(630.0, 375.0, 145.0, 135.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[1]==2 && check_phase2[2]==4 && answer_phase2[level_phase2][1]==2 && answer_phase2[level_phase2][2] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(429.0, 535.0, 342.0, 17.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[2]==2 && check_phase2[3]==4 && answer_phase2[level_phase2][2]==2 && answer_phase2[level_phase2][3] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(429.0, 535.0, 342.0, 17.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check_phase2[2]==3 && check_phase2[3]==4 && answer_phase2[level_phase2][2]==3 && answer_phase2[level_phase2][3] == 4){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(630.0, 375.0, 145.0, 140.0)];
            
            [self.view addSubview:Line];
        }
        int sameCount = 0;
        for(int i=0; i<4; i++){
            if(check_phase2[i] == answer_phase2[level_phase2][i]){
                sameCount++;
            }
        }
        if(sameCount==4){
            
            [self.audioController playEffect:kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win_phase2++;
            
            if (win_phase2 > score2){
                score2 = win_phase2;
            }
        }
        sameCount = 0;
    }else if(check_phase2[3] != 0 || mistake_phase2 == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}


// going to next level when the level is done.
- (IBAction)nextlevel:(id)sender {
    
    if(level_phase2 < 20){
    [self nextLevel];
    }
    
    if(level_phase2==20){
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
        
        UIImageView *nextphase = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextphase.png"]];
        [nextphase setFrame:CGRectMake(859.0, 40.0, 100.0, 100.0)];
        [self.view addSubview:nextphase];
        
        
        
        if (win_phase2 > score2){
            score2 = win_phase2;
        }
        
        
        [self.audioController playEffect: kSoundCheer];
        
        
    }
    
    if(level_phase2>20){
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
    
    if(level_phase2>=0 && level_phase2 <=20){
        int phase = levelindex_phase2[level_phase2];
        NSString *number = [NSString stringWithFormat:@"%d",phase];
        number = [number stringByAppendingString:@".wav"];
        [self.audioController playEffect: number];
    }
    
}

- (IBAction)hint:(id)sender {
    //tap to display the word for hint
    
    if(level_phase2>=0 && level_phase2 <=20){
        UIImageView *hint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",levelindex_phase2[level_phase2]]]];
        [hint setFrame:CGRectMake(435.0, 80.0, 180.0, 140.0)];
        [self.view addSubview:hint];}
    
}

-(void) nextLevel
{
    //remove all imgages
    for (UIView *v in self.view.subviews) {
        if ([v isKindOfClass:[UIImageView class]]) {
            [v removeFromSuperview];
        }
    }
    
    // go to next level and initialize the new level
	// resets all the variables
    level_phase2++;
    mistake_phase2 = NO;
    j=0;
    check_phase2[0] = 0;
    check_phase2[1] = 0;
    check_phase2[2] = 0;
    check_phase2[3] = 0;
    
    //load the images for buttons which have the different functions
    //load the letters for four buttons
    UIImageView *button1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][0]]]];
    [button1 setFrame:CGRectMake(174.0, 322.0, 60.0, 60.0)];
    [self.view addSubview:button1];
    UIImageView *button2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][1]]]];
    [button2 setFrame:CGRectMake(368.0, 512.0, 60.0, 60.0)];
    [self.view addSubview:button2];
    UIImageView *button3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][2]]]];
    [button3 setFrame:CGRectMake(570.0, 322.0, 60.0, 60.0)];
    [self.view addSubview:button3];
    UIImageView *button4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist_phase2[level_phase2][3]]]];
    [button4 setFrame:CGRectMake(770.0, 512.0, 60.0, 60.0)];
    [self.view addSubview:button4];
    UIImageView *nextlevel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextlevel.png"]];
    [nextlevel setFrame:CGRectMake(820.0, 600.0, 100.0, 100.0)];
    
    
    [self.view addSubview:nextlevel];
    UIImageView *speaker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speaker.png"]];
    [speaker setFrame:CGRectMake(78.0, 67.0, 69.0, 69.0)];
    [self.view addSubview:speaker];
    UIImageView *hint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hint.png"]];
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
