//
//  TaskStore.h
//  SimpleTask
//
//  Created by Yaroslav Gorkun on 25.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Task;

@interface TaskStore : NSObject
@property( nonatomic, retain ) NSMutableArray * allTask;

+ (TaskStore *) sharedStore;
- (NSArray *) allTasks;
- (Task *) createTask;
- (void)removeTask:(Task *)task;

- (void)save;
@end
