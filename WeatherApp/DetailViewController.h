//
//  DetailViewController.h
//  WeatherApp
//
//  Created by MyKeL on 7/21/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIRequest.h"
#import "Coordinate.h"
#import "WeatherObj.h"

@interface DetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property NSArray *keyArray;
@property NSMutableArray *valueArray;
@property NSDictionary *dataDict;
@property double coordLong;
@property double coordLat;
@property WeatherObj * weather;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
