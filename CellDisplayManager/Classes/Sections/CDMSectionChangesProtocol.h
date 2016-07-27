//
//  CDMSectionChangesProtocol.h
//  CellDisplayManagerApp
//
//  Created by rock88 on 19/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDMItemChanges;
@protocol CDMSectionProtocol;

@protocol CDMSectionChangesProtocol <NSObject>

- (void)sectionDidChangeAppearance:(id<CDMSectionProtocol>)section;

- (void)section:(id<CDMSectionProtocol>)section didChange:(CDMItemChanges *)changes;

@end
