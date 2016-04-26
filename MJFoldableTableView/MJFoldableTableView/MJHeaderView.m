//
//  MJHeaderView.m
//  MJFoldableTableView
//
//  Created by 王梦杰 on 16/4/26.
//  Copyright © 2016年 Mooney_wang. All rights reserved.
//

#import "MJHeaderView.h"
#import "GroupData.h"

@interface MJHeaderView()

@property(nonatomic ,weak)UILabel *titleLabel;

@property(nonatomic ,weak)UIImageView *imageView;

@end

@implementation MJHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"DownAccessory"];
    imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tapG];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(20, 0, 200, self.frame.size.height);
    self.imageView.frame = CGRectMake(self.frame.size.width - self.frame.size.height, 0, self.frame.size.height, self.frame.size.height);
}

- (void)setGroupData:(GroupData *)groupData {
    _groupData = groupData;
    self.titleLabel.text = groupData.title;
    self.imageView.image = self.groupData.opened ? [UIImage imageNamed:@"UpAccessory"] : [UIImage imageNamed:@"DownAccessory"];
}

- (void)tap {
    self.groupData.opened = !self.groupData.opened;
    self.imageView.image = self.groupData.opened ? [UIImage imageNamed:@"UpAccessory"] : [UIImage imageNamed:@"DownAccessory"];
    if ([self.delegate respondsToSelector:@selector(didClickHeaderView:)]) {
        [self.delegate didClickHeaderView:self];
    }
}

@end
