//
//  CDMCellProtocol.h
//  CellDisplayManager
//
//  Created by rock88 on 28/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDMCellProtocol <NSObject>

@property (nonatomic, readonly) UIView* contentView;
@property (nonatomic) UIView* selectedBackgroundView;

@end
