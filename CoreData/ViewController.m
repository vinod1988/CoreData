//
//  ViewController.m
//  CoreData
//
//  Created by Vinod Vishwakarma on 03/04/15.
//  Copyright (c) 2015 Vinod Vishwakarma. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Emp.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *mnObjectContext = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Emp" inManagedObjectContext:mnObjectContext];
    
    NSFetchRequest *fetchRequest  = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    
    
    NSError *error;
    
    NSArray *responseArray = [mnObjectContext executeFetchRequest:fetchRequest error:&error];

    NSLog(@"responseArray = %@", responseArray);
    
    
    for (int i = 0; i < responseArray.count; i++) {
        Emp *emp = [responseArray objectAtIndex:i];
        
        NSLog(@"emp.emp_id = %@", emp.emp_id);
        NSLog(@"emp.emp_id = %@", emp.emp_name);
        NSLog(@"emp.emp_id = %@", emp.emp_mobile);

    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonAction:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *mnObjectContext = [appDelegate managedObjectContext];
    
    // way 1
//    NSManagedObject *mObject = [NSEntityDescription insertNewObjectForEntityForName:@"Emp" inManagedObjectContext:mnObjectContext];
//    
//    [mObject setValue:[NSNumber numberWithInt:[self.idField.text intValue]] forKey:@"emp_id"];
//    [mObject setValue:self.nameField.text forKey:@"emp_name"];
//    [mObject setValue:self.mobileField.text forKey:@"emp_mobile"];
    
    //--- way 2
    Emp *emp = [NSEntityDescription insertNewObjectForEntityForName:@"Emp" inManagedObjectContext:mnObjectContext];
    emp.emp_id = [NSNumber numberWithInt:[self.idField.text intValue]];
    emp.emp_name = self.nameField.text;
    emp.emp_mobile = self.mobileField.text;
    
    NSError *error;
    BOOL success =  [mnObjectContext save:&error];
    if (success) {
        UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:nil
                                                         message:@"Successfully saved data"
                                                        delegate:nil
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:nil
                                                         message:@"Fail to save data"
                                                        delegate:nil
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil];
        [alert show];

    }
    
    
}

- (IBAction)cancelButtonAction:(id)sender {
    
}
@end
