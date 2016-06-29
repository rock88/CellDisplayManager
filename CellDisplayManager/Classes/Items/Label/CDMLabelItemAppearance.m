//
//  CDMLabelItemAppearance.m
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMLabelItemAppearance.h"

@implementation CDMLabelItemAppearance

- (instancetype)init {
    self = [super init];
    if (self) {
        self.numberOfLines = 1;
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

@end
