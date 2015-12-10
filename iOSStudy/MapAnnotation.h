//
//  MapAnnotation.h
//  iOSStudy
//
//  Created by PC19 on 12/10/15.
//  Copyright (c) 2015 OrganizationName. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject
//global variable
@property (nonatomic, strong) NSString *title;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString*)title addCoordinate:(CLLocationCoordinate2D)coordinate2d;
@end
