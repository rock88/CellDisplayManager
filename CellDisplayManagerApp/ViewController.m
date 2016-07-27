//
//  ViewController.m
//  CellDisplayManagerApp
//
//  Created by rock88 on 11/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "ViewController.h"
#import <CellDisplayManager/CellDisplayManager.h>

@interface ViewController ()

@property IBOutlet UITableView* tableView;
@property CDMManager* manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[CDMManager alloc] init];
    [self.tableView setCellDisplayManager:self.manager];
    
    CDMFactory* factory = [[CDMFactory alloc] init];
    
    id<CDMSectionProtocol> section = [factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
    [self.manager addSection:section];
    
    id<CDMLabelItemProtocol> item = [factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
    item.cellNibName = @"CDMLabelTableViewCell";
    [item appearance].text = @"Test";
    [item appearance].textAlignment = NSTextAlignmentCenter;
    [item appearance].size = CGSizeMake(0, 64);
    [item appearance].backgroundColor = [UIColor greenColor];
    [section addItem:item];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        id<CDMLabelItemProtocol> item = [factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
        item.cellNibName = @"CDMLabelTableViewCell";
        [item appearance].size = CGSizeMake(0, 200);
        [item appearance].text = @"Lol";
        [item appearance].backgroundColor = [UIColor redColor];
        [section addItem:item];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        id<CDMSectionProtocol> section = [factory sectionWithProtocol:@protocol(CDMSectionProtocol)];
        [self.manager addSection:section];
        
        id<CDMLabelItemProtocol> item = [factory itemWithProtocol:@protocol(CDMLabelItemProtocol)];
        item.cellNibName = @"CDMLabelTableViewCell";
        [item appearance].backgroundColor = [UIColor blueColor];
        [section addItem:item];
    });
}

@end
