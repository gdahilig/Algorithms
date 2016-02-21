//
//  MergeSortTest.m
//  TestProgramming0
//
//  Created by Gene Dahilig on 1/2/15.
//  Copyright (c) 2015 Gene Dahilig. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MergeSorting.h"
#include <stdlib.h>

#define NSNUM(a) [NSNumber numberWithInt:a]

@interface MergeSortTest : XCTestCase
{
    MergeSorting* mergeSort;
}
@end

@implementation MergeSortTest

- (void)setUp {
    [super setUp];
    
    mergeSort = [[MergeSorting alloc] init];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    mergeSort = nil;
}

- (void)testIsSorted1{
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            nil];
    
    XCTAssert([mergeSort isSorted:arry], @"Pass");
}
- (void)testIsSorted2{
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            NSNUM(5),
                            nil];
    
    XCTAssert([mergeSort isSorted:arry], @"Pass");
}

- (void)testIsSorted3{
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(5),
                            NSNUM(3),
                            nil];
    
    XCTAssert([mergeSort isSorted:arry]==NO, @"Pass");
}


- (void)testSize0 {
    // Build empty array
    NSMutableArray* arry = [[NSMutableArray alloc] init];
    
    [mergeSort Sort:arry low:0 high:(int)[arry count]];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize1 {
    
    // Build 1 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            nil];
    
    [mergeSort Sort:arry low:0 high:0];
    
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize2a {
    
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            NSNUM(5),
                            nil];
    [mergeSort Sort:arry low:0 high:1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}
- (void)testSize2b {
    
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(5),
                            NSNUM(4),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize3a {
    
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(5),
                            NSNUM(4),
                            NSNUM(9),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize3b {
    
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(9),
                            NSNUM(5),
                            NSNUM(4),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize3c {
    
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(5),
                            NSNUM(9),
                            NSNUM(4),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize3d {
    
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            NSNUM(9),
                            NSNUM(5),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize4a {
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            NSNUM(5),
                            NSNUM(9),
                            NSNUM(2),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize4b {
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            NSNUM(5),
                            NSNUM(9),
                            NSNUM(8),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize4c {
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(9),
                            NSNUM(8),
                            NSNUM(5),
                            NSNUM(4),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

- (void)testSize8 {
    // Build 2 element array
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(9),
                            NSNUM(8),
                            NSNUM(7),
                            NSNUM(5),
                            NSNUM(4),
                            NSNUM(3),
                            NSNUM(2),
                            NSNUM(1),
                            nil];
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    
    // This is an example of a functional test case.
    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}


//- (void)testSizeRandom {
//    // Build 2 element array
//    int size = 100000;
//    NSMutableArray* arry = [NSMutableArray arrayWithCapacity: size];
//    for (int x=100000; x>0;x--)
//        [arry addObject:NSNUM(rand() % size )];
//    
//    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
//    
//    // This is an example of a functional test case.
//    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
//}


- (void)testMisc {
    NSMutableArray* arry = [NSMutableArray arrayWithObjects:
                            NSNUM(4),
                            NSNUM(5),
                            NSNUM(9),
                            nil];
    
    [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    XCTAssert(YES, @"Pass");
}

- (void)testMisc2 {
    int x = 1/2;
    int y = (int)5/4;
    int z = x+y;
    z = 0;
}


// usual time to complete is around 20 min. for 100,000 items
- (void)testPerformanceLargeArrayRandom {
    
    // Build 2 element array
    int size = 1000;
    NSMutableArray* arry = [NSMutableArray arrayWithCapacity: size];
    for (int x=size; x>0;x--)
        [arry addObject:NSNUM(rand() % size )];
    
    [self measureBlock:^{
        [mergeSort Sort:arry low:0 high:(int)[arry count]-1];
    }];
    
//    XCTAssert([mergeSort isSorted:arry] == YES, @"Pass");
}

@end
