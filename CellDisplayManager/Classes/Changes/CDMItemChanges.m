//
//  CDMItemChanges.m
//  CellDisplayManager
//
//  Created by rock88 on 28/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMItemChanges.h"
#import "CDMAdapter.h"
#import "CDMMoveChange.h"

@interface CDMItemChanges ()

@property (nonatomic) NSMutableIndexSet* insertedItems;
@property (nonatomic) NSMutableIndexSet* deletedItems;
@property (nonatomic) NSMutableIndexSet* reloadItems;
@property (nonatomic) NSMutableArray<CDMMoveChange *> *movedItems;

@end

@implementation CDMItemChanges

- (instancetype)init {
    self = [super init];
    if (self) {
        _insertedItems = [NSMutableIndexSet indexSet];
        _deletedItems = [NSMutableIndexSet indexSet];
        _reloadItems = [NSMutableIndexSet indexSet];
        _movedItems = [NSMutableArray array];
    }
    return self;
}

- (void)insertItem:(NSUInteger)index {
    [_insertedItems addIndex:index];
}

- (void)deleteItem:(NSUInteger)index {
    [_deletedItems addIndex:index];
}

- (void)moveItem:(NSUInteger)from to:(NSUInteger)to {
    CDMMoveChange* move = [[CDMMoveChange alloc] init];
    move.from = from;
    move.to = to;
    [_movedItems addObject:move];
}

- (void)reloadItem:(NSUInteger)index {
    [_reloadItems addIndex:index];
}

- (NSArray<NSIndexPath *> *)indexPaths:(NSIndexSet *)indexSet {
    NSMutableArray* array = [NSMutableArray array];
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL* _) {
        [array addObject:[NSIndexPath indexPathForRow:index inSection:_section]];
    }];
    return array;
}

- (void)apply:(id<CDMAdapterInput>)adapter {
    if (_reloadItems.count > 0) {
        [adapter reloadItemsAtIndexPaths:[self indexPaths:_reloadItems]];
    }
    if (_insertedItems.count > 0) {
        [adapter insertItemsAtIndexPaths:[self indexPaths:_insertedItems]];
    }
    if (_movedItems.count > 0) {
        for (CDMMoveChange* move in _movedItems) {
            NSIndexPath* from = [NSIndexPath indexPathForRow:move.from inSection:_section];
            NSIndexPath* to = [NSIndexPath indexPathForRow:move.to inSection:_section];
            [adapter moveItemAtIndexPath:from toIndexPath:to];
        }
    }
    if (_deletedItems.count > 0) {
        [adapter deleteItemsAtIndexPaths:[self indexPaths:_deletedItems]];
    }
}

@end
