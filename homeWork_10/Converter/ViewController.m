//
//  ViewController.m
//  Converter
//
//  Created by Yaroslav Gorkun on 17.01.15.
//  Copyright (c) 2015 yaroslav Horkun. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SVProgressHUD.h"
#import "AFNetworking/AFHTTPRequestOperation.h"

@interface ViewController () <NSURLConnectionDataDelegate>
//    @property (nonatomic, strong) NSURLConnection* connection;






@end

@implementation ViewController

@synthesize currencyAndLinks;
@synthesize currencyInput;
@synthesize currencyOutput;
@synthesize currencyLabel;
@synthesize currencies;


- (void)viewDidLoad {
    [super viewDidLoad];
/*
    
    NSString *urlRaw = @"https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5";
    NSURL *url = [NSURL URLWithString:urlRaw];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    [self setOutputCurrencyAtRow:0];
    
    [self.btnConvert.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.btnConvert.layer setBorderWidth:2];
*/
    self.currencyAndLinks = [[NSDictionary alloc] initWithObjectsAndKeys:
                             @"http://rate-exchange.appspot.com/currency?from=UAH&to=USD&q=", @"Dollar USD",
                             @"http://rate-exchange.appspot.com/currency?from=UAH&to=EUR&q=", @"EU Euro",
                             @"http://rate-exchange.appspot.com/currency?from=UAH&to=RUB&q=1", @"Russia RUB",
                             nil];
    
    //        NSLog(@"%@",self.currencyAndLinks);
    // To get the selected currency name
    [self setLb_OutputCurrencyAtRow:0];
    
}
/*
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
 
 NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
 
 
 NSArray *curr =dictionary;
 
 self.currencyAndLinks = [[NSMutableDictionary alloc] init];
 for(int i=0; i< curr.count; i++)
 {
 [currencyAndLinks setObject:curr[i][@"buy"]
 forKey:curr[i][@"ccy"]];
 
 }
 
 NSLog(@"%@ - ",currencyAndLinks);
 
 }
 
 
 
 
 #pragma mark- UIPickerView DataSourceDelegate
 - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
 {
 return 1;
 }
 
 - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
 
 return [self.currencyAndLinks count];
 }
 
 #pragma mark- UIPickerView Delegate
 - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
 
 return [self.currencyAndLinks.allKeys objectAtIndex:row];
 }
 
 - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
 {
 [self setOutputCurrencyAtRow:row];
 }
 //
 //
 #pragma mark- UITextField Delegate
 - (void)textFieldDidBeginEditing:(UITextField *)textField
 {
 [textField setText:@""];
 }
 
 
 - (void)connection:(NSURLConnection *)connection {
 
 }
 
 #pragma mark- Utility
 - (void) setOutputCurrencyAtRow:(NSInteger) row
 {
 // To set the output label for selected row
 NSString *selectedCurrencyName = [[self.currencyAndLinks allKeys] objectAtIndex:row];
 [self.currencyLabel setText:selectedCurrencyName];
 }
 
 
 #pragma mark- Actions
 - (IBAction)convertAction:(id)sender {
 [self.view endEditing:YES];
 }
 */


#pragma mark- UIPickerView DataSourceDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.currencyAndLinks.count;
}


#pragma mark- UIPickerView Delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.currencyAndLinks.allKeys objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self setLb_OutputCurrencyAtRow:row];
}


#pragma mark- UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField setText:@""];
}

#pragma mark- Utility
- (void) setLb_OutputCurrencyAtRow:(NSInteger) row
{
    // To set the output label for selected row
    NSString *selectedCurrencyName = [[self.currencyAndLinks allKeys] objectAtIndex:row];
    [self.currencyLabel setText:selectedCurrencyName];
}


#pragma mark- Actions
- (IBAction)bt_ChangeCurrencyPressed:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)bt_ConvertPressed:(id)sender
{
    // To start activity indicator
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [self.view endEditing:YES];
    
    // To make api request for currency conversion
    NSString *urlString = [NSString stringWithFormat:@"%@%@",
                           [self.currencyAndLinks objectForKey:self.currencyLabel.text],
                           self.currencyInput.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // To display converted amount
        NSDictionary *responseJSON = (NSDictionary *) responseObject;
        float outputAmountfloat = [[responseJSON objectForKey:@"v"] floatValue];
        NSString* outputAmount = [NSString stringWithFormat:@"%.02f", outputAmountfloat];
        [SVProgressHUD dismiss];
        [self.currencyOutput setText:outputAmount];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"Please try again later."];
    }];
    
    [operation start];
    
}





@end
