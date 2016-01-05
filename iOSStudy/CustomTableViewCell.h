//
//  CustomTableViewCell.h
//  iOSStudy
//
//  Created by PC19 on 1/5/16.
//  Copyright (c) 2016 OrganizationName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImg;
@property (weak, nonatomic) IBOutlet UILabel *cellSingerName;
@property (weak, nonatomic) IBOutlet UILabel *cellDesc;

@end
