//
//  TaskListController.h
//  SimpleTask
//
//  Created by Yaroslav Gorkun on 24.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskListController : UITableViewController <UIAlertViewDelegate>

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;

@end
