//
//  Weather.h
//  WeatherApp
//
//  Created by MyKeL on 7/21/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinate.h"
#import "Sys.h"
#import "MainNode.h"

@interface WeatherObj : NSObject


@property (nonatomic, strong) NSString *weatherID;
@property (nonatomic, strong) NSString *weatherVisibility;
@property (nonatomic, strong) NSString *weatherCity;
@property (nonatomic, strong) Coordinate *coordinate; //child obj dict
@property (nonatomic, strong) Sys *sys; //child obj dict
@property (nonatomic, strong) MainNode *mainnode; //child obj dict

@property NSDictionary *dataDict;


+ (WeatherObj *)initWithDictionary:(NSDictionary *)theDictionary;


@end
