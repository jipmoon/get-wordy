//
//  Phase One ViewController.m
//  Game
//
//  Created by Hyung Jip Moon on 2013-11-05.
//  Copyright (c) 2013 Hyung Jip Moon. All rights reserved.
//

#import "PhaseOneViewController.h"
#import "config.h"
#import "AudioController.h"



@interface PhaseOneViewController ()

@end

@implementation PhaseOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    level=0;
    win = 0;
    //Preloads audio files
    self.audioController = [[AudioController alloc] init];
    [self.audioController preloadAudioEffects: kAudioEffectFiles];
    
    //load the images for buttons which have the different functions
    
    //load the letters for three buttons
    UIImageView *button1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist[level][0]]]];
    [button1 setFrame:CGRectMake(296.0, 430.0, 60.0, 60.0)];
    [self.view addSubview:button1];
    UIImageView *button2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist[level][1]]]];
    [button2 setFrame:CGRectMake(491.0, 252.0, 60.0, 60.0)];
    [self.view addSubview:button2];
    UIImageView *button3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist[level][2]]]];
    [button3 setFrame:CGRectMake(690.0, 430.0, 60.0, 60.0)];
    [self.view addSubview:button3];
    
    
    
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



//Pressing this button will store 1 to the check array when button1 is tapped
- (IBAction)button1:(id)sender {

        
    //Makes sure you can only press a button once
	//If button was never pressed before or a mistake has not happen yet, do this
    if(![self found:check length:3 num:1] && mistake==NO){
        //Adds 1 to the check array
        i++;
        check[i-1]=1;
        
        //Plays sound of the letter
        char c = wordlist[level][0];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        
        //Mistake made
        if(check[i-1]!=answer[level][i-1]){
            //
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake = YES;
            
        }
        //Added need extra conditions to draw a line
        if(check[0]==2 && check[1]==1 && answer[level][0]==2 && answer[level][1] == 1){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(347.0, 301.0, 145.0, 135.0)];
            
            [self.view addSubview:Line];
        }
        if(check[1]==3 && check[2]==1&& answer[level][1]==3 && answer[level][2] == 1){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(354.0, 450.0, 336.0, 17.0)];
            
            [self.view addSubview:Line];
            
        }
		//Checks to see if the check array and the answer are the same
        int sameCount = 0;
        for(int i=0; i<3; i++){
            if(check[i] == answer[level][i]){
                sameCount++;
            }
        }
		//If so then they've completed the level.
        if(sameCount == 3){
                                    
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win++;
            if (win > score1){
                score1 = win;
            }
            
        }
        sameCount = 0;
        
    } else if(check[2] != 0 || mistake == YES){
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
    
}
//See button1 for the comments. They're identical.
//store 2 to the check array when button2 is tapped, drawing the line
- (IBAction)button2:(id)sender {
        
    if(![self found:check length:3 num:2] && mistake==NO){
        i++;
        check[i-1]=2;
        
        char c = wordlist[level][1];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        if(check[i-1]!=answer[level][i-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake = YES;
            
        }
        
        
        if(check[0]==1 && check[1]==2 && answer[level][0]==1 && answer[level][1] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left line.png"]];
            
            [Line setFrame:CGRectMake(347.0, 301.0, 145.0, 135.0)];
            
            [self.view addSubview:Line];
        }
        
        if(check[1]==3 && check[2]==2&& answer[level][1]==3 && answer[level][2] == 2){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(550.0, 298.0, 145.0, 135.0)];
            
            [self.view addSubview:Line];
        }
        
        int sameCount = 0;
        for(int i=0; i<3; i++){
            if(check[i] == answer[level][i]){
                sameCount++;
            }
        }
        if(sameCount == 3){
            
            
            [self.audioController playEffect: kSoundWin];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win++;
            if (win > score1){
                score1 = win;
            }
            
        }
        sameCount = 0;
    }else if(check[2] != 0 || mistake == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

//See button1 for the comments. They're identical.
//store 3 to the check array when button3 is tapped, drawing the line
- (IBAction)button3:(id)sender {
        
    
    if(![self found:check length:3 num:3] && mistake==NO){
        i++;
        check[i-1]=3;
        
        char c = wordlist[level][2];
        NSString *letter = [NSString stringWithFormat:@"%c", c];
        letter = [letter stringByAppendingString:@".wav"];
        [self.audioController playEffect: letter];
        
        if(check[i-1]!=answer[level][i-1]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Better Luck Next Time!" message:@"Please Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            mistake = YES;
            
        }
        
        
        if(check[1]==2 && check[2]==3&& answer[level][1]==2 && answer[level][2] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(550.0, 298.0, 145.0, 135.0)];
                                   
            [self.view addSubview:Line];
        }
        
        if(check[0]==2 && check[1]==3&& answer[level][0]==2 && answer[level][1] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right line.png"]];
            
            [Line setFrame:CGRectMake(550.0, 298.0, 145.0, 135.0)];
            
            [self.view addSubview:Line];
        }
        
        
        if(check[0]==1 && check[1]==3&& answer[level][0]==1 && answer[level][1] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(354.0, 450.0, 336.0, 17.0)];
            
            [self.view addSubview:Line];
        }
        if(check[1]==1 && check[2]==3&& answer[level][1]==1 && answer[level][2] == 3){
            UIImageView *Line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom line.png"]];
            
            [Line setFrame:CGRectMake(354.0, 450.0, 336.0, 17.0)];
            
            [self.view addSubview:Line];
        }
        
        int sameCount = 0;
        for(int i=0; i<3; i++){
            if(check[i] == answer[level][i]){
                sameCount++;
            }
        }
        if(sameCount == 3){
            
            
            [self.audioController playEffect:kSoundWin];
            
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You got it!" message:@" Press 'Next Level' for the Next Level." delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
            [alert show];
            win++;
            if (win > score1){
                score1 = win;
            }
            
        }
        sameCount = 0;
        
    }else if(check[2] != 0 || mistake == YES) {
        [self nextLevel];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Over." message:@"Please Press 'OK' for the Next Level." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}


// Button to go to next level when the level is done and reset all the variables.
- (IBAction)nextlevel:(id)sender {
    //See method below, it resets the variables and send the player to next level
    
    if(level < 20){
    [self nextLevel];
    }
    //If level 20 has been reached, a Well Done message will only be displayed
    if(level==20){
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
        
        if (win > score1){
            score1 = win;
        }

                [self.audioController playEffect: kSoundCheer];
        
        
    }
    
    if(level>20){
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
        if(level>=0 && level <=20){
        int phase = levelindex[level];
        NSString *number = [NSString stringWithFormat:@"%d",phase];
        number = [number stringByAppendingString:@".wav"];
        [self.audioController playEffect: number];
    }
    
}

- (IBAction)hint:(id)sender {
      
    if(level>=0 && level <=20){
        UIImageView *hint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",levelindex[level]]]];
        [hint setFrame:CGRectMake(435.0, 80.0, 180.0, 90.0)];
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
    level++;
    mistake = NO;
    i=0;
    check[0] = 0;
    check[1] = 0;
    check[2] = 0;
    
    //load the images for buttons which have the different functions
    //load the letters for three buttons
    UIImageView *button1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist[level][0]]]];
    [button1 setFrame:CGRectMake(296.0, 430.0, 60.0, 60.0)];
    [self.view addSubview:button1];
    UIImageView *button2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist[level][1]]]];
    [button2 setFrame:CGRectMake(491.0, 252.0, 60.0, 60.0)];
    [self.view addSubview:button2];
    UIImageView *button3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%c.jpg",wordlist[level][2]]]];
    [button3 setFrame:CGRectMake(690.0, 430.0, 60.0, 60.0)];
    [self.view addSubview:button3];
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


//Method to check if a particular number is in the array
- (bool) found:(int[])array length:(int)length num:(int)n {
    for(int i=0; i<length; i++){
        if(array[i] == n)
            return true;
    }
    return false;
}

@end
