//
//  CDMLabelItemProtocol.h
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMItemProtocol.h"
#import "CDMLabelItemAppearance.h"

@protocol CDMLabelItemProtocol <CDMItemProtocol>

@property (nonatomic, readonly) CDMLabelItemAppearance* appearance;

@end
