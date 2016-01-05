//
//  CustomTableViewCell.m
//  iOSStudy
//
//  Created by PC19 on 1/5/16.
//  Copyright (c) 2016 OrganizationName. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize cellSingerName;
@synthesize cellImg;
@synthesize cellDesc;

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
