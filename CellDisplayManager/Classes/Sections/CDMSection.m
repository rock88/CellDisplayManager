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
#import "CDMSectionChangesProtocol.h"

@interface CDMSection ()

@property (nonatomic) NSMutableArray<id<CDMItemProtocol>> *innerItems;

@end

@implementation CDMSection
@synthesize identifier, delegate, hidden = _hidden;

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
    [self.delegate section:self didChange:changes];
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

- (void)setHidden:(BOOL)hidden {
    if (_hidden != hidden) {
        _hidden = hidden;
        
        [self.delegate sectionDidChangeAppearance:self];
    }
}

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
    CDMItemChanges* changes = [[CDMItemChanges alloc] init];
    for (id<CDMItemProtocol> item in items) {
        if ([_innerItems containsObject:item]) {
            [NSException raise:NSInternalInconsistencyException format:@"Not implement!"];
        } else {
            [self bind:item];
            [_innerItems addObject:item];
            [changes insertItem:[_innerItems indexOfObject:item]];
        }
    }
    [self sendChanges:changes];
}

- (void)insertItems:(NSArray<id<CDMItemProtocol>> *)items atIndex:(NSUInteger)index {
    CDMItemChanges* changes = [[CDMItemChanges alloc] init];
    [items enumerateObjectsUsingBlock:^(id<CDMItemProtocol> item, NSUInteger idx, BOOL* _) {
        if ([_innerItems containsObject:item]) {
            NSUInteger oldIndex = [_innerItems indexOfObject:item];
            [_innerItems removeObject:item];
            [_innerItems insertObject:item atIndex:index + idx];
            [changes moveItem:oldIndex to:[_innerItems indexOfObject:item]];
        } else {
            [self bind:item];
            [_innerItems insertObject:item atIndex:index + idx];
            [changes insertItem:[_innerItems indexOfObject:item]];
        }
    }];
    [self sendChanges:changes];
}

- (void)deleteItems:(NSArray<id<CDMItemProtocol>> *)items {
    CDMItemChanges* changes = [[CDMItemChanges alloc] init];
    
    NSMutableArray* innerItems = [NSMutableArray arrayWithArray:_innerItems];
    for (id<CDMItemProtocol> item in items) {
        if ([_innerItems containsObject:item]) {
            [self unbind:item];
            
            NSUInteger index = [_innerItems indexOfObject:item];
            [innerItems removeObject:item];
            [changes deleteItem:index];
        }
    }
    _innerItems = innerItems;
    
    [self sendChanges:changes];
}

@end
