//
//  Task.m
//  SimpleTask
//
//  Created by Yaroslav Gorkun on 24.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import "Task.h"


@implementation Task

@dynamic completed;
@dynamic created;
@dynamic taskName;


- (void)awakeFromInsert
{
    self.created = [NSDate date];
    self.completed = [NSNumber numberWithBool:NO];
    self.taskName = @"new task";
}

@end


