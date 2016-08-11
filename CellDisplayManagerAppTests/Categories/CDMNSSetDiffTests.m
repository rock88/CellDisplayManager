//
//  CDMNSSetDiffTests.m
//  CellDisplayManagerApp
//
//  Created by Andrey Konoplyankin on 09/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

@import XCTest;
@import Expecta;
@import OCMock;

#import "CDMTestsUtils.h"
#import <CellDisplayManager/CellDisplayManager.h>

@interface CDMNSSetDiffTests : XCTestCase

@end

@implementation CDMNSSetDiffTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDiff {
    NSOrderedSet* one = [NSOrderedSet orderedSetWithObjects:@"1", @"2", @"3", @"4", nil];
    NSOrderedSet* two = [NSOrderedSet orderedSetWithObjects:@"2", @"3", @"5", nil];
    
    CDMSectionChanges* changes = [one diff:two];
    NSLog(@"%@", changes);
}

@end
