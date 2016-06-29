//
//  CDMTableViewCell.h
//  CellDisplayManager
//
//  Created by rock88 on 11/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDMTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UIView* containerView;
@property (nonatomic) IBOutlet UIView* contentView2;

- (void)bindItem;
- (void)unbindItem;

@end
