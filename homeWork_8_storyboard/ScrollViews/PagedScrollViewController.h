//
//  PagedScrollViewController.h
//  ScrollViews
//
//  Created by Yaroslav Gorkun on 05.12.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

@end
