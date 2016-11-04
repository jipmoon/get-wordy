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

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    NSFileManager *fileManager;
    NSString *fullPath;
    NSFileHandle *fileHandle;
}
@end

@implementation RegisterViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.passwordTextField.secureTextEntry = YES;
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    
    fileManager = [NSFileManager defaultManager];
    fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[filePath stringByAppendingPathComponent:@"storeUserInfo.txt"]];
    
    [fileManager changeCurrentDirectoryPath:filePath];
    fullPath = [NSString stringWithFormat:@"%@", [filePath stringByAppendingPathComponent:@"storeUserInfo.txt"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)setUserNameAndPasswordButton:(id)sender {
    
    BOOL fileExist = [[NSFileManager defaultManager]fileExistsAtPath:fullPath];
    
    if (!fileExist) {
        [fileManager createFileAtPath:fullPath contents:nil attributes:nil];
    }
    
    NSString *userNameAndPasswordString = [NSString stringWithFormat:@"%@\n%@",self.setUserNameTextField.text, self.setPasswordTextField.text];
    
    fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:fullPath];
    NSData *data;
    const char *bytesOfUserNameAndPassword = [userNameAndPasswordString UTF8String];
    data = [NSData dataWithBytes:bytesOfUserNameAndPassword length:strlen(bytesOfUserNameAndPassword)];
    [data writeToFile:fullPath atomically:YES];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Successfully Created Username and Password" message:@"Completed" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}



@end
