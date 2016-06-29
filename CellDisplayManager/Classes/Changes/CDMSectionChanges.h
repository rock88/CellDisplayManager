//
//  CDMChanges.h
//  CellDisplayManager
//
//  Created by rock88 on 19/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDMAdapterInput;

@interface CDMSectionChanges : NSObject

- (void)insertSection:(NSUInteger)index;
- (void)deleteSection:(NSUInteger)index;
- (void)moveSection:(NSUInteger)from to:(NSUInteger)to;
- (void)reloadSection:(NSUInteger)index;

- (void)apply:(id<CDMAdapterInput>)adapter;

@end
