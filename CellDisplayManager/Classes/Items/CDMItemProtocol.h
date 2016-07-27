//
//  CDMItemProtocol.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDMItemAppearance.h"
#import "CDMCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CDMItemProtocol <NSObject>

/**
 * Use for define a class for associated cell
 */

@property (nonatomic, copy, nullable) NSString* cellClassName;

/**
 * Use for define a nib for associated cell
 */

@property (nonatomic, copy, nullable) NSString* cellNibName;

/**
 * Use for set some user data to item
 */

@property (nonatomic, copy, nullable) NSString* identifier;

/**
 *
 */

@property (nonatomic, copy, nullable) void(^changeHandler)(id<CDMItemProtocol> item);

/**
 *
 */

@property (nonatomic, readonly) CDMItemAppearance* appearance;

/**
 *
 */

- (void)configureCell:(id<CDMCellProtocol>)cell;

@end

NS_ASSUME_NONNULL_END
