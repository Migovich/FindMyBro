//
//  ConnectViewController.h
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *lettersField;
@property (strong, nonatomic) IBOutlet UITextField *numbersField;

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
