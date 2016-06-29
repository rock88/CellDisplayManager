//
//  CDMBindTests.m
//  CellDisplayManagerApp
//
//  Created by rock88 on 11/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

@import XCTest;
@import Expecta;

#import <CellDisplayManager/CellDisplayManager.h>

@interface CDMBindTests : XCTestCase

@property (nonatomic) NSString* input;
@property (nonatomic) NSString* output;
@property (nonatomic) CDMBind* bind;

@end

@implementation CDMBindTests

- (void)setUp {
    [super setUp];
    
    self.input = self.output = nil;
}

- (void)tearDown {
    [self.bind unbind];
    self.bind = nil;
    
    [super tearDown];
}

- (void)testBind {
    self.bind = [CDMBind input:self inKeypath:@"input" output:self outKeypath:@"output"];
    
    self.input = @"Test";
    expect(self.output).to.equal(@"Test");
    
    self.input = @"Other test string";
    expect(self.output).to.equal(@"Other test string");
}

- (void)testUnbind {
    self.bind = [CDMBind input:self inKeypath:@"input" output:self outKeypath:@"output"];
    
    self.input = @"Test";
    expect(self.output).to.equal(@"Test");
    
    [self.bind unbind];
    
    self.input = @"Other test string";
    expect(self.output).to.equal(@"Test");
}

- (void)testDealloc {
    __weak CDMBind* weak = nil;
    @autoreleasepool {
        weak = [CDMBind input:self inKeypath:@"input" output:self outKeypath:@"output"];
        
        expect(weak).notTo.beNil();
        [weak unbind];
    }
    
    expect(weak).to.beNil();
}

- (void)testIgnore {
    self.bind = [[CDMBind input:self inKeypath:@"input" output:self outKeypath:@"output"] ignore:@"Ignore"];
    
    self.input = @"Test";
    expect(self.output).to.equal(@"Test");
    
    self.input = @"Ignore";
    expect(self.output).to.equal(@"Test");
}

- (void)testMap {
    self.bind = [[CDMBind input:self inKeypath:@"input" output:self outKeypath:@"output"] map:^id(id value) {
        return @[value];
    }];
    
    self.input = @"Test";
    expect(self.output).to.equal(@[@"Test"]);
    
    self.input = @"Other test string";
    expect(self.output).to.equal(@[@"Other test string"]);
}

- (void)testSubscribe {
    __block NSString* result = nil;
    self.bind = [[CDMBind input:self keypath:@"input"] subscribe:^(id value) {
        result = value;
    }];
    
    self.input = @"Test";
    expect(result).to.equal(@"Test");
}

- (void)testSubscribeIgnore {
    __block id result = nil;
    self.bind = [[[CDMBind input:self keypath:@"input"] ignore:@"Ignore"] subscribe:^(id value) {
        result = value;
    }];
    
    self.input = @"Test";
    expect(result).to.equal(@"Test");
    
    self.input = @"Ignore";
    expect(result).to.equal(@"Test");
}

- (void)testSubscribeMap {
    __block id result = nil;
    self.bind = [[[CDMBind input:self keypath:@"input"] map:^id(id value) {
        return @[value];
    }] subscribe:^(id value) {
        result = value;
    }];
    
    self.input = @"Test";
    expect(result).to.equal(@[@"Test"]);
    
    self.input = @"Other test string";
    expect(result).to.equal(@[@"Other test string"]);
}

@end
