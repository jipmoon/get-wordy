//
//  CreditViewController.h
//  Game
//
//  Created by Hyung Jip Moon on 11/30/13.
//  Copyright (c) 2013 pengzhi. All rights reserved.
//
//  Description: This class is a LoginViewController shows the Login view
//               Users can login with their registered username and password
//
//
//  Functions:  Once users have registered, they can login at this page. The users can input their username and password. The username and password must be stored locally.
//              To login successfully, the username and password must be matched to stored registeration information.
//
//  Bugs: None

#import <Foundation/Foundation.h>

@interface CreditViewController : UIViewController
- (IBAction)LinkToGetWordy:(id)sender;
- (IBAction)LinkToMessageComposer:(id)sender;

@end
