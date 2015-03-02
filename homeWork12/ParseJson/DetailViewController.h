//
//  DetailViewController.h
//  ParseJson
//
//  Created by Yaroslav Gorkun on 24.02.15.
//  Copyright (c) 2015 yaroslav Horkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

