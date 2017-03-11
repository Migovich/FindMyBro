//
//  LoginViewController.m
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import "LoginViewController.h"
#import "Login.h"
#import "APContact.h"
#import "APAddressBook.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)loginTouched:(UIButton*)sender {
    Login * login = [Login new];
    login.password = _passwordField.text;

    NSLog(@"%@", login.phoneNumber);
    APAddressBook *addressBook = [[APAddressBook alloc] init];
    // don't forget to show some activity
    [addressBook loadContacts:^(NSArray <APContact *> *contacts, NSError *error)
    {
        
        // hide activity
        if (!error)
        {
            NSMutableArray * array = @[].mutableCopy;
            
            for (APContact * obj in contacts) {
                NSString * phoneNumber = obj.phones.firstObject.number;
                
                phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
                phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
                phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
                phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
                phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
                
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                f.numberStyle = NSNumberFormatterDecimalStyle;
                login.phoneNumber = [f numberFromString:phoneNumber];

                if (phoneNumber && obj.name.firstName && obj.name.lastName!= nil) {
                    [array addObject:@{@"phone":phoneNumber, @"Name":[NSString stringWithFormat: @"%@ %@", obj.name.firstName, obj.name.lastName]}];
                }
            }
            NSLog(@"Array: %@", array);
        }
        else
        {
            // show error
        }
    }];
}

- (void)viewDidLoad {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
