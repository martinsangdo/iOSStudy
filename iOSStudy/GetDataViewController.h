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
}

@property NSString* commonString;

@end
