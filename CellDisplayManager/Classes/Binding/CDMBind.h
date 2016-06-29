//
//  CDMBind.h
//  CellDisplayManager
//
//  Created by rock88 on 10/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDMBind : NSObject

+ (instancetype)input:(id)input inKeypath:(NSString *)inKeypath output:(id)output outKeypath:(NSString *)outKeypath;
+ (instancetype)input:(id)input keypath:(NSString *)keypath;

- (instancetype)ignore:(id)value;
- (instancetype)map:(id(^)(id value))block;
- (instancetype)subscribe:(void(^)(id value))block;

- (void)unbind;

@end
