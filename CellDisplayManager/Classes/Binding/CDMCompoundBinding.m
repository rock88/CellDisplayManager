//
//  CDMCompoundBinding.m
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMCompoundBinding.h"
#import "CDMBindValue.h"

@interface CDMCompoundBinding ()

@property (nonatomic) NSMutableArray* handlers;

@end

@implementation CDMCompoundBinding

- (instancetype)initWithValues:(NSArray<CDMBindValue *> *)values {
    self = [super init];
    if (self) {
        _handlers = [NSMutableArray array];
        
        __weak typeof(self) weak = self;
        for (CDMBindValue* value in values) {
            [value addChangeHandler:^(id value) {
                for (void (^handler)(void) in weak.handlers) {
                    handler();
                }
            }];
        }
    }
    return self;
}

- (void)addChangeHandler:(void (^)(void))handler {
    [_handlers addObject:handler];
}

@end
