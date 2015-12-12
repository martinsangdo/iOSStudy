//
//  GetDataViewController.m
//  iOSStudy
//
//  Created by PC19 on 12/12/15.
//  Copyright (c) 2015 OrganizationName. All rights reserved.
//

#import "GetDataViewController.h"

@interface GetDataViewController ()

@end

@implementation GetDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    gotPackage = [NSUserDefaults standardUserDefaults];
    lblGotData.text = [gotPackage objectForKey:@"gotit"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
