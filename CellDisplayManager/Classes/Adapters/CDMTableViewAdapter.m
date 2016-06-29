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

@property (nonatomic,weak) id<CDMAdapterOutput> output;
@property (nonatomic,weak) UITableView* tableView;

@end

@implementation CDMTableViewAdapter

- (instancetype)initWithTableView:(UITableView *)tableView output:(id<CDMAdapterOutput>)output {
    self = [super init];
    if (self) {
        _output = output;
        _tableView = tableView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44.0f;
        
        [_tableView registerClass:NSClassFromString(@"LabelCell") forCellReuseIdentifier:@"Cell"];
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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    id<CDMItemProtocol> item = [_output itemForIndexPath:indexPath];
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

#pragma mark - DataDisplayManagerAdapterInput

- (void)reloadData {
    [_tableView reloadData];
}

- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
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
