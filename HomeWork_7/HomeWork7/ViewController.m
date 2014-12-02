//
//  ViewController.m
//  HomeWork7
//
//  Created by Yaroslav Gorkun on 29.11.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

@synthesize scroll2;
@synthesize button1;
@synthesize label1;
@synthesize segment;
@synthesize labelForSegment;
@synthesize textField1;
@synthesize labelForTextFields;



bool showText = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    scroll2.contentSize = CGSizeMake(320.0f, 750.0f);
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeValueText:(id)sender {
    if (showText){
        self.label1.text = @"iPad";
        showText = 0;
    }else{
        self.label1.text = @"iPhone";
        showText = 1;
    }

}
- (IBAction)changeFirstOrSecond:(id)sender {
    if(!segment.selectedSegmentIndex){
        self.labelForSegment.text = @"1";
    }else{
        self.labelForSegment.text = @"2";
    }
}

- (IBAction)changeTextFields:(id)sender {
    labelForTextFields.text = [NSString stringWithFormat:@"%@", textField1.text];
}

- (IBAction)SliderValue:(id)sender {
      self.labelForSlider.text = [NSString stringWithFormat:@"%0.0f", (self.slider.value *100)];
}
- (IBAction)showAlert:(id)sender {
    UIAlertView* alert1 = [[UIAlertView alloc] initWithTitle:@"Title Alert" message:@"Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert1 show];
}
- (IBAction)StartLoadingIndicator:(id)sender {
    [self.MyIndicator startAnimating];
}
- (IBAction)StepperFunction:(id)sender {
    self.MyStepper.wraps = YES; self.MyStepper.autorepeat = YES;
    NSUInteger value = self.MyStepper.value; self.labelForStepper.text = [NSString stringWithFormat:@"%02d", value];
    
    self.MyStepper.maximumValue = 10;
    
}
- (IBAction)ShowImageFunction:(id)sender {
    UIImage *plate1 = [UIImage imageNamed:@"imgres.jpg"];
    [self.MyImage setImage:plate1];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
