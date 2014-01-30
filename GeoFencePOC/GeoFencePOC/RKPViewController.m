//
//  RKPViewController.m
//  GeoFencePOC
//
//  Created by Panneerselvam, Rajkumar on 1/30/14.
//  Copyright (c) 2014 Panneerselvam, Rajkumar. All rights reserved.
//

#import "RKPViewController.h"
#import "DDAnnotation.h"
#import "MKPolygon+PointInPolygon.h"

@interface RKPViewController ()
 

@end

@implementation RKPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _fenceMap = [[MKMapView alloc] init];
    
    [self setupPolygon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupPolygon{
    
    
    
    
    points[0] = CLLocationCoordinate2DMake(40.597271, -84.178162);
    points[3] = CLLocationCoordinate2DMake(40.730608, -81.459046);
    points[1] = CLLocationCoordinate2DMake(40.002371, -81.557922);
    points[2] = CLLocationCoordinate2DMake(39.993956, -84.189148);
    points[4] = CLLocationCoordinate2DMake(40.505446,-86.095276);
    fencePolygon = [MKPolygon polygonWithCoordinates:points count:5];
    _fenceMap.delegate = self;
    [_fenceMap addOverlay:fencePolygon];
}

- (IBAction)check:(id)sender{

    
//    [self checkUsingCorseCalculation];
    [self checkUsingPolygon];
    
}

- (void)checkUsingPolygon{
    if([fencePolygon pointInPolygon:CLLocationCoordinate2DMake([_lat.text doubleValue], [_lon.text doubleValue])])
    {
        _status.text = @"yes";
    }else{
        _status.text = @"no";
    }

}

-(void)checkUsingCorseCalculation{
    
    BOOL isGreateThanAllLat;
    BOOL isGreateThanAllLong;
    BOOL isLesserthanAllLat;
    BOOL isLesserthanAllLong;
    
    if((points[0].latitude < [_lat.text doubleValue]) && (points[1].latitude < [_lat.text doubleValue]) && (points[2].latitude < [_lat.text doubleValue]) && (points[3].latitude < [_lat.text doubleValue]) ){
        isLesserthanAllLat = YES;
    }else{
        isLesserthanAllLat = NO;
    }
    
    if((points[0].latitude > [_lat.text doubleValue]) && (points[1].latitude > [_lat.text doubleValue]) && (points[2].latitude > [_lat.text doubleValue]) && (points[3].latitude > [_lat.text doubleValue]) ){
        isGreateThanAllLat = YES;
    }else{
        isGreateThanAllLat = NO;
    }

    if((points[0].longitude < [_lon.text doubleValue]) && (points[1].longitude < [_lon.text doubleValue]) && (points[2].longitude < [_lon.text doubleValue]) && (points[3].longitude < [_lon.text doubleValue]) ){
        isLesserthanAllLong = YES;
    }else{
        isLesserthanAllLong = NO;
    }
    
    if((points[0].longitude > [_lon.text doubleValue]) && (points[1].longitude > [_lon.text doubleValue]) && (points[2].longitude > [_lon.text doubleValue]) && (points[3].longitude > [_lon.text doubleValue]) ){
        isGreateThanAllLong = YES;
    }else{
        isGreateThanAllLong = NO;
    }
    
    if(!isLesserthanAllLong && !isLesserthanAllLat && !isGreateThanAllLong && !isGreateThanAllLat){
        _status.text = @"inside";
    }else{
        _status.text = @"outside";
    }
    
}

- (MKOverlayRenderer*)mapView:(MKMapView*)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    // reuse the renderer if already existent
    if (renderer == nil)
    {
        NSLog(@" renderer is nil ==> creating");
        renderer = [[MKPolygonRenderer alloc] initWithPolygon:overlay];
        renderer.fillColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.4];
        renderer.strokeColor = [UIColor greenColor];
        renderer.lineWidth = 1;
    }
    else
        NSLog(@" renderer is not nil ==> reusing");
    return renderer;
}


@end
