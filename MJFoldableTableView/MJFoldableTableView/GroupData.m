//
//  GroupData.m
//  MJFoldableTableView
//
//  Created by 王梦杰 on 16/4/26.
//  Copyright © 2016年 Mooney_wang. All rights reserved.
//

#import "GroupData.h"

@implementation GroupData

- (instancetype)initWithTitle:(NSString *)title list:(NSArray *)list {
    if (self = [super init]) {
        _title = title;
        _list = list;
    }
    return self;
}

@end
