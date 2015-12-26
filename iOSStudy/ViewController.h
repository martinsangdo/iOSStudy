//
//  ViewController.h
//  iOSStudy
//
//  Created by PC19 on 12/5/15.
//  Copyright (c) 2015 OrganizationName. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController{
    
    __weak IBOutlet UITextField *txtLat;
    __weak IBOutlet UITextField *txtLon;
    __weak IBOutlet MKMapView *mapView;
    NSUserDefaults *sendingPackage;
    NSUserDefaults *listnamePackage;
}

- (IBAction)searchLocation:(id)sender;
- (IBAction)showKhacVietList:(id)sender;
- (IBAction)showTrungQuanList:(id)sender;
- (IBAction)showUpVC:(id)sender;

@end

