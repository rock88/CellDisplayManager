//
//  CDMItemChanges.h
//  CellDisplayManager
//
//  Created by rock88 on 28/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDMAdapterInput;

@interface CDMItemChanges : NSObject

@property (nonatomic) NSUInteger section;

- (void)insertItem:(NSUInteger)index;
- (void)deleteItem:(NSUInteger)index;
- (void)moveItem:(NSUInteger)from to:(NSUInteger)to;
- (void)reloadItem:(NSUInteger)index;

- (void)apply:(id<CDMAdapterInput>)adapter;

@end
