//
//  ViewController.h
//  CoreData
//
//  Created by Vinod Vishwakarma on 03/04/15.
//  Copyright (c) 2015 Vinod Vishwakarma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *idField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;

- (IBAction)saveButtonAction:(id)sender;
- (IBAction)cancelButtonAction:(id)sender;

@end

