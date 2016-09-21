//
//  unittestTests.m
//  unittestTests
//
//  Created by Aaron Weaver on 9/19/16.
//  Copyright © 2016 appweava. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleOperations.h"

@interface unittestTests : XCTestCase
@property SimpleOperations *operations;
@end

@implementation unittestTests

- (void)setUp {
    // ARRANGE
    [super setUp];
    _operations = [[SimpleOperations alloc] init];
}

- (void)tearDown {
    // De-allocate objects
    _operations = nil;
    [super tearDown];
}

- (void)testAddition {
    // ACT
    int addResult = [_operations addX:2 toY:5];
    
    // ASSERT
    XCTAssertEqual(addResult, 7, @"If 2 + 5 doesn't equal 7, then my entire life is a lie."); // Will succeed
}

- (void)testSubtraction {
    int subtractResult = [_operations subractX:10
                                         fromY:20];
    
    XCTAssertEqual(subtractResult, 10, "20 - 10 = 10");
}

- (void)testMultiplication {
    int multResult = [_operations multiplyX:5 byY:5];
    
    XCTAssertEqual(multResult, 25);
}

- (void)testDivision {
    int divResult = [_operations divideX:10 fromY:100];
    
    XCTAssertEqual(divResult, 10);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
