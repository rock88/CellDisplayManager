//
//  UITableView+CellDisplayManager.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "UITableView+CellDisplayManager.h"
#import "CDMManager.h"
#import "CDMTableViewAdapter.h"

@implementation UITableView (CellDisplayManager)

- (void)setCellDisplayManager:(CDMManager *)manager {
    CDMTableViewAdapter* adaptor = [[CDMTableViewAdapter alloc] initWithTableView:self output:manager];
    manager.adapter = adaptor;
}

@end
