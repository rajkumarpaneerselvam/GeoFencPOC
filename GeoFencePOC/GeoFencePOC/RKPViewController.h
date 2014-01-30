//
//  RKPViewController.h
//  GeoFencePOC
//
//  Created by Panneerselvam, Rajkumar on 1/30/14.
//  Copyright (c) 2014 Panneerselvam, Rajkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "RKPAreaModel.h"

@interface RKPViewController : UIViewController<MKMapViewDelegate>{
    MKPolygon *fencePolygon;
    MKPolygonRenderer* renderer;
    CLLocationCoordinate2D points[5];
}

@property (strong, nonatomic) IBOutlet UIButton *checkLocation;
@property (strong, nonatomic) IBOutlet UITextField *lat;
@property (strong, nonatomic) IBOutlet UITextField *lon;
@property (strong, nonatomic) IBOutlet UILabel *status;
@property (strong, nonatomic) IBOutlet MKMapView *fenceMap;
- (IBAction)check:(id)sender;

@end
