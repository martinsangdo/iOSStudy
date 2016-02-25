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

NSMutableArray * jackbot1;
NSMutableArray * jackbot2;
NSMutableArray * jackbot3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //gotPackage = [NSUserDefaults standardUserDefaults];
    //lblGotData.text = [gotPackage objectForKey:@"gotit"];
    //lblGotData.text = self.commonString;
    pickerList = [[NSMutableArray alloc] initWithObjects:@"iOS", @"Android", @"Web", nil];
    pickerList2 = [[NSMutableArray alloc] initWithObjects:@"Beginner", @"Pro", @"Expert", @"Native", nil];
    
    jackbot1 = [[NSMutableArray alloc] initWithObjects:@"apple.jpg", @"cherry.png", @"dollar.jpg", @"seven.png", nil];
    jackbot2 = [[NSMutableArray alloc] initWithObjects:@"cherry.png", @"dollar.jpg", @"apple.jpg",  @"seven.png", nil];
    jackbot3 = [[NSMutableArray alloc] initWithObjects:@"apple.jpg", @"seven.png", @"cherry.png", @"dollar.jpg", nil];
    
    myPicker.tag = 1;
    myPicker.delegate = self;
    
    pickerJackbot.tag = 2;
    pickerJackbot.delegate = self;
}
//set column of picker view
-(NSInteger)numberOfComponentsInPickerView: (UIPickerView*)pickerView{
//    return 1;
    if (pickerView.tag == 1)
        return 2;
    else if (pickerView.tag == 2)
        return 3;
    return 0;
}
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return pickerList.count;
//    if (component == 0){
//        return pickerList.count;
//    } else {
//        return pickerList2.count;
//    }
//    return 0;
    if (pickerView.tag == 2){
        return jackbot1.count;
    }
    return 0;
}
-(void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //int selectedIndex = [myPicker selectedRowInComponent:0];
    //txtPicker.text = [pickerList objectAtIndex:selectedIndex];
    int selectedIndex = 0;
    if (pickerView.tag == 2)
        selectedIndex = [pickerJackbot selectedRowInComponent:0];

}
-(float)pickerView: (UIPickerView*)pickerView rowHeightForComponent:(NSInteger) component{
    if (pickerView.tag == 2)
        return 100;
    return 70;
}
/*
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return [pickerList objectAtIndex:row];
    if (component == 0){
        return [pickerList objectAtIndex:row];
    } else {
        return [pickerList2 objectAtIndex:row];
    }
    return 0;
}
*/
-(UIView*)pickerView:(UIPickerView*)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImageView * tmp;
    if (pickerView.tag == 2){
        NSString* imgName = [jackbot1 objectAtIndex:row];
        UIImage * uiImage = [UIImage imageNamed:imgName];
        tmp = [[UIImageView alloc] initWithImage:uiImage];
        tmp.frame = CGRectMake(0, 0, 70, 70);       //image size 50x50
    }
    return tmp;
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
int i=0;

-(void)run{
    lblNSTimer.text = [NSString stringWithFormat:@"%i", i++];
}

- (IBAction)startNSTimer:(id)sender {
    //run every seconds
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(run) userInfo:nil repeats:YES];
}

- (IBAction)stopNSTimer:(id)sender {
    [timer invalidate];
}

@end
