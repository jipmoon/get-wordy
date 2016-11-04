//  LoginViewController.m
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

#import "LoginViewController.h"

@interface LoginViewController ()
{
    NSFileManager *fileManager;
    NSString *fullPath;
    NSFileHandle *fileHandle;
}

@end

@implementation LoginViewController

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
    
    
    // Setup path and file name to store and read from text file
    self.passwordTextField.secureTextEntry = YES;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    
    // Stores registration information(username and login) locally
    fileManager = [NSFileManager defaultManager];
    fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[filePath stringByAppendingPathComponent:@"storeUserInfo.txt"]];
    
    [fileManager changeCurrentDirectoryPath:filePath];
    fullPath = [NSString stringWithFormat:@"%@", [filePath stringByAppendingPathComponent:@"storeUserInfo.txt"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


// Sign in button: Log in user to the application and retrieves information from server
- (IBAction)signInButton:(id)sender {
    BOOL fileExist = [[NSFileManager defaultManager]fileExistsAtPath:fullPath];
    
    // If password and username doesn't match or typed unregistered information, it displays an error message
    if (!fileExist) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You haven not set username and password" message:@"Please set username and password" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    // Checks from the locally stored file whether the information is correct or not 
    else
    {
        fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:fullPath];
        NSString *stringFromFile = [NSString stringWithContentsOfFile:fullPath encoding:NSASCIIStringEncoding error:nil];
        
        const char *charsFromFile = [stringFromFile UTF8String];
        
        NSString *userNameFromFile = [[NSString alloc]init];
        NSString *passwordFromFile = [[NSString alloc]init];
        
        int count = 0;
        // Reads the registered login information from the text file
        for (int i = 0; i < strlen(charsFromFile); i++) {
            if (charsFromFile[i]=='\n') {
                ++count;
            }
            // Append characters to username from the file
            else if(count == 0) 
            {
                userNameFromFile = [userNameFromFile stringByAppendingString:[NSString stringWithFormat:@"%c", charsFromFile[i]]];
            }
            // Append characters to password from the file
            else
            {
                passwordFromFile = [passwordFromFile stringByAppendingString:[NSString stringWithFormat:@"%c", charsFromFile[i]]];
            }
        }
        // If user logs in successfully, he/she leads to the main menu. "getwordyMainMenu" refers to the storyboard ID of main menu. 
        if ([userNameFromFile isEqualToString:self.userNameTextField.text] && [passwordFromFile isEqualToString:self.passwordTextField.text]) {

            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"getwordyMainMenu"];
            [self presentViewController:vc animated:YES completion:nil];
        }
        // If user logs in unsuccesfully, the error message shows. 
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Username or Password is incorrect. Please Try Again." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        
    }
}
@end
