//
//  DetailViewController.m
//  WeatherApp
//
//  Created by MyKeL on 7/21/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end


@implementation DetailViewController



- (void)fetchWeatherWithLongitude: (double) lng latitude: (double) lat{
    
    NSLog(@"Fetching...");
    NSDictionary *parameters = @{@"lat":[NSString stringWithFormat:@"%.7f", lat],
                                 @"lon":[NSString stringWithFormat:@"%.7f", lng]};
    
    APIRequest *request = [APIRequest new];
    [request fetchWeatherWithParameters:parameters onSuccess:^(id JSON) {
        NSLog(@"Success!");
        //NSLog(@"sjon data = %@", JSON);
        self.weather = [WeatherObj initWithDictionary:JSON];
        NSLog(@"datadict = %@", self.weather.dataDict);
        
        
        [self.dataDict setValue:[self.weather.dataDict valueForKey:@"Country"] forKey: @"Country"];
        [self.dataDict setValue:[self.weather.dataDict valueForKey:@"City"] forKey: @"City"];
        [self.dataDict setValue:[self.weather.dataDict valueForKey:@"temp"] forKey: @"Temperature"];
        [self.dataDict setValue:[self.weather.dataDict valueForKey:@"humidity"] forKey: @"Humidity"];
        
        //NSLog(@"data = %@", [self.dataDict  description]);
        self.keyArray = [[NSArray alloc] initWithObjects:@"Country", @"City",@"Temperature",@"Humidity",@"Sunrise",@"Sunset",nil];
        
        self.valueArray = [[NSMutableArray alloc]init];
        for (int x=0 ; x< [self.keyArray count]; x++) {
            //NSLog(@"key = %@", [self.keyArray objectAtIndex:x]);
            //NSLog(@"value = %@", [self.weather.dataDict valueForKey:[self.keyArray objectAtIndex:x]]);
            [self.valueArray addObject:[self.weather.dataDict valueForKey:[self.keyArray objectAtIndex:x]]];
        }
        
        NSLog(@"keys = %@", [self.keyArray description]);
        NSLog(@"value = %@", [self.valueArray description]);
        
        NSLog(@"show data");
        [self.tableView reloadData];
        
    } onFailure:^(NSError *error) {
        
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Failed!" message:@"No message received!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.dataDict = dataDict;
    [self fetchWeatherWithLongitude:123.9086006  latitude:10.3312523];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"draw rows = %ld", [self.keyArray count]);
    return [self.keyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thisCell" forIndexPath:indexPath];//[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //[cell.textLabel setText:[self.keyArray objectAtIndex:indexPath.row]];
    
    UILabel *keyName = (UILabel *)[cell viewWithTag:101];
    keyName.text = [self.keyArray objectAtIndex:indexPath.row];
    
    UILabel *valName = (UILabel *)[cell viewWithTag:102];
    valName.text = [self.valueArray objectAtIndex:indexPath.row];
    
    //[cell.detailTextLabel setText:[self.valueArray objectAtIndex:indexPath.row]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
