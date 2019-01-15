//
//  LabelAndTextFieldCell.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "LabelAndTextFieldCell.h"

#import "ReactiveObjC.h"

#import "Masonry.h"

@implementation LabelAndTextFieldCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(12);
        make.width.equalTo(@70);
        make.centerY.equalTo(self.contentView);
    }];
    _titleLabel.text = nil;

    _textField = [[UITextField alloc] initWithFrame:CGRectZero];
    _textField.backgroundColor     = [UIColor grayColor];
    [self.contentView addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel.mas_right).offset(12);
        make.trailing.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(self.contentView);
    }];
}

// 数据双向绑定
- (void)bindViewModel:(LabelAndTextFieldViewModel *)viewModel
{
    RACChannelTerminal *channelTerminal  = self.textField.rac_newTextChannel;
    RACChannelTerminal *channelTerminal2 = RACChannelTo(viewModel, inputText);

    [channelTerminal  subscribe:channelTerminal2];
    [channelTerminal2 subscribe:channelTerminal];
}

@end
