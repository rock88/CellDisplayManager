//
//  LabelCell.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "LabelCell.h"
#import "CDMLabelItemProtocol.h"
#import "CDMBind.h"

@interface LabelCell ()

@property (nonatomic) IBOutlet UILabel* label;
@property (nonatomic) IBOutlet NSLayoutConstraint* left, *right, *top, *bottom;

@end

@implementation LabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _label = [[UILabel alloc] init];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_label];
    
    NSLayoutAttribute left = NSLayoutAttributeLeft, right = NSLayoutAttributeRight;
    NSLayoutAttribute top = NSLayoutAttributeTop, bottom = NSLayoutAttributeBottom;
    
    _left = [NSLayoutConstraint constraintWithItem:_label attribute:left relatedBy:0 toItem:self attribute:left multiplier:1.0f constant:0.0f];
    _right = [NSLayoutConstraint constraintWithItem:_label attribute:right relatedBy:0 toItem:self attribute:right multiplier:1.0f constant:0.0f];
    _top = [NSLayoutConstraint constraintWithItem:_label attribute:top relatedBy:0 toItem:self attribute:top multiplier:1.0f constant:0.0f];
    _bottom = [NSLayoutConstraint constraintWithItem:_label attribute:bottom relatedBy:0 toItem:self attribute:bottom multiplier:1.0f constant:0.0f];
    [self addConstraints:@[_left, _right, _top, _bottom]];
    
    [self bind];
}

- (void)bind {
    __weak typeof(self) weak = self;
    
    [CDMBind input:self inKeypath:@"item.text" output:self.label outKeypath:@"text"];
    [CDMBind input:self inKeypath:@"item.font" output:self.label outKeypath:@"font"];
    [CDMBind input:self inKeypath:@"item.textColor" output:self.label outKeypath:@"textColor"];
    [CDMBind input:self inKeypath:@"item.backgroundColor" output:self outKeypath:@"backgroundColor"];
    [CDMBind input:self inKeypath:@"item.numberOfLines" output:self.label outKeypath:@"numberOfLines"];
    [CDMBind input:self inKeypath:@"item.textAlignment" output:self.label outKeypath:@"textAlignment"];
    
    [[CDMBind input:self inKeypath:@"item.selectedColor" output:self outKeypath:@"selectedBackgroundView"] map:^id(id color) {
        UIView* view = [[UIView alloc] init];
        view.backgroundColor = color;
        return view;
    }];
    
    [[CDMBind input:self keypath:@"item.edgeInsets"] subscribe:^(NSValue* value) {
        UIEdgeInsets insets = [value UIEdgeInsetsValue];
        weak.left.constant = insets.left;
        weak.right.constant = -insets.right;
        weak.top.constant = insets.top;
        weak.bottom.constant = -insets.bottom;
        [weak setNeedsLayout];
    }];
}

@end
