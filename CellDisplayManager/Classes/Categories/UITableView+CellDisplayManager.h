//
//  UITableView+CellDisplayManager.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDMManager;

@interface UITableView (CellDisplayManager)

- (void)setCellDisplayManager:(CDMManager *)manager;

@end
