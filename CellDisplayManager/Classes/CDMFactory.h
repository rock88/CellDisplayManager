//
//  DataDisplayManagerItemFabric.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDMSectionProtocol.h"
#import "CDMItemProtocol.h"

@interface CDMFactory : NSObject

+ (void)registerClass:(Class)class forProtocol:(Protocol *)protocol;

- (__kindof id<CDMSectionProtocol>)sectionWithProtocol:(Protocol *)protocol;

- (__kindof id<CDMItemProtocol>)itemWithProtocol:(Protocol *)protocol;

@end
