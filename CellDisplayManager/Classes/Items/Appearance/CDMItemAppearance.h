//
//  CDMItemAppearance.h
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDMItemAppearance : NSObject

/**
 * Set to YES for hide cell from container. Animatable
 */

@property (nonatomic) BOOL hidden;

/**
 * Set for concrete size of cell, otherwise will be use autolayout based size. Animatable
 */

@property (nonatomic) CGSize size;

/**
 * Set for define content instets. Animatable
 */

@property (nonatomic) UIEdgeInsets edgeInsets;

/**
 * Set for define background cell color. Animatable
 */

@property (nonatomic, nullable) UIColor* backgroundColor;

/**
 * Set for define selected cell color. Animatable
 */

@property (nonatomic, nullable) UIColor* selectedColor;

@end

NS_ASSUME_NONNULL_END
