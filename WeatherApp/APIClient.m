//
//  APIClient.m
//  WeatherApp
//
//  Created by MyKeL on 7/20/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import "APIClient.h"

#define API_BASE_URL @"http://api.openweathermap.org/data"
#define API_VERSION @"2.5/"

@implementation APIClient


+(APIClient*)sharedClient
{
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    //what does this do?
    dispatch_once(&onceToken, ^{
        NSString *requestURL = [NSString stringWithFormat:@"%@/%@", API_BASE_URL, API_VERSION];
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:requestURL]];
    });
    
    return _sharedClient;
    
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    return self;
}

@end
