//
//  ASParent.m
//  Test
//
//  Created by Yaroslav Gorkun on 21.10.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import "ASParent.h"

@implementation ASParent

- (void) methodIfElse: (NSArray*) year{
    for (int i = 0; i<=11; i++) {
        if (i == 0) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 1 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 2 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 3 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 4 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 5 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 6 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 7 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 8 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 9 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 10 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        } else if ( i == 11 ) {
            NSLog(@" %i. %@", i+1, year[i]);
        }
    }
}

- (void) methodSwitch: (NSArray*) year{
        enum Months {
             October, November, December, May, September, June, March, April, January, February, July, August
        };
    
    for (int i = 0; i<=11; i++) {
        switch (i) {
            case  January :
                NSLog(@" %i. %@",i+1, year[i]);
                break;
            case February :
                NSLog(@" %i. %@",i+1, year[i]);
                break;
            case March :
                NSLog(@"%i. %@",i+1, year[i]);
                break;
            case April :
                NSLog(@"%i. %@",i+1, year[i]);
                break;
            case May :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case June :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case July:
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case August :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case September :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case October :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case November :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
            case December :
                NSLog(@"%i. %@", i+1, year[i]);
                break;
                
        }
    }
    
}


@end