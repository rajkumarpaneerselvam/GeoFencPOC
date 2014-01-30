//
//  MKPolygon+PointInPolygon.m
//  GeoFencePOC
//
//  Created by Panneerselvam, Rajkumar on 1/30/14.
//  Copyright (c) 2014 Panneerselvam, Rajkumar. All rights reserved.
//

#import "MKPolygon+PointInPolygon.h"


#import "MKPolygon+PointInPolygon.h"

@implementation MKPolygon (PointInPolygon)

-(BOOL)pointInPolygon:(CLLocationCoordinate2D) point {
    MKMapPoint mapPoint = MKMapPointForCoordinate(point);
//    MKPolygonView *polygonView = [[MKPolygonView alloc] initWithPolygon:self];
    MKPolygonRenderer *polygonView = [[MKPolygonRenderer alloc] initWithPolygon:self];
    CGPoint polygonViewPoint = [polygonView pointForMapPoint:mapPoint];
    return CGPathContainsPoint(polygonView.path, NULL, polygonViewPoint, NO);
}

@end
