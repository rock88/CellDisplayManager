//
//  DataDisplayManager.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMAdapter.h"
#import "CDMManagerProtocol.h"

@protocol CDMSectionProtocol;

@interface CDMManager : NSObject <CDMManagerProtocol, CDMAdapterOutput>

@property (nonatomic) id<CDMAdapterInput> adapter;

@end
