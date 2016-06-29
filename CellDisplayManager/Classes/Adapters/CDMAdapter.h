//
//  DataDisplayManagerAdapter.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDMSectionProtocol;
@protocol CDMItemProtocol;

@protocol CDMAdapterOutput <NSObject>

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfItemsInSection:(NSUInteger)section;
- (id<CDMSectionProtocol>)sectionItemForSection:(NSUInteger)section;
- (id<CDMItemProtocol>)itemForIndexPath:(NSIndexPath *)indexPath;

@end

@protocol CDMAdapterInput <NSObject>

- (void)reloadData;

- (void)insertSections:(NSIndexSet *)sections;
- (void)deleteSections:(NSIndexSet *)sections;
- (void)reloadSections:(NSIndexSet *)sections;
- (void)moveSection:(NSUInteger)section toSection:(NSUInteger)newSection;

- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

@end
