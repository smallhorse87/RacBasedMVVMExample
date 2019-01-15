//
//  HotelTitleCell.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "HotelTitleCell.h"

#import "ReactiveObjC.h"

#import "Masonry.h"

@implementation HotelTitleCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(12);
        make.centerY.equalTo(self.contentView);
    }];
}

// 数据绑定
- (void)bindViewModel:(HotelTitleViewModel *)viewModel
{
    RAC(self.titleLabel, text) = RACObserve(viewModel, title);
}


@end
