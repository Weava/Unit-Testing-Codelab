//
//  ComplexOperations.m
//  unittest
//
//  Created by Aaron Weaver on 9/19/16.
//  Copyright © 2016 appweava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComplexOperations.h"

@implementation ComplexOperations

- (int) squareRootOfX:(int)x {
    if (x == 0) {
        return 0;
    } else if (x < 0) {
        x = -x;
    }
    
    int sqrt = x/2;
    int num = sqrt;
    
    do {
        num = sqrt;
        sqrt = (sqrt + (num/sqrt))/2;
    } while ((num - sqrt) != 0);
    
    return sqrt;
}

@end
