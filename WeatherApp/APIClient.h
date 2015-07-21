//
//  APIClient.h
//  WeatherApp
//
//  Created by MyKeL on 7/20/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface APIClient : AFHTTPRequestOperationManager

+ (APIClient *)sharedClient;


@end
