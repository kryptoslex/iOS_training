//
//  ViewController.m
//  WeatherApp
//
//  Created by MyKeL on 7/20/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)goBtn:(id)sender {
    
    NSLog(@"Go update!");
    
}

-(IBAction)unwindSegue: (UIStoryboardSegue *)segue
{
    //back to main view
    NSLog(@"back to main view");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self fetchWeatherForecast];
   
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"prepare for segue");
    if([[segue identifier] isEqualToString:@"detSegue"])
    {
        //NSLog(@"data = %@", self.weather.dataDict);
    }
    
    //DetailViewController *detView = [segue destinationViewController];
    //[detView setDataDict:self.weather.dataDict];
    
    NSLog(@"segue end");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
