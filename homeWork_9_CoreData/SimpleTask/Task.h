//
//  Task.h
//  SimpleTask
//
//  Created by Yaroslav Gorkun on 24.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSString * taskName;

@end
