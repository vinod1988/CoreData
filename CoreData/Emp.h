//
//  Emp.h
//  CoreData
//
//  Created by Vinod Vishwakarma on 03/04/15.
//  Copyright (c) 2015 Vinod Vishwakarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Emp : NSManagedObject

@property (nonatomic, retain) NSNumber * emp_id;
@property (nonatomic, retain) NSString * emp_name;
@property (nonatomic, retain) NSString * emp_mobile;

@end
