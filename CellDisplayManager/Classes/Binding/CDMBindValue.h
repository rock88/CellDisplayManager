//
//  CDMBindValue.h
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDMBindValue<__covariant ObjectType> : NSObject

@property (nonatomic) ObjectType value;

- (instancetype)initWithValue:(ObjectType)value;

- (void)addChangeHandler:(void (^)(ObjectType value))handler;

@end
