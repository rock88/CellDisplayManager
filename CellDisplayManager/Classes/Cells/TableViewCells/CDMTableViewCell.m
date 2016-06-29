//
//  CDMTableViewCell.m
//  CellDisplayManager
//
//  Created by rock88 on 11/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMTableViewCell.h"

@interface CDMTableViewCell ()

@end

@implementation CDMTableViewCell

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    if (self.superview) {
        [self bindItem];
    } else {
        [self unbindItem];
    }
}

#pragma mark - Binding

- (void)bindItem {
    
}

- (void)unbindItem {
    
}

@end
