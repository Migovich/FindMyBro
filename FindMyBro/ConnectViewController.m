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

#define MAXLENGTHL 3
#define MAXLENGTHN 4

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField == _lettersField) {
        long int lengtha = [_lettersField.text length];
        //NSLog(@"lenghta = %ld", lengtha);
        if (lengtha >= MAXLENGTHL && ![string isEqualToString:@""]) {
            _lettersField.text = [_lettersField.text substringToIndex:MAXLENGTHL];
           [_numbersField becomeFirstResponder];
            return NO;
        }
        return YES;
        
    } else if (textField == _numbersField) {
        long int lengthb = [_numbersField.text length];
        //NSLog(@"lenghtb = %ld",lengthb);
        if (lengthb >= MAXLENGTHN && ![string isEqualToString:@""]) {
            _numbersField.text = [_numbersField.text substringToIndex:MAXLENGTHN];
            return NO;
        }
        return YES;
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lettersField.delegate = self;
    self.numbersField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
