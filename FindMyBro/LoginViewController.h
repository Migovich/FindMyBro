//
//  LoginViewController.h
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (assign, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (assign, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginTouched:(UIButton*)sender;

@end


