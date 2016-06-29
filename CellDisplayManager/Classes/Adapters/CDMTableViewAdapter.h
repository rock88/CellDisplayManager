//
//  DataDisplayManagerTableViewAdapter.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDMAdapter.h"

@interface CDMTableViewAdapter : NSObject <CDMAdapterInput>

- (instancetype)initWithTableView:(UITableView *)tableView output:(id<CDMAdapterOutput>)output;

@end
