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

- (instancetype)initWithTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        [self buildUI:title];
    }
    return self;
}

- (void)buildUI:(NSString*)title
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(12);
        make.width.equalTo(@70);
        make.centerY.equalTo(self.contentView);
    }];
    titleLabel.text = title;

    _textField = [[UITextField alloc] initWithFrame:CGRectZero];
    _textField.backgroundColor     = [UIColor grayColor];
    [self.contentView addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(12);
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
