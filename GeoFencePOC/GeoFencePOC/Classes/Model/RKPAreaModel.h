//
//  RKPAreaModel.h
//  GeoFencePOC
//
//  Created by Panneerselvam, Rajkumar on 1/30/14.
//  Copyright (c) 2014 Panneerselvam, Rajkumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface RKPAreaModel : NSObject

@property (nonatomic, assign) NSUInteger storeId;
@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, copy) NSString *storeBBYId;
@property (nonatomic, retain) CLLocation *storeCenter;
@property (nonatomic) float radius;
@property (nonatomic) BOOL enableMonitoring;
@property (nonatomic, retain) NSMutableArray *coordinates;
@property (nonatomic, retain) NSMutableArray *fences;

@end
