//
//  PageItemController.h
//
//  Created by Yaroslav Gorkun on 13/12/14.
//  Copyright (c) 2014 Yaroslav Gorkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageItemController : UIViewController

// Item controller information
@property (nonatomic) NSUInteger itemIndex;
@property (nonatomic, strong) NSString *imageName;

// IBOutlets
@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;

@end
