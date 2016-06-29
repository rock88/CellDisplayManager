//
//  CDMSection.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMSection.h"
#import "CDMFactory.h"
#import "CDMItemChanges.h"

@interface CDMSection ()

@property (nonatomic) NSMutableArray<id<CDMItemProtocol>> *innerItems;

@end

@implementation CDMSection
@synthesize identifier, changeHandler;

+ (void)load {
    [CDMFactory registerClass:[self class] forProtocol:@protocol(CDMSectionProtocol)];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _innerItems = [NSMutableArray<id<CDMItemProtocol>> array];
    }
    return self;
}

- (void)sendChanges:(CDMItemChanges *)changes {
    if (self.changeHandler) {
        self.changeHandler(self, changes);
    }
}

#pragma mark - Binding

- (void)bind:(id<CDMItemProtocol>)item {
    [self unbind:item];
    
    __weak typeof(self) weak = self;
    [item setChangeHandler:^(id<CDMItemProtocol> item) {
        if ([weak.innerItems containsObject:item]) {
            CDMItemChanges* changes = [[CDMItemChanges alloc] init];
            [changes reloadItem:[weak.innerItems indexOfObject:item]];
            [weak sendChanges:changes];
        }
    }];
}

- (void)unbind:(id<CDMItemProtocol>)item {
    [item setChangeHandler:nil];
}

#pragma mark - CDMSectionProtocol

- (NSArray<id<CDMItemProtocol>> *)items {
    return [NSArray arrayWithArray:_innerItems];
}

- (void)addItem:(id<CDMItemProtocol>)item {
    [self addItems:@[item]];
}

- (void)insertItem:(id<CDMItemProtocol>)item atIndex:(NSUInteger)index {
    [self insertItems:@[item] atIndex:index];
}

- (void)deleteItem:(id<CDMItemProtocol>)item {
    [self deleteItems:@[item]];
}

- (void)addItems:(NSArray<id<CDMItemProtocol>> *)items {
    
}

- (void)insertItems:(NSArray<id<CDMItemProtocol>> *)items atIndex:(NSUInteger)index {
    
}

- (void)deleteItems:(NSArray<id<CDMItemProtocol>> *)items {
    
}

@end
