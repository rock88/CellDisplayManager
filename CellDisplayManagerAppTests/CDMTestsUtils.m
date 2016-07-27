//
//  CDMTestsUtils.m
//  CellDisplayManagerApp
//
//  Created by rock88 on 16/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMTestsUtils.h"

NS_REQUIRES_NIL_TERMINATION NSIndexSet* CDMIndexSetForSections(NSNumber* section, ...) {
    NSMutableIndexSet* indexSet = [NSMutableIndexSet indexSetWithIndex:section.integerValue];
    
    va_list list;
    va_start(list, section);
    
    while ((section = va_arg(list, NSNumber *))) {
        [indexSet addIndex:section.integerValue];
    }
    
    va_end(list);
    return indexSet;
}

NS_REQUIRES_NIL_TERMINATION NSArray<NSIndexPath *> *CDMIndexPathsForSection(NSNumber* section, NSNumber* item, ...) {
    NSMutableArray* array = [NSMutableArray array];
    [array addObject:CDMIndexPath(section, item)];
    
    va_list list;
    va_start(list, item);
    
    while ((item = va_arg(list, NSNumber *))) {
        [array addObject:CDMIndexPath(section, item)];
    }
    
    va_end(list);
    return array;
}

NSIndexPath* CDMIndexPath(NSNumber* section, NSNumber* row) {
    return [NSIndexPath indexPathForRow:row.integerValue inSection:section.integerValue];
}
