//
//  CDMManagerProtocol.h
//  CellDisplayManager
//
//  Created by rock88 on 15/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDMSectionProtocol;

@protocol CDMManagerProtocol <NSObject>

@property (nonatomic,readonly) NSArray<id<CDMSectionProtocol>> *sections;

- (void)addSection:(id<CDMSectionProtocol>)section;
- (void)insertSection:(id<CDMSectionProtocol>)section atIndex:(NSUInteger)index;
- (void)deleteSection:(id<CDMSectionProtocol>)section;

- (void)addSections:(NSArray<id<CDMSectionProtocol>> *)sections;
- (void)insertSections:(NSArray<id<CDMSectionProtocol>> *)sections atIndex:(NSUInteger)index;
- (void)deleteSections:(NSArray<id<CDMSectionProtocol>> *)sections;

@end
