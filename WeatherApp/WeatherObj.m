//
//  Weather.m
//  WeatherApp
//
//  Created by MyKeL on 7/21/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import "WeatherObj.h"

@implementation WeatherObj

+ (WeatherObj *)initWithDictionary:(NSDictionary *)theDictionary {
    
    WeatherObj *city = [WeatherObj new];
    city.dataDict = [[NSMutableDictionary alloc]init];
    
    city.weatherID = theDictionary[@"id"];
    city.weatherVisibility = theDictionary[@"visibility"];
    city.weatherCity = theDictionary[@"name"];
    
    NSDictionary *coord = theDictionary[@"coord"];
    NSLog(@"coord node = %@", coord);
    city.coordinate = [city setCoord:coord];

    
    NSDictionary *system = theDictionary[@"sys"];
    NSLog(@"sys node = %@", system);
    city.sys = [city setSystem:system];
    
    NSDictionary *mainDict = theDictionary[@"main"];
    NSLog(@"main node = %@", mainDict);
    city.mainnode = [city setMain:mainDict];
    
    NSLog(@"Weather ID: %@", city.weatherID);
    NSLog(@"Weather city: %@", city.weatherCity);
    NSLog(@"Weather visibility: %@", city.weatherVisibility);
    NSLog(@"Weather coordinate lat: %@", city.coordinate.latitude);
    NSLog(@"Weather coordinate long: %@", city.coordinate.longitude);
    NSLog(@"Weather country: %@", city.sys.country);
    NSLog(@"Weather sunrise %@", city.sys.sunrise);
    NSLog(@"Weather sunset: %@", city.sys.sunset);
    NSLog(@"Weather temp = %@", city.mainnode.temp);
    
    [city.dataDict setValue:city.sys.country forKey:@"Country"];
    [city.dataDict setValue:city.weatherCity forKey:@"City"];
    [city.dataDict setValue:city.coordinate.longitude forKey:@"Longitude"];
    [city.dataDict setValue:city.coordinate.latitude forKey:@"Latitude"];
    [city.dataDict setValue:city.mainnode.temp forKey:@"Feels like"];
    [city.dataDict setValue:city.mainnode.pressure forKey:@"Pressure"];
    [city.dataDict setValue:city.mainnode.temp_max forKey:@"Max Temp"];
    [city.dataDict setValue:city.mainnode.temp_min forKey:@"Min Temp"];
    [city.dataDict setValue:city.sys.sunrise forKey:@"Sunrise"];
    [city.dataDict setValue:city.sys.sunset forKey:@"Sunset"];
    [city.dataDict setValue:city.mainnode.humidity forKey:@"Humidity"];
    

    
    return city;
}


- (Coordinate *)setCoord:(NSDictionary *)coord
{
    Coordinate *coordinate = [Coordinate new];
    coordinate.latitude = [NSString stringWithFormat:@"%@", coord[@"lat"]];
    coordinate.longitude = [NSString stringWithFormat:@"%@", coord[@"lon"]];
    return coordinate;
}


- (Sys *) setSystem: (NSDictionary *)system
{
    
    Sys *sys = [Sys new];
    sys.country = system[@"country"];
    
    double unixTimeStamp = [system[@"sunrise"] doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"hh:mm a"];
    sys.sunrise = [formatter stringFromDate:date];
    
    unixTimeStamp = [system[@"sunset"] doubleValue];
    _interval=unixTimeStamp;
    date = [NSDate dateWithTimeIntervalSince1970:_interval];
    formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"hh:mm a"];
    sys.sunset = [formatter stringFromDate:date];
    
    return sys;
}


- (MainNode*) setMain: (NSDictionary*) mainDict
{
    MainNode *main = [MainNode new];
    //convert kelvin to celcius
    main.temp = [NSString stringWithFormat: @"%.1f °C",([mainDict[@"temp"] doubleValue] - 273.15)];
    main.pressure = [NSString stringWithFormat:@"%@", mainDict[@"pressure"]];
    main.humidity = [NSString stringWithFormat:@"%@", mainDict[@"humidity"]];
    main.temp_min = [NSString stringWithFormat: @"%.1f °C",([mainDict[@"temp_min"] doubleValue] - 273.15)];
    main.temp_max = [NSString stringWithFormat: @"%.1f °C",([mainDict[@"temp_max"] doubleValue] - 273.15)];
    
    return  main;
}

@end
