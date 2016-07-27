//
//  LabelItem.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMLabelItem.h"
#import "CDMFactory.h"

@implementation CDMLabelItem
@synthesize cellClassName, cellNibName, identifier, appearance, changeHandler;

+ (void)load {
    [CDMFactory registerClass:[self class] forProtocol:@protocol(CDMLabelItemProtocol)];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        appearance = [[CDMLabelItemAppearance alloc] init];
    }
    return self;
}

- (void)configureCell:(id<CDMCellProtocol>)cell {
    [self.appearance applyAppearance:cell];
}

@end
