//
//  NSSet+CellDisplayManager.h
//  CellDisplayManagerApp
//
//  Created by Andrey Konoplyankin on 09/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDMSectionChanges;

@interface NSOrderedSet (CellDisplayManager)

- (CDMSectionChanges *)diff:(NSOrderedSet *)set;

@end
