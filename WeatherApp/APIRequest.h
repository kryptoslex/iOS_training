//
//  APIRequest.h
//  WeatherApp
//
//  Created by MyKeL on 7/20/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIRequest : NSObject

- (void)fetchWeatherForecastWithParameters:(NSDictionary *)parameters
                                 onSuccess:(void (^)(id JSON))success
                                 onFailure:(void (^)(NSError *error))fault;

- (void)fetchWeatherWithParameters:(NSDictionary *)parameters
                                 onSuccess:(void (^)(id JSON))success
                                 onFailure:(void (^)(NSError *error))fault;

@end
