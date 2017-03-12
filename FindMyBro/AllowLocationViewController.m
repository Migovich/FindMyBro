//
//  AllowLocationViewController.m
//  FindMyBro
//
//  Created by Myhovych on 12.03.17.
//  Copyright © 2017 Artem Migovich. All rights reserved.
//

#import "AllowLocationViewController.h"

@interface AllowLocationViewController ()

@property (nonatomic, strong) CLLocationManager * locationManager;
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation AllowLocationViewController

-(void) startTrack{
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy =
    kCLLocationAccuracyNearestTenMeters;
    [self.locationManager startUpdatingLocation];
    self.geocoder = [[CLGeocoder alloc] init];
//    CLLocation *location = [locationManager location];
//    CLLocationCoordinate2D coordinate = [location coordinate];
//    [locationManager startUpdatingLocation];
}

- (IBAction)allowTouched:(UIButton*)sender {
    [self startTrack];
//    NSLog(@"location: %f", [self startTrack]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"location: %f", newLocation.coordinate.latitude);

    [self.geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks lastObject];
        
        NSString *street = placemark.thoroughfare;
        NSString *city = placemark.locality;
        NSString *posCode = placemark.postalCode;
        NSString *country = placemark.country;
        
        NSLog(@"we live in %@", placemark);
        
        // stopping locationManager from fetching again
        [self.locationManager stopUpdatingLocation];
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"failed to fetch current location : %@", error);
}

@end
