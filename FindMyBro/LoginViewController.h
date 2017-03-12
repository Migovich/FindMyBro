//
//  LoginViewController.h
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)loginTouched:(UIButton*)sender;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (void) validateTextFields;

@end


