//
//  CDMLabelItemAppearance.h
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMItemAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDMLabelItemAppearance : CDMItemAppearance

/**
 * Animatable
 */

@property (nonatomic, copy, nullable) NSString* text;

/**
 * Animatable
 */

@property (nonatomic, copy, nullable) NSAttributedString* attributedText;

/**
 * Animatable
 */

@property (nonatomic, nullable) UIFont* font;

/**
 * Animatable
 */

@property (nonatomic, nullable) UIColor* textColor;

/**
 * Animatable
 */

@property (nonatomic) NSInteger numberOfLines;

/**
 * Animatable
 */

@property (nonatomic) NSTextAlignment textAlignment;

@end

NS_ASSUME_NONNULL_END
