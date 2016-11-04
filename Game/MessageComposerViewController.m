//
//  MessageComposerViewController.m
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

// Credits: MessageComposer is based on the sample code from: https://developer.apple.com/library/ios/samplecode/MessageComposer/Introduction/Intro.html


#import <MessageUI/MessageUI.h>

#import "MessageComposerViewController.h"

@interface MessageComposerViewController () <
    MFMailComposeViewControllerDelegate,
    MFMessageComposeViewControllerDelegate,
    UINavigationControllerDelegate
>
// UILabel for displaying the result of the sending the message.
@property (nonatomic, weak) IBOutlet UILabel *feedbackMsg;
@end


@implementation MessageComposerViewController

#pragma mark - Rotation

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
// -------------------------------------------------------------------------------
//	shouldAutorotateToInterfaceOrientation:
//  Disable rotation on iOS 5.x and earlier.  Note, for iOS 6.0 and later all you
//  need is "UISupportedInterfaceOrientations" defined in your Info.plist
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#endif

#pragma mark - Actions
- (IBAction)showMailPicker:(id)sender {

    // You must check that the current device can send email messages before you
    // attempt to create an instance of MFMailComposeViewController.  If the
    // device can not send email messages,
    // [[MFMailComposeViewController alloc] init] will return nil.  Your app
    // will crash when it calls -presentViewController:animated:completion: with
    // a nil view controller.
    if ([MFMailComposeViewController canSendMail])
    // The device can send email.
    {
        [self displayMailComposerSheet];
    }
    else
    // The device can not send email.
    {
        self.feedbackMsg.hidden = NO;
		self.feedbackMsg.text = @"Device not configured to send mail.";
    }
}



#pragma mark - Compose Mail/SMS

// -------------------------------------------------------------------------------
//	displayMailComposerSheet
//  Displays an email composition interface inside the application.
//  Populates all the Mail fields.
// -------------------------------------------------------------------------------
- (void)displayMailComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Report : "];
	
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"getwordy02@gmail.com"]; 

	
	[picker setToRecipients:toRecipients];
	
	// Attach an image to the email
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"ProgressGraph" ofType:@"png"];
	//NSData *myData = [NSData dataWithContentsOfFile:path];
	//[picker addAttachmentData:myData mimeType:@"image/png" fileName:@"ProgressGraph"];
	
	// Fill out the email body text
	NSString *emailBody = @" ";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentViewController:picker animated:YES completion:NULL];
}

// -------------------------------------------------------------------------------
//	displayMailComposerSheet
//  Displays an SMS composition interface inside the application.
// -------------------------------------------------------------------------------
- (void)displaySMSComposerSheet 
{
	MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
	picker.messageComposeDelegate = self;
	
    // You can specify one or more preconfigured recipients.  The user has
    // the option to remove or add recipients from the message composer view
    // controller.
    /* picker.recipients = @[@"Phone number here"]; */
    
    // You can specify the initial message text that will appear in the message
    // composer view controller.
    picker.body = @"Report : ";
    
	[self presentViewController:picker animated:YES completion:NULL];
}


#pragma mark - Delegate Methods

// -------------------------------------------------------------------------------
//	mailComposeController:didFinishWithResult:
//  Dismisses the email composition interface when users tap Cancel or Send.
//  Proceeds to update the message field with the result of the operation.
// -------------------------------------------------------------------------------
- (void)mailComposeController:(MFMailComposeViewController*)controller 
		didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	self.feedbackMsg.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			self.feedbackMsg.text = @"Result: Mail sending canceled";
			break;
		case MFMailComposeResultSaved:
			self.feedbackMsg.text = @"Result: Mail saved";
			break;
		case MFMailComposeResultSent:
			self.feedbackMsg.text = @"Result: Mail sent";
			break;
		case MFMailComposeResultFailed:
			self.feedbackMsg.text = @"Result: Mail sending failed";
			break;
		default:
			self.feedbackMsg.text = @"Result: Mail not sent";
			break;
	}
    
	[self dismissViewControllerAnimated:YES completion:NULL];
}

// -------------------------------------------------------------------------------
//	messageComposeViewController:didFinishWithResult:
//  Dismisses the message composition interface when users tap Cancel or Send.
//  Proceeds to update the feedback message field with the result of the
//  operation.
// -------------------------------------------------------------------------------
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller 
			  didFinishWithResult:(MessageComposeResult)result
{
	self.feedbackMsg.hidden = NO;
	// Notifies users about errors associated with the interface

    
	[self dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)graph:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"graphGenerator"];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
