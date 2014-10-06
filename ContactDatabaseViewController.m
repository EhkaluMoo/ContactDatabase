//
//  ContactDatabaseViewController.m
//  ContactDatabase
//
//  Created by webstudent on 10/6/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "ContactDatabaseViewController.h"

@interface ContactDatabaseViewController ()

@end

@implementation ContactDatabaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnFind:(id)sender {
   ContactDatabaseAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    //http:stackoverflow.com/questions/2036094/case-insensitive-core-data-contains-or-biginswith-contraint
    //https:developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(fullname CONTAINS[cd] %@)", _fullname.text];
    
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    
    NSError *error;
    
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count]==0) {_status.text = @"No Matches";
    } else {
        matches = objects[0];
        self.fullname.text = [matches valueForKey:@"fullname"];
        self.phone.text = [matches valueForKey:@"phone"];
        self.email.text = [matches valueForKey:@"email"];
        self.status.text = [NSString stringWithFormat:@"%lu matches found", (unsigned long) [objects count]];
        
    }
}

- (IBAction)btnSave:(id)sender {
    //load ContactDatabase Contacts Table
    
    ContactDatabaseAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    
    //Connect TextFields to DataFields
    
    [newContact setValue:_fullname.text forKey:@"fullname"];
     [newContact setValue:_phone.text forKey:@"phone"];
     [newContact setValue:_email.text forKey:@"email"];
    
    //Clear testfields after save
    self.fullname.text = @"";
    self.phone.text = @"";
    self.email.text = @"";
    NSError *error;
    //Save
    [context save:&error];
    self.status.text = @"Contacts Save";
    
    
}
@end
