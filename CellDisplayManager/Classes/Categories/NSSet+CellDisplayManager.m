//
//  NSSet+CellDisplayManager.m
//  CellDisplayManagerApp
//
//  Created by Andrey Konoplyankin on 09/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "NSSet+CellDisplayManager.h"
#import "CDMSectionChanges.h"

// 1 2 3 4
// 2 3 5

@implementation NSOrderedSet (CellDisplayManager)

- (NSMutableOrderedSet *)same:(NSMutableOrderedSet *)other {
    NSMutableOrderedSet* set = [NSMutableOrderedSet orderedSetWithOrderedSet:self];
    [set intersectOrderedSet:other];
    return set;
}

- (NSMutableOrderedSet *)removed:(NSMutableOrderedSet *)other {
    NSMutableOrderedSet* set = [NSMutableOrderedSet orderedSetWithOrderedSet:self];
    [set minusSet:other.set];
    return set;
}

- (NSMutableOrderedSet *)new:(NSMutableOrderedSet *)other {
    NSMutableOrderedSet* set = [NSMutableOrderedSet orderedSetWithOrderedSet:other];
    [set minusSet:self.set];
    return set;
}

- (CDMSectionChanges *)diff:(NSMutableOrderedSet *)set {
    CDMSectionChanges* changes = [[CDMSectionChanges alloc] init];
    
    NSOrderedSet* removed = [self removed:set];
    NSOrderedSet* same = [self same:set];
    NSOrderedSet* new = [self new:set];
    
    [removed enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL* _) {
        [changes deleteSection:[self indexOfObject:object]];
    }];
    [new enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL* _) {
        [changes insertSection:[set indexOfObject:object]];
    }];
    [same enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL* _) {
        NSUInteger old = [self indexOfObject:object];
        NSUInteger new = [set indexOfObject:object];
        if (old != new) {
            [changes moveSection:old to:new];
        }
    }];
    return changes;
}

@end
