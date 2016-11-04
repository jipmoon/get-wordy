//  RegisterViewController.h
//  GetWordy
//
//  Created by Hyung Jip Moon on 10/26/2013.
//  Copyright (c) 2013 Hyung Jip Moon. All rights reserved.
//
//  Description: This class is a RegisterViewController shows the Registeration view
//               Users can register their username and password at this stage.
//
//
//  Functions:  Once the 'Welcome Screen' shows,the user can move to registeration page by clicking 'Register' button.
//              The users can register their username and password. By registering, the username and password must be stored locally.
//
//  Bugs: None

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *setUserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *setPasswordTextField;


- (IBAction)setUserNameAndPasswordButton:(id)sender;

@end