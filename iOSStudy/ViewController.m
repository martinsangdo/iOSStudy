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
#import "GetDataViewController.h"
#import "JSONTableViewController.h"

@interface ViewController ()

@end


@implementation ViewController

NSString *json = @"";
NSString *strUlr = @"http://216.240.43.69/campus500/getFoldersLimit?offset=0&length=20";
//NSString *strUlr = @"http://216.240.43.69/campus500/getUser?user_id=8d29c672-f577-49b4-b8a7-5559e488ef91";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mapView.mapType = MKMapTypeHybrid;
    sendingPackage = [NSUserDefaults standardUserDefaults];
    listnamePackage = [NSUserDefaults standardUserDefaults];
    //[self getNParseJSON];
}

-(void)getNParseJSON{
    NSURL *url = [NSURL URLWithString:strUlr];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    if(NSClassFromString(@"NSJSONSerialization"))
    {
        NSError *error = nil;
        id object = [NSJSONSerialization
                     JSONObjectWithData:jsonData
                     options:0
                     error:&error];
        
        if(error) {
            /* JSON was malformed, act appropriately here */
            NSLog(@"error parsing");
        }
        
        // the originating poster wants to deal with dictionaries;
        // assuming you do too then something like this is the first
        // validation step:
        if([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *results = object;
            /* proceed with results as you like; the assignment to
             an explicit NSDictionary * is artificial step to get
             compile-time checking from here on down (and better autocompletion
             when editing). You could have just made object an NSDictionary *
             in the first place but stylistically you might prefer to keep
             the question of type open until it's confirmed */
            NSLog(@"passed");
            for (id key in results) {
                NSDictionary *result1 = [results objectForKey:key];
                for (id key2 in result1) {
                    for (id key3 in key2) {
                        NSLog(@"key: %@ value: %@", key3, key2[key3]);
                    }
                }
            }
        }
        else
        {
            /* there's no guarantee that the outermost object in a JSON
             packet will be a dictionary; if we get here then it wasn't,
             so 'object' shouldn't be treated as an NSDictionary; probably
             you need to report a suitable error condition */
            NSLog(@"error parsing");
        }
    }
    else
    {
        // the user is using iOS 4; we'll need to use a third-party solution.
        // If you don't intend to support iOS 4 then get rid of this entire
        // conditional and just jump straight to
        // NSError *error = nil;
        // [NSJSONSerialization JSONObjectWithData:...
        NSLog(@"error parsing");
    }
    
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
//open another view controller by code
- (IBAction)showUpVC:(id)sender {
    GetDataViewController *v2Controller = [self.storyboard instantiateViewControllerWithIdentifier:@"v2"];
    v2Controller.commonString = @"333";
    [self.navigationController pushViewController:v2Controller animated:true];
}

- (IBAction)getJSONObject:(id)sender {
    NSString* url = txtURL.text;
    [sendingPackage setObject:url forKey:@"gotit"];
    JSONTableViewController *v2Controller = [self.storyboard instantiateViewControllerWithIdentifier:@"jsonView"];
    [self.navigationController pushViewController:v2Controller animated:true];
}
@end
