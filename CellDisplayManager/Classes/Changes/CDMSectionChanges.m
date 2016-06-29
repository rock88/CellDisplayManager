//
//  CDMChanges.m
//  CellDisplayManager
//
//  Created by rock88 on 19/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMSectionChanges.h"
#import "CDMAdapter.h"
#import "CDMMoveChange.h"

@interface CDMSectionChanges ()

@property (nonatomic) NSMutableIndexSet* insertedSections;
@property (nonatomic) NSMutableIndexSet* deletedSections;
@property (nonatomic) NSMutableIndexSet* reloadSections;
@property (nonatomic) NSMutableArray<CDMMoveChange *> *movedSections;

@end

@implementation CDMSectionChanges

- (instancetype)init {
    self = [super init];
    if (self) {
        _insertedSections = [NSMutableIndexSet indexSet];
        _deletedSections = [NSMutableIndexSet indexSet];
        _reloadSections = [NSMutableIndexSet indexSet];
        _movedSections = [NSMutableArray array];
    }
    return self;
}

- (void)insertSection:(NSUInteger)index {
    [_insertedSections addIndex:index];
}

- (void)deleteSection:(NSUInteger)index {
    [_deletedSections addIndex:index];
}

- (void)moveSection:(NSUInteger)from to:(NSUInteger)to {
    CDMMoveChange* move = [[CDMMoveChange alloc] init];
    move.from = from;
    move.to = to;
    [_movedSections addObject:move];
}

- (void)reloadSection:(NSUInteger)index {
    [_reloadSections addIndex:index];
}

- (void)apply:(id<CDMAdapterInput>)adapter {
    if (_reloadSections.count > 0) {
        [adapter reloadSections:_reloadSections];
    }
    if (_insertedSections.count > 0) {
        [adapter insertSections:_insertedSections];
    }
    if (_movedSections.count > 0) {
        for (CDMMoveChange* move in _movedSections) {
            [adapter moveSection:move.from toSection:move.to];
        }
    }
    if (_deletedSections.count > 0) {
        [adapter deleteSections:_deletedSections];
    }
}

- (NSString *)description {
    NSMutableString* description = [NSMutableString stringWithFormat:@"<%@: %p>", [self class], self];
    if (_reloadSections.count > 0) {
        [description appendFormat:@"\nReloaded: "];
        [_reloadSections enumerateIndexesUsingBlock:^(NSUInteger index, BOOL* _) {
            [description appendFormat:@"%zd ", index];
        }];
    }
    if (_insertedSections.count > 0) {
        [description appendFormat:@"\nInserted: "];
        [_insertedSections enumerateIndexesUsingBlock:^(NSUInteger index, BOOL* _) {
            [description appendFormat:@"%zd ", index];
        }];
    }
    if (_movedSections.count > 0) {
        [description appendFormat:@"\nMoved: "];
        [_movedSections enumerateObjectsUsingBlock:^(CDMMoveChange* move, NSUInteger index, BOOL* _) {
            [description appendFormat:@"%zd->%zd ", move.from, move.to];
        }];
    }
    if (_deletedSections.count > 0) {
        [description appendFormat:@"\nDeleted: "];
        [_deletedSections enumerateIndexesUsingBlock:^(NSUInteger index, BOOL* _) {
            [description appendFormat:@"%zd ", index];
        }];
    }
    return description;
}

@end
