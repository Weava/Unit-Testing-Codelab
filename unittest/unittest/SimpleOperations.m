//
//  SimpleOperations.m
//  unittest
//
//  Created by Aaron Weaver on 9/19/16.
//  Copyright © 2016 appweava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleOperations.h"

@implementation SimpleOperations 

- (int) addX:(int)x toY:(int)y {
    return x + y;
}

- (int) subractX:(int)x fromY:(int)y {
    return x - y;
}

- (int) multiplyX:(int)x byY:(int)y {
    return x * y;
}

- (int) divideX:(int)x fromY:(int)y {
    return x / y;
}

@end
