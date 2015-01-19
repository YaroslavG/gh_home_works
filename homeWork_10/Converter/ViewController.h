//
//  ViewController.h
//  Converter
//
//  Created by Yaroslav Gorkun on 17.01.15.
//  Copyright (c) 2015 yaroslav Horkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *currencyInput;
@property (weak, nonatomic) IBOutlet UITextField *currencyOutput;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *currencies;
@property (weak, nonatomic) IBOutlet UIButton *btnConvert;

@property (strong, nonatomic) NSMutableDictionary * currencyAndLinks;

@end

