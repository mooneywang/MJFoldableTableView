//
//  GroupData.h
//  MJFoldableTableView
//
//  Created by 王梦杰 on 16/4/26.
//  Copyright © 2016年 Mooney_wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupData : NSObject

@property(nonatomic, strong)NSArray *list;

@property(nonatomic, copy)NSString *title;

@property(nonatomic, assign)BOOL opened;

- (instancetype)initWithTitle:(NSString *)title list:(NSArray *)list;

@end
