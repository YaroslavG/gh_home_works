//
//  GHCar.m
//  Home Work OOP
//
//  Created by Sergey Zalozniy on 10/31/14.
//  Copyright (c) 2014 Sergey Zalozniy. All rights reserved.
//

#include "GHCar.h"

@implementation GHCar 

- (GHCar *)initWithEngineCapacity:(float)capacity andHorsePower:(int)horsePower {
    GHEngine *engine = [[GHEngine alloc] init];
    [engine setCapacity:capacity];
    [engine setHorsePower:horsePower];
    
    
    GHCar * car =[[GHCar alloc] init];
    [car setEngine: engine];
    return car;
}


-(void)printCarIformation {
    NSLog(@"%@ (%.1f) - %i h/p, max.speed - %.f", self.mark, self.engine.capacity, self.engine.horsePower, self.topSpeed);
}

-(Boolean) isFasterThanCar:(GHCar *)carToCompare{
    //        NSLog(@"%@",self.mark);
    //    NSLog(@"%f",carToCompare.topSpeed);
    if (self.topSpeed>carToCompare.topSpeed){
        return true;
    }else{
        return false;
    }
}


@end
