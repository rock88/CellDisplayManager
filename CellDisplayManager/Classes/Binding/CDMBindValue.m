//
//  CDMBindValue.m
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMBindValue.h"

@interface CDMBindValue ()

@property (nonatomic) NSMutableArray* handlers;

@end

@implementation CDMBindValue

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        _value = value;
        _handlers = [NSMutableArray array];
    }
    return self;
}

- (void)setValue:(id)value {
    _value = value;
    
    for (void(^change)(id value) in _handlers) {
        change(value);
    }
}

- (void)addChangeHandler:(void (^)(id value))handler {
    [_handlers addObject:handler];
}

@end
