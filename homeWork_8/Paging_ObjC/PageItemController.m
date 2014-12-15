//
//  PageItemController.m
//
//  Created by Yaroslav Gorkun on 13/12/14.
//  Copyright (c) 2014 Yaroslav Gorkun. All rights reserved.
//

#import "PageItemController.h"

@interface PageItemController ()

@end

@implementation PageItemController
@synthesize itemIndex;
@synthesize imageName;
@synthesize contentImageView;

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    contentImageView.image = [UIImage imageNamed: imageName];
}

#pragma mark -
#pragma mark Content

- (void) setImageName: (NSString *) name
{
    imageName = name;
    contentImageView.image = [UIImage imageNamed: imageName];
}

@end
