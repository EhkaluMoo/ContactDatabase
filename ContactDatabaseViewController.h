//
//  ContactDatabaseViewController.h
//  ContactDatabase
//
//  Created by webstudent on 10/6/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDatabaseAppDelegate.h"

@interface ContactDatabaseViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *fullname;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction)btnFind:(id)sender;
- (IBAction)btnSave:(id)sender;

@end
