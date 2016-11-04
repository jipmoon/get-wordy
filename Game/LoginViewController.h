//  LoginViewController.h
//  GetWordy
//
//  Created by Hyung Jip Moon on 10/26/2013.
//  Copyright (c) 2013 Hyung Jip Moon. All rights reserved.
//
//  Description: This class is a LoginViewController shows the Login view
//               Users can login with their registered username and password
//
//
//  Functions:  Once users have registered, they can login at this page. The users can input their username and password. The username and password must be stored locally.
//              To login successfully, the username and password must be matched to stored registeration information.
//
//  Bugs: None

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

//Displays username textfield and password text field
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

//Sign In Button: Log in user to the application and retrieves information from stored information
- (IBAction)signInButton:(id)sender;

@end
