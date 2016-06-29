//
//  CDMBind.m
//  CellDisplayManager
//
//  Created by rock88 on 10/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMBind.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CDMBind ()

@property (nonatomic) BOOL ignoreSet;
@property (nonatomic) id ignoreValue;

@property (nonatomic) NSString* inKeypath;
@property (nonatomic) NSString* outKeypath;

@property (nonatomic) RACDisposable* disposable;

@property (nonatomic,copy) id(^mapBlock)(id);
@property (nonatomic,copy) void(^subscribeBlock)(id);

@end

@implementation CDMBind

+ (instancetype)input:(id)input inKeypath:(NSString *)inKeypath output:(id)output outKeypath:(NSString *)outKeypath {
    return [[self alloc] initWithInput:input inKeypath:inKeypath output:output outKeypath:outKeypath];
}

+ (instancetype)input:(id)input keypath:(NSString *)keypath {
    return [[self alloc] initWithInput:input keypath:keypath];
}

- (instancetype)initWithInput:(id)input inKeypath:(NSString *)inKeypath output:(id)output outKeypath:(NSString *)outKeypath {
    self = [super init];
    if (self) {
        self.inKeypath = inKeypath;
        self.outKeypath = outKeypath;
        
        self.disposable = [[[[[input rac_valuesForKeyPath:inKeypath observer:self] skip:1] filter:^BOOL(id value) {
            if (self.ignoreSet) {
                return self.ignoreValue != value || ![self.ignoreValue isEqual:value];
            }
            return YES;
        }] map:^id(id value) {
            if (self.mapBlock) {
                return self.mapBlock(value);
            }
            return value;
        }] subscribeNext:^(id value) {
            [output setValue:value forKey:outKeypath];
        }];
    }
    return self;
}

- (instancetype)initWithInput:(id)input keypath:(NSString *)keypath {
    self = [super init];
    if (self) {
        self.inKeypath = keypath;
        
        self.disposable = [[[[[input rac_valuesForKeyPath:keypath observer:self] skip:1] filter:^BOOL(id value) {
            if (self.ignoreSet) {
                return self.ignoreValue != value || ![self.ignoreValue isEqual:value];
            }
            return YES;
        }] map:^id(id value) {
            if (self.mapBlock) {
                return self.mapBlock(value);
            }
            return value;
        }] subscribeNext:^(id value) {
            if (self.subscribeBlock) {
                self.subscribeBlock(value);
            }
        }];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s - %@", __func__, self);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%p: %@> %@ -> %@", self, [self class], self.inKeypath, self.outKeypath];
}

- (instancetype)ignore:(id)value {
    self.ignoreSet = YES;
    self.ignoreValue = value;
    return self;
}

- (instancetype)map:(id(^)(id value))block {
    self.mapBlock = block;
    return self;
}

- (instancetype)subscribe:(void(^)(id value))block {
    self.subscribeBlock = block;
    return self;
}

- (void)unbind {
    [self.disposable dispose];
}

@end
