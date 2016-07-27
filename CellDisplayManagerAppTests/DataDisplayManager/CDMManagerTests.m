//
//  CDMManagerTests.m
//  CellDisplayManager
//
//  Created by rock88 on 17/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

@import XCTest;
@import Expecta;
@import OCMock;

#import "CDMTestsUtils.h"
#import <CellDisplayManager/CellDisplayManager.h>

@interface CDMManagerTests : XCTestCase

@property CDMFactory* factory;
@property CDMManager* manager;
@property id<CDMAdapterInput> adapter;

@end

@implementation CDMManagerTests

- (void)setUp {
    [super setUp];
    
    self.factory = [[CDMFactory alloc] init];
    self.adapter = OCMProtocolMock(@protocol(CDMAdapterInput));
    self.manager = [[CDMManager alloc] init];
    self.manager.adapter = self.adapter;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Add

- (void)testAddSection {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager addSection:section1];
    expect([self.manager numberOfSections]).to.equal(1);
    expect([self.manager sectionItemForSection:0]).to.equal(section1);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, nil)]);
    
    [self.manager addSection:section1];
    expect([self.manager numberOfSections]).to.equal(1);
    expect([self.manager sectionItemForSection:0]).to.equal(section1);
    
    [self.manager addSection:section2];
    expect([self.manager numberOfSections]).to.equal(2);
    expect([self.manager sectionItemForSection:1]).to.equal(section2);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@1, nil)]);
}

- (void)testAddSections {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager addSections:@[section1, section2]];
    
    expect([self.manager numberOfSections]).to.equal(2);
    expect([self.manager sectionItemForSection:0]).to.equal(section1);
    expect([self.manager sectionItemForSection:1]).to.equal(section2);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, @1, nil)]);
}

- (void)testAddExistSections {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section3 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section4 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager addSections:@[section1, section2, section2]];
    expect([self.manager numberOfSections]).to.equal(2);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, @1, nil)]);
    
    
    [self.manager addSections:@[section1, section3, section4]];
    expect([self.manager numberOfSections]).to.equal(4);
    
    OCMVerify([self.adapter moveSection:0 toSection:1]);
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@2, @3, nil)]);
}

#pragma mark - Insert

- (void)testInsertSection {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager insertSection:section1 atIndex:0];
    expect([self.manager numberOfSections]).to.equal(1);
    expect([self.manager sectionItemForSection:0]).to.equal(section1);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, nil)]);
    
    [self.manager insertSection:section2 atIndex:1];
    expect([self.manager numberOfSections]).to.equal(2);
    expect([self.manager sectionItemForSection:1]).to.equal(section2);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@1, nil)]);
}

- (void)testInsertSections {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section3 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section4 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager insertSections:@[section3, section4] atIndex:0];
    
    expect([self.manager numberOfSections]).to.equal(2);
    expect([self.manager sectionItemForSection:0]).to.equal(section3);
    expect([self.manager sectionItemForSection:1]).to.equal(section4);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, @1, nil)]);
    
    [self.manager insertSections:@[section1, section2] atIndex:0];
    
    expect([self.manager numberOfSections]).to.equal(4);
    expect([self.manager sectionItemForSection:0]).to.equal(section1);
    expect([self.manager sectionItemForSection:1]).to.equal(section2);
    expect([self.manager sectionItemForSection:2]).to.equal(section3);
    expect([self.manager sectionItemForSection:3]).to.equal(section4);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, @1, nil)]);
}

- (void)testInsertExistSections {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)]; section1.identifier = @"1";
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)]; section2.identifier = @"2";
    id<CDMSectionProtocol> section3 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)]; section3.identifier = @"3";
    id<CDMSectionProtocol> section4 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)]; section4.identifier = @"4";
    id<CDMSectionProtocol> section5 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)]; section5.identifier = @"5";
    id<CDMSectionProtocol> section6 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)]; section6.identifier = @"6";
    
    [self.manager insertSections:@[section1, section2, section3] atIndex:0];
    
    expect([self.manager numberOfSections]).to.equal(3);
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@0, @1, @2, nil)]);
    
    
    [self.manager insertSections:@[section3, section4, section5, section6] atIndex:1];
    
    expect([self.manager numberOfSections]).to.equal(6);
    expect([self.manager sectionItemForSection:0]).to.equal(section1);
    expect([self.manager sectionItemForSection:1]).to.equal(section3);
    expect([self.manager sectionItemForSection:2]).to.equal(section4);
    expect([self.manager sectionItemForSection:3]).to.equal(section5);
    expect([self.manager sectionItemForSection:4]).to.equal(section6);
    expect([self.manager sectionItemForSection:5]).to.equal(section2);
    
    OCMVerify([self.adapter insertSections:CDMIndexSetForSections(@2, @3, @4, nil)]);
    OCMVerify([self.adapter moveSection:2 toSection:1]);
}

#pragma mark - Delete

- (void)testDeleteSection {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager addSections:@[section1, section2]];
    expect([self.manager numberOfSections]).to.equal(2);
    
    [self.manager deleteSection:section1];
    expect([self.manager numberOfSections]).to.equal(1);
    expect([self.manager sectionItemForSection:0]).to.equal(section2);
    
    OCMVerify([self.adapter deleteSections:CDMIndexSetForSections(@0, nil)]);
}

- (void)testDeleteSections {
    id<CDMSectionProtocol> section1 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section2 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    id<CDMSectionProtocol> section3 = [self.factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    
    [self.manager addSections:@[section1, section2, section3]];
    expect([self.manager numberOfSections]).to.equal(3);
    
    [self.manager deleteSections:@[section1, section3]];
    expect([self.manager numberOfSections]).to.equal(1);
    expect([self.manager sectionItemForSection:0]).to.equal(section2);
    
    OCMVerify([self.adapter deleteSections:CDMIndexSetForSections(@0, @2, nil)]);
}

@end
