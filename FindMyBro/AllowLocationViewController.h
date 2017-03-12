//
//  AllowLocationViewController.h
//  FindMyBro
//
//  Created by Myhovych on 12.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AllowLocationViewController : UIViewController<CLLocationManagerDelegate>

- (IBAction)allowTouched:(UIButton*)sender;

@end
