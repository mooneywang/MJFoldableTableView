//
//  ViewController.m
//  MJFoldableTableView
//
//  Created by 王梦杰 on 16/4/26.
//  Copyright © 2016年 Mooney_wang. All rights reserved.
//

#import "ViewController.h"
#import "MJHeaderView.h"
#import "GroupData.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, MJHeaderViewDelegate>

@property(nonatomic ,weak)UITableView *tableView;

@property(nonatomic, strong)NSMutableArray *groupDataArray;

@end

@implementation ViewController

static NSString *cellIdentity = @"cellIdentity";
static NSString *headIdentity = @"headIdentity";

- (NSMutableArray *)groupDataArray {
    if (!_groupDataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DataList" ofType:@"plist"];
        NSArray *dataList = [NSMutableArray arrayWithContentsOfFile:path];
        _groupDataArray = [NSMutableArray array];
        for (NSDictionary *dict in dataList) {
            GroupData *data = [[GroupData alloc] initWithTitle:dict[@"headTitle"] list:dict[@"list"]];
            [_groupDataArray addObject:data];
        }
    }
    return _groupDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
}

- (void)initTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    self.tableView.sectionFooterHeight = 0;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentity];
    [self.tableView registerClass:[MJHeaderView class] forHeaderFooterViewReuseIdentifier:headIdentity];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupData *data = self.groupDataArray[section];
    return data.opened ? data.list.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentity forIndexPath:indexPath];
    GroupData *data = self.groupDataArray[indexPath.section];;
    NSArray *list = data.list;
    cell.textLabel.text = list[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MJHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headIdentity];
    header.delegate = self;
    header.groupData = self.groupDataArray[section];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

#pragma mark - MJHeaderViewDelegate

- (void)didClickHeaderView:(MJHeaderView *)headerView {
    [self.tableView reloadData];
}

@end
