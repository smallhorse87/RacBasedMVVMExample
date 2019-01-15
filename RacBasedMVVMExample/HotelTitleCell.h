//
//  HotelTitleCell.h
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "MVVMBaseCell.h"

#import "HotelTitleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HotelTitleCell : MVVMBaseCell

- (void)bindViewModel:(HotelTitleViewModel *)viewModel;

@property (strong, nonatomic) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
