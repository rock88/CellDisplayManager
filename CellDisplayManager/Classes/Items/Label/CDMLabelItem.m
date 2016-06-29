//
//  LabelItem.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMLabelItem.h"

@implementation CDMLabelItem
@synthesize cellClassName, cellNibName, identifier, appearance, changeHandler;

- (instancetype)init {
    self = [super init];
    if (self) {
        appearance = [[CDMLabelItemAppearance alloc] init];
    }
    return self;
}

- (void)configureCell:(id<CDMCellProtocol>)cell {
    
}

@end
