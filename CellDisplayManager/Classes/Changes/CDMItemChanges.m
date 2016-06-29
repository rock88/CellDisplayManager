//
//  CDMItemChanges.m
//  CellDisplayManager
//
//  Created by rock88 on 28/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMItemChanges.h"
#import "CDMMoveChange.h"

@interface CDMItemChanges ()

@property (nonatomic) NSMutableIndexSet* insertedItems;
@property (nonatomic) NSMutableIndexSet* deletedItems;
@property (nonatomic) NSMutableArray<CDMMoveChange *> *movedItems;

@end

@implementation CDMItemChanges

- (instancetype)init {
    self = [super init];
    if (self) {
        _insertedItems = [NSMutableIndexSet indexSet];
        _deletedItems = [NSMutableIndexSet indexSet];
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
    
}

- (void)apply:(id<CDMAdapterInput>)adapter {
    
}

@end
