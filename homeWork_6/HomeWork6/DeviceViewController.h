//
//  DataViewController.h
//  IPhones&iPads
//
//  Created by Yaroslav Gorkun on 24.11.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DevicesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

extern NSString *const IPhoneCellIdentifier;
extern NSString *const IPadCellIdentifier;

@end
