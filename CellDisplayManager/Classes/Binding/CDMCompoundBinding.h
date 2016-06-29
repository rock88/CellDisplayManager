//
//  CDMCompoundBinding.h
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDMBindValue;

@interface CDMCompoundBinding : NSObject

- (instancetype)initWithValues:(NSArray<CDMBindValue *> *)values;

- (void)addChangeHandler:(void (^)(void))handler;

@end
