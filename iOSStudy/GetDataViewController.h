//
//  GetDataViewController.h
//  iOSStudy
//
//  Created by PC19 on 12/12/15.
//  Copyright (c) 2015 OrganizationName. All rights reserved.
//

#import "ViewController.h"

@interface GetDataViewController : ViewController{
    
    __weak IBOutlet UILabel *lblGotData;
    NSUserDefaults *gotPackage;
    
    __weak IBOutlet UIPickerView *myPicker;
    __weak IBOutlet UILabel *txtPicker;
    __weak IBOutlet UIPickerView *pickerJackbot;
    
    NSTimer* timer;
    __weak IBOutlet UILabel *lblNSTimer;
}
- (IBAction)startNSTimer:(id)sender;
- (IBAction)stopNSTimer:(id)sender;


@property NSString* commonString;

@end
