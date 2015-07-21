//
//  MainNode.h
//  WeatherApp
//
//  Created by MyKeL on 7/21/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainNode : NSObject

@property (nonatomic, strong) NSString *temp;
@property (nonatomic, strong) NSString *pressure;
@property (nonatomic, strong) NSString *humidity;
@property (nonatomic, strong) NSString *temp_min;
@property (nonatomic, strong) NSString *temp_max;

@end
