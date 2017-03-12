//
//  LoginViewController.m
//  FindMyBro
//
//  Created by Myhovych on 11.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import "LoginViewController.h"
#import "ColorUtils.h"
#import "SwoppyDesignConstants.h"
#import "Login.h"
#import "APContact.h"
#import "APAddressBook.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) NSArray *bgImages;
@property (assign, nonatomic) NSInteger imgAmount;

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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self validateTextFields];
    return YES;
}

- (void) validateTextFields {
    if ((_phoneNumberField.text.length > 0) && (_passwordField.text.length > 0)) {
        _loginButton.enabled = YES;
    }
    else {
        _loginButton.enabled = NO;
    }
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor colorWithRGBValue:kSwoppyDesignLoginBackgroundColor];
    
    self.bgImages = @[@"bg_image_1",
                      @"bg_image_2",
                      @"bg_image_3",
                      @"bg_image_4"];
    self.imgAmount = 0;
    
    [self animationImageWithAmount:self.imgAmount];
}

- (void)animationImageWithAmount:(NSInteger)imgAmount
{
    __weak typeof(self) weakSelf = self;
    [UIView transitionWithView:weakSelf.bgImageView
                      duration:3.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        weakSelf.bgImageView.image = [UIImage imageNamed:weakSelf.bgImages[weakSelf.imgAmount]];
                    }completion:^(BOOL finished) {
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [weakSelf animationImageWithAmount:[weakSelf getNextImageAmount]];
                        });
                    }];
}

- (NSInteger) getNextImageAmount
{
    self.imgAmount +=1;
    if (self.imgAmount >= self.bgImages.count) {
        self.imgAmount = 0;
    }
    
    return self.imgAmount;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [_loginButton setEnabled:NO];
    [self validateTextFields];
    [self setupUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
