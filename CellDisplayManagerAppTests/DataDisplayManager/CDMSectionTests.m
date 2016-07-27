//
//  CDMSectionTests.m
//  CellDisplayManagerApp
//
//  Created by rock88 on 16/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

@import XCTest;
@import Expecta;
@import OCMock;

#import "CDMTestsUtils.h"
#import <CellDisplayManager/CellDisplayManager.h>

@interface CDMSectionTests : XCTestCase

@property CDMFactory* factory;
@property CDMManager* manager;
@property id<CDMAdapterInput> adapter;
@property id<CDMSectionProtocol> section;

@end

@implementation CDMSectionTests

- (void)setUp {
    [super setUp];
    
    self.factory = [[CDMFactory alloc] init];
    self.adapter = OCMProtocolMock(@protocol(CDMAdapterInput));
    self.manager = [[CDMManager alloc] init];
    self.manager.adapter = self.adapter;
    
    self.section = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    [self.manager addSection:self.section];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddItem {
    id<CDMLabelItemProtocol> item1 = [self.factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    id<CDMLabelItemProtocol> item2 = [self.factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    
    [self.section addItem:item1];
    
    expect([self.manager numberOfItemsInSection:0]).to.equal(1);
    OCMVerify([self.adapter insertItemsAtIndexPaths:CDMIndexPathsForSection(@0, @0, nil)]);
    
    [self.section addItem:item2];
    
    expect([self.manager numberOfItemsInSection:0]).to.equal(2);
    OCMVerify([self.adapter insertItemsAtIndexPaths:CDMIndexPathsForSection(@0, @1, nil)]);
}

- (void)testDeleteItem {
    id<CDMLabelItemProtocol> item1 = [self.factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    id<CDMLabelItemProtocol> item2 = [self.factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    
    [self.section addItem:item1];
    [self.section addItem:item2];
    
    expect([self.manager numberOfItemsInSection:0]).to.equal(2);
    
    [self.section deleteItem:item1];
    
    expect([self.manager numberOfItemsInSection:0]).to.equal(1);
    expect([self.manager itemForIndexPath:CDMIndexPath(@0, @0)]).to.equal(item2);
    
    OCMVerify([self.adapter deleteItemsAtIndexPaths:CDMIndexPathsForSection(@0, @0, nil)]);
}

- (void)testInsertItem {
    id<CDMLabelItemProtocol> item1 = [self.factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    id<CDMLabelItemProtocol> item2 = [self.factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    
    [self.section addItem:item1];
    
    [self.section insertItem:item2 atIndex:0];
    
    expect([self.manager numberOfItemsInSection:0]).to.equal(2);
    expect([self.manager itemForIndexPath:CDMIndexPath(@0, @0)]).to.equal(item2);
    expect([self.manager itemForIndexPath:CDMIndexPath(@0, @1)]).to.equal(item1);
    
    OCMVerify([self.adapter insertItemsAtIndexPaths:CDMIndexPathsForSection(@0, @0, nil)]);
}

@end
