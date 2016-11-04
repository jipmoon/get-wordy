//
//  CreditViewController.m
//  Game
//
//  Created by Hyung Jip Moon on 11/30/13.
//  Copyright (c) 2013 hyungjip. All rights reserved.
//
//  Description: This class is a CreditViewController that is part of 'Credits' page. If shows the Login view
//               Users can login with their registered username and password
//
//
//  Functions:  Once users have registered, they can login at this page. The users can input their username and password. The username and password must be stored locally.
//              To login successfully, the username and password must be matched to stored registeration information.
//
//  Bugs: None
#import "CreditViewController.h"

@implementation CreditViewController

- (IBAction)LinkToGetWordy:(id)sender {
    // Leads to our group's web site by clicking the button
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://sites.google.com/site/group15cmpt275project"]];
}

- (IBAction)LinkToMessageComposer:(id)sender {
    // Leads to Open Source provider MessageComposer's web site by clicking the button
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://developer.apple.com/library/ios/samplecode/MessageComposer/Introduction/Intro.html"]];
}
@end
