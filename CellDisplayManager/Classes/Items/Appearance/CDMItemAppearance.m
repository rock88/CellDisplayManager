//
//  CDMItemAppearance.m
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMItemAppearance.h"
#import "CDMCellProtocol.h"

@implementation CDMItemAppearance

- (instancetype)init {
    self = [super init];
    if (self) {
        _selectionStyle = CDMItemAppearanceSelectionStyleDefault;
    }
    return self;
}

- (void)applyAppearance:(id<CDMCellProtocol>)cell {
    if (cell.selectedBackgroundView == nil) {
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    cell.selectedBackgroundView.backgroundColor = self.selectedColor;
    cell.contentView.backgroundColor = self.backgroundColor;
}

@end
