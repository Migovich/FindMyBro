//
//  ConnectViewController.m
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import "ConnectViewController.h"

@interface ConnectViewController ()

@end

@implementation ConnectViewController

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *currentString = [_lettersField.text stringByReplacingCharactersInRange:range withString:string];
    long int length = [currentString length];
    if (length > 3) {
        [_numbersField becomeFirstResponder];
        return NO; // add the line
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lettersField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
