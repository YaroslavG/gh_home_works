//
//  ViewController.h
//  HomeWork7
//
//  Created by Yaroslav Gorkun on 29.11.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scroll2;


@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UILabel *labelForSegment;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UILabel *labelForTextFields;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *labelForSlider;
@property (weak, nonatomic) IBOutlet UISwitch *MySwitch;
@property (weak, nonatomic) IBOutlet UIButton *StartLoading;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *MyIndicator;
@property (weak, nonatomic) IBOutlet UIStepper *MyStepper;
@property (weak, nonatomic) IBOutlet UILabel *labelForStepper;
@property (weak, nonatomic) IBOutlet UIButton *ShowImage;
@property (weak, nonatomic) IBOutlet UIImageView *MyImage;




@end

