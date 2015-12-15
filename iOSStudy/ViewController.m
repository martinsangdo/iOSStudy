//
//  ViewController.m
//  iOSStudy
//
//  Created by PC19 on 12/5/15.
//  Copyright (c) 2015 OrganizationName. All rights reserved.
//

#import "ViewController.h"
#import "MapAnnotation.h"
#import "Constant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mapView.mapType = MKMapTypeHybrid;
    sendingPackage = [NSUserDefaults standardUserDefaults];
    listnamePackage = [NSUserDefaults standardUserDefaults];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [sendingPackage setObject:txtLat.text forKey:@"gotit"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchLocation:(id)sender {
    CLLocationCoordinate2D location;
    location.latitude = (double)[txtLat.text floatValue];
    location.longitude = (double)[txtLon.text floatValue];
    MapAnnotation *newAnnotation = [[MapAnnotation alloc] initWithTitle:@"here" addCoordinate:location];
    [mapView addAnnotation:newAnnotation];
    [self.view addSubview:mapView];
}

- (IBAction)showKhacVietList:(id)sender {
    [listnamePackage setObject:KHACVIET forKey:SINGER_KEYNAME];
}

- (IBAction)showTrungQuanList:(id)sender {
    [listnamePackage setObject:TRUNGQUAN forKey:SINGER_KEYNAME];
}
@end
