//
//  OrderDetailCell.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "OrderDetailCell.h"

#import "Masonry.h"

@implementation OrderDetailCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //一个label，两个按钮
    UILabel *orderDetailLabel = [[UILabel alloc] init];
    orderDetailLabel.backgroundColor = [UIColor clearColor];
    orderDetailLabel.textColor = [UIColor blackColor];
    orderDetailLabel.font = [UIFont systemFontOfSize:15.0];
    orderDetailLabel.numberOfLines = 2;
    [self.contentView addSubview:orderDetailLabel];
    [orderDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView). offset(12);
        make.trailing.equalTo(self.contentView).offset(-12);
        make.top.equalTo(self.contentView).offset(8);
        make.height.equalTo(@60);
    }];
    orderDetailLabel.text = @"";

    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.backgroundColor = [UIColor blueColor];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.contentView addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView). offset(12);
        make.top.equalTo(orderDetailLabel.mas_bottom).offset(8);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];

    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clearButton.backgroundColor = [UIColor grayColor];
    [clearButton setTitle:@"清空输入" forState:UIControlStateNormal];
    [self.contentView addSubview:clearButton];
    [clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(submitBtn.mas_right). offset(8);
        make.top.equalTo(orderDetailLabel.mas_bottom).offset(8);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];
}

- (void)bindViewModel:(OrderDetailViewModel *)viewModel
{
    // 操作绑定
    self.clearButton.rac_command = viewModel.clearCommand;

}

@end
