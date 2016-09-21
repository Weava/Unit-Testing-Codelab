//
//  ComplexOperationsTest.m
//  unittest
//
//  Created by Aaron Weaver on 9/20/16.
//  Copyright © 2016 appweava. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ComplexOperations.h"

@interface ComplexOperationsTest : XCTestCase
@property ComplexOperations *operations;
@end

@implementation ComplexOperationsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _operations = [[ComplexOperations alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _operations = nil;
    [super tearDown];
}

- (void)testSqrt {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    int squareRoot = [_operations squareRootOfX:36];
    
    XCTAssertEqual(squareRoot, 6, "Square root of 36 should be 6");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
