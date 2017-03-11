//
//  LoginViewController.m
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)loginTouched:(UIButton*)sender {
    
}

- (void)viewDidLoad {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
