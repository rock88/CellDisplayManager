//
//  CDMLabelItemAppearance.m
//  CellDisplayManager
//
//  Created by rock88 on 27/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMLabelItemAppearance.h"
#import "CDMLabelCellProtocol.h"

@implementation CDMLabelItemAppearance

- (instancetype)init {
    self = [super init];
    if (self) {
        _numberOfLines = 1;
        _textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (void)applyAppearance:(id<CDMLabelCellProtocol>)cell {
    [super applyAppearance:(id<CDMCellProtocol>)cell];
    
    cell.label.font = _font;
    cell.label.textAlignment = _textAlignment;
    cell.label.numberOfLines = _numberOfLines;
    cell.label.textColor = _textColor;
    
    if (_text.length > 0 || _attributedText.length > 0) {
        if (_text.length > 0) {
            cell.label.text = _text;
        } else {
            cell.label.attributedText = _attributedText;
        }
    } else {
        cell.label.text = @"";
    }
}

@end
