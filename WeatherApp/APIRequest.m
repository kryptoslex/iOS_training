//
//  APIRequest.m
//  WeatherApp
//
//  Created by MyKeL on 7/20/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import "APIRequest.h"
#import "APIClient.h"

@implementation APIRequest


//http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139
//http://api.openweathermap.org/data/2.5/forecast?lat=10.3312523&lon=123.9086006


//current weather
- (void)fetchWeatherForecastWithParameters:(NSDictionary *)parameters
                                 onSuccess:(void (^)(id JSON))success
                                 onFailure:(void (^)(NSError *error))fault {
    
    NSString *path = @"forecast";
    
    [[APIClient sharedClient] GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"fetchWeatherForecast responseObject: %@", responseObject);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fault(error);
    }];
}




//for forecasting
- (void)fetchWeatherWithParameters:(NSDictionary *)parameters
                                 onSuccess:(void (^)(id JSON))success
                                 onFailure:(void (^)(NSError *error))fault {
    
    NSString *path = @"weather";
    
    [[APIClient sharedClient] GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"fetchWeather responseObject: %@", responseObject);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fault(error);
    }];
}

@end
