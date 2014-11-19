//
//  ViewController.h
//  HomeWork5
//
//  Created by Yaroslav Gorkun on 17.11.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
}

@property (strong, nonatomic) UITableView *codeTable;
@property (weak, nonatomic) IBOutlet UITableView *interfaceTable;

@property (strong, nonatomic) NSArray *goalkeepers;
@property (strong, nonatomic) NSArray *fielders;



@end

