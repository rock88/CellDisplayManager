//
//  CDMTestsUtils.h
//  CellDisplayManagerApp
//
//  Created by rock88 on 16/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NS_REQUIRES_NIL_TERMINATION NSIndexSet* CDMIndexSetForSections(NSNumber* section, ...);

extern NS_REQUIRES_NIL_TERMINATION NSArray<NSIndexPath *> *CDMIndexPathsForSection(NSNumber* section, NSNumber* item, ...);

extern NSIndexPath* CDMIndexPath(NSNumber* section, NSNumber* row);
