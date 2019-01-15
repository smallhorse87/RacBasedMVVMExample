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
    _orderDetailLabel = [[UILabel alloc] init];
    _orderDetailLabel.backgroundColor = [UIColor clearColor];
    _orderDetailLabel.textColor = [UIColor blackColor];
    _orderDetailLabel.font = [UIFont systemFontOfSize:15.0];
    _orderDetailLabel.numberOfLines = 2;
    [self.contentView addSubview:_orderDetailLabel];
    [_orderDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView). offset(12);
        make.trailing.equalTo(self.contentView).offset(-12);
        make.top.equalTo(self.contentView).offset(8);
        make.height.equalTo(@60);
    }];
    _orderDetailLabel.text = @"";

    _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _submitButton.backgroundColor = [UIColor blueColor];
    [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [self.contentView addSubview:_submitButton];
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView). offset(12);
        make.top.equalTo(_orderDetailLabel.mas_bottom).offset(8);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];

    _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _clearButton.backgroundColor = [UIColor grayColor];
    [_clearButton setTitle:@"清空输入" forState:UIControlStateNormal];
    [self.contentView addSubview:_clearButton];
    [_clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_submitButton.mas_right). offset(8);
        make.top.equalTo(_orderDetailLabel.mas_bottom).offset(8);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];
}

- (void)bindViewModel:(OrderDetailViewModel *)viewModel
{
    // 操作绑定
    self.clearButton.rac_command = viewModel.clearCommand;
    
    // 信号绑定
    self.submitButton.rac_command = viewModel.submitCommand;
    @weakify(self)
    [self.submitButton.rac_command.errors subscribeNext:^(NSError *x) {
        @strongify(self)
        self.orderDetailLabel.text = x.localizedDescription;
    }];

    RAC(self.orderDetailLabel,text) = viewModel.textSignal;
}

@end
