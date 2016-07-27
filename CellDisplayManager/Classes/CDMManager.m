//
//  DataDisplayManager.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMManager.h"
#import "CDMSectionProtocol.h"
#import "CDMAdapter.h"
#import "CDMSectionChanges.h"
#import "CDMItemChanges.h"
#import "CDMSectionChangesProtocol.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CDMManager () <CDMSectionChangesProtocol>

@property (nonatomic) NSMutableArray<id<CDMSectionProtocol>> *innerSections;

@end

@implementation CDMManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _innerSections = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Binding

- (void)bind:(id<CDMSectionProtocol>)section {
    [self unbind:section];
    
    section.delegate = self;
}

- (void)unbind:(id<CDMSectionProtocol>)section {
    section.delegate = nil;
}

#pragma mark - CDMSectionChangesProtocol

- (void)sectionDidChangeAppearance:(id<CDMSectionProtocol>)section {
    
}

- (void)section:(id<CDMSectionProtocol>)section didChange:(CDMItemChanges *)changes {
    if ([self.sections containsObject:section]) {
        changes.section = [self.innerSections indexOfObject:section];
        [changes apply:self.adapter];
    }
}

#pragma mark - CDMManagerProtocol

- (NSArray<id<CDMSectionProtocol>> *)sections {
    return [NSArray arrayWithArray:_innerSections];
}

- (void)addSection:(id<CDMSectionProtocol>)section {
    [self addSections:@[section]];
}

- (void)insertSection:(id<CDMSectionProtocol>)section atIndex:(NSUInteger)index {
    [self insertSections:@[section] atIndex:index];
}

- (void)deleteSection:(id<CDMSectionProtocol>)section {
    [self deleteSections:@[section]];
}

- (void)addSections:(NSArray<id<CDMSectionProtocol>> *)sections {
    CDMSectionChanges* changes = [[CDMSectionChanges alloc] init];
    for (id<CDMSectionProtocol> section in sections) {
        if ([_innerSections containsObject:section]) {
            NSUInteger index = [_innerSections indexOfObject:section];
            [_innerSections removeObject:section];
            [_innerSections addObject:section];
            [changes moveSection:index to:[_innerSections indexOfObject:section]];
        } else {
            [self bind:section];
            [_innerSections addObject:section];
            [changes insertSection:[_innerSections indexOfObject:section]];
        }
    }
    [changes apply:self.adapter];
}

- (void)insertSections:(NSArray<id<CDMSectionProtocol>> *)sections atIndex:(NSUInteger)index {
    CDMSectionChanges* changes = [[CDMSectionChanges alloc] init];
    [sections enumerateObjectsUsingBlock:^(id<CDMSectionProtocol> section, NSUInteger idx, BOOL* _) {
        if ([_innerSections containsObject:section]) {
            NSUInteger oldIndex = [_innerSections indexOfObject:section];
            [_innerSections removeObject:section];
            [_innerSections insertObject:section atIndex:index + idx];
            [changes moveSection:oldIndex to:[_innerSections indexOfObject:section]];
        } else {
            [self bind:section];
            [_innerSections insertObject:section atIndex:index + idx];
            [changes insertSection:[_innerSections indexOfObject:section]];
        }
    }];
    [changes apply:self.adapter];
}

- (void)deleteSections:(NSArray<id<CDMSectionProtocol>> *)sections {
    CDMSectionChanges* changes = [[CDMSectionChanges alloc] init];
    NSMutableArray* innerSections = [NSMutableArray arrayWithArray:_innerSections];
    for (id<CDMSectionProtocol> section in sections) {
        if ([_innerSections containsObject:section]) {
            [self unbind:section];
            
            NSUInteger index = [_innerSections indexOfObject:section];
            [innerSections removeObject:section];
            [changes deleteSection:index];
        }
    }
    _innerSections = innerSections;
    [changes apply:self.adapter];
}

#pragma mark - CDMAdapterOutput

- (NSUInteger)numberOfSections {
    return _innerSections.count;
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)sectionIndex {
    id<CDMSectionProtocol> section = _innerSections[sectionIndex];
    return section.items.count;
}

- (id<CDMSectionProtocol>)sectionItemForSection:(NSUInteger)section {
    return _innerSections[section];
}

- (id<CDMItemProtocol>)itemForIndexPath:(NSIndexPath *)indexPath {
    id<CDMSectionProtocol> section = _innerSections[indexPath.section];
    return section.items[indexPath.row];
}

@end
