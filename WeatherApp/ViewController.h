//
//  ViewController.h
//  WeatherApp
//
//  Created by MyKeL on 7/20/15.
//  Copyright © 2015 MyKeL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *coordLabel;
- (IBAction)goBtn:(id)sender;

-(IBAction)unwindSegue: (UIStoryboardSegue *)segue;



@end

