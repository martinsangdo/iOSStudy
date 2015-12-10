//
//  MapAnnotation.m
//  iOSStudy
//
//  Created by PC19 on 12/10/15.
//  Copyright (c) 2015 OrganizationName. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation
@synthesize title;
@synthesize coordinate;

-(id)initWithTitle:(NSString *)title addCoordinate:(CLLocationCoordinate2D)coordinate2d{
    self.title = title;
    self.coordinate = coordinate;
    return self;
}

@end
