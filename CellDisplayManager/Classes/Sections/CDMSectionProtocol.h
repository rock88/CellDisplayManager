//
//  CDMSectionProtocol.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDMItemChanges;
@protocol CDMItemProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol CDMSectionProtocol <NSObject>

/**
 * Use for set some user data to section
 */

@property (nonatomic, copy, nullable) NSString* identifier;

/**
 *
 */

@property (nonatomic, readonly) NSArray<id<CDMItemProtocol>> *items;

/**
 *
 */

@property (nonatomic, copy, nullable) void(^changeHandler)(id<CDMSectionProtocol> section, CDMItemChanges* changes);

- (void)addItem:(id<CDMItemProtocol>)item;
- (void)insertItem:(id<CDMItemProtocol>)item atIndex:(NSUInteger)index;
- (void)deleteItem:(id<CDMItemProtocol>)item;

- (void)addItems:(NSArray<id<CDMItemProtocol>> *)items;
- (void)insertItems:(NSArray<id<CDMItemProtocol>> *)items atIndex:(NSUInteger)index;
- (void)deleteItems:(NSArray<id<CDMItemProtocol>> *)items;

@end

NS_ASSUME_NONNULL_END
