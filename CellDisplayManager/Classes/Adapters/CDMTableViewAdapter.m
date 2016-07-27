//
//  DataDisplayManagerTableViewAdapter.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMTableViewAdapter.h"
#import "CDMItemProtocol.h"

@interface CDMTableViewAdapter () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<CDMAdapterOutput> output;
@property (nonatomic, weak) UITableView* tableView;

@end

@implementation CDMTableViewAdapter

- (instancetype)initWithTableView:(UITableView *)tableView output:(id<CDMAdapterOutput>)output {
    self = [super init];
    if (self) {
        _output = output;
        _tableView = tableView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44.0f;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_output numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_output numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<CDMCellProtocol> *cell = nil;
    id<CDMItemProtocol> item = [_output itemForIndexPath:indexPath];
    
    if (item.cellNibName) {
        cell = [tableView dequeueReusableCellWithIdentifier:item.cellNibName];
        
        if (cell == nil) {
            UINib* nib = nil;
            if ([[NSBundle mainBundle] pathForResource:item.cellNibName ofType:@"nib"]) {
                nib = [UINib nibWithNibName:item.cellNibName bundle:nil];
            } else if ([[NSBundle bundleForClass:[self class]] pathForResource:item.cellNibName ofType:@"nib"]) {
                nib = [UINib nibWithNibName:item.cellNibName bundle:[NSBundle bundleForClass:[self class]]];
            }
            
            NSParameterAssert(nib);
            [tableView registerNib:nib forCellReuseIdentifier:item.cellNibName];
            
            cell = [tableView dequeueReusableCellWithIdentifier:item.cellNibName];
        }
    } else if (item.cellClassName) {
        cell = [tableView dequeueReusableCellWithIdentifier:item.cellClassName];
        
        if (cell == nil && NSClassFromString(item.cellClassName)) {
            [tableView registerClass:NSClassFromString(item.cellClassName) forCellReuseIdentifier:item.cellClassName];
            
            cell = [tableView dequeueReusableCellWithIdentifier:item.cellClassName];
        }
    }
    
    NSParameterAssert(cell);
    
    [item configureCell:cell];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CDMItemProtocol> item = [_output itemForIndexPath:indexPath];
    if (item.appearance.size.height > 0.0f) {
        return item.appearance.size.height;
    }
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - CDMAdapterInput

- (void)reloadData {
    [_tableView reloadData];
}

- (void)insertSections:(NSIndexSet *)sections {
    [_tableView beginUpdates];
    [_tableView insertSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
    [_tableView endUpdates];
}

- (void)deleteSections:(NSIndexSet *)sections {
    
}

- (void)reloadSections:(NSIndexSet *)sections {
    
}

- (void)moveSection:(NSUInteger)section toSection:(NSUInteger)newSection {
    
}

- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    [_tableView beginUpdates];
    [_tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [_tableView endUpdates];
}

- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
}

- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    [_tableView beginUpdates];
    [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [_tableView endUpdates];
}

- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath {
    
}

@end
