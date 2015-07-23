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

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.mapView addGestureRecognizer:tapGesture];
}

- (void)handleTap:(id)sender
{
    UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer*)sender;
    
    CGPoint tapPoint = [tapGesture locationInView:self.mapView];
    CLLocationCoordinate2D coord = [self.mapView convertPoint:tapPoint toCoordinateFromView:self.mapView];
    
    NSUInteger numberOfTouches = [tapGesture numberOfTouches];
    
    if (numberOfTouches == 1) {
        
        if(self.mapView.annotations)
        {
          [self.mapView removeAnnotations:self.mapView.annotations];
        }
        
        NSLog(@"Tap location was %.0f, %.0f", tapPoint.x, tapPoint.y);
        NSLog(@"World coordinate was longitude %f, latitude %f", coord.longitude, coord.latitude);
        self.coordLabel.text = [NSString stringWithFormat:@("(%.7f , %.7f)"), coord.longitude, coord.latitude];
        
        self.longVal = coord.longitude;
        self.latVal = coord.latitude;
        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
        annot.coordinate = coord;
        [self.mapView addAnnotation:annot];
        
    } else {
        NSLog(@"Number of touches was %ld, ignoring", numberOfTouches);
    }
}



- (void)longpressToGetLocation:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D location =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    NSLog(@"Location found from Map: %f %f",location.latitude,location.longitude);
    //demo again
    //demo 2
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //demo here
    
    NSLog(@"prepare for segue");
    if([[segue identifier] isEqualToString:@"detSegue"])
    {
        //NSLog(@"data = %@", self.weather.dataDict);
        UINavigationController *nav = [segue destinationViewController];
        DetailViewController *det = (DetailViewController *)nav.topViewController;
        det.coordLong = self.longVal;
        det.coordLat = self.latVal;
        
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
