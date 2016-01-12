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
@synthesize commonString;

NSMutableArray * pickerList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //gotPackage = [NSUserDefaults standardUserDefaults];
    //lblGotData.text = [gotPackage objectForKey:@"gotit"];
    //lblGotData.text = self.commonString;
    pickerList = [[NSMutableArray alloc] initWithObjects:@"iOS", @"Android", @"Web", nil];
    myPicker.delegate = self;
}

-(NSInteger)numberOfComponentsInPickerView: (UIPickerView*)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    return pickerList.count;
}
-(void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    int selectedIndex = [myPicker selectedRowInComponent:0];
    txtPicker.text = [pickerList objectAtIndex:selectedIndex];
}
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerList objectAtIndex:row];
    
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
