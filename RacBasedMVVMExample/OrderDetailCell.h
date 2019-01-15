//
//  OrderDetailCell.h
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "MVVMBaseCell.h"

#import "OrderDetailViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailCell : MVVMBaseCell

- (void)bindViewModel:(OrderDetailViewModel *)viewModel;

@property (strong, nonatomic) UIButton *clearButton;

@end

NS_ASSUME_NONNULL_END
