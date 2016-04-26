//
//  MJHeaderView.h
//  MJFoldableTableView
//
//  Created by 王梦杰 on 16/4/26.
//  Copyright © 2016年 Mooney_wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupData;
@class MJHeaderView;

@protocol MJHeaderViewDelegate <NSObject>

@optional
- (void)didClickHeaderView:(MJHeaderView *)headerView;

@end

@interface MJHeaderView : UITableViewHeaderFooterView

@property(nonatomic ,weak)id<MJHeaderViewDelegate> delegate;

@property(nonatomic, strong)GroupData *groupData;

@end
