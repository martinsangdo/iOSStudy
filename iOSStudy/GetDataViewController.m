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
NSMutableArray * pickerList2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //gotPackage = [NSUserDefaults standardUserDefaults];
    //lblGotData.text = [gotPackage objectForKey:@"gotit"];
    //lblGotData.text = self.commonString;
    pickerList = [[NSMutableArray alloc] initWithObjects:@"iOS", @"Android", @"Web", nil];
    pickerList2 = [[NSMutableArray alloc] initWithObjects:@"Beginner", @"Pro", @"Expert", @"Native", nil];
    myPicker.delegate = self;
}
//set column of picker view
-(NSInteger)numberOfComponentsInPickerView: (UIPickerView*)pickerView{
//    return 1;
    return 2;
}
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return pickerList.count;
    if (component == 0){
        return pickerList.count;
    } else {
        return pickerList2.count;
    }
    return 0;
}
-(void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    int selectedIndex = [myPicker selectedRowInComponent:0];
    //txtPicker.text = [pickerList objectAtIndex:selectedIndex];
}
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return [pickerList objectAtIndex:row];
    if (component == 0){
        return [pickerList objectAtIndex:row];
    } else {
        return [pickerList2 objectAtIndex:row];
    }
    return 0;
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
