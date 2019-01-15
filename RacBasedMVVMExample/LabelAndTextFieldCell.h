//
//  LabelAndTextFieldCell.h
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "MVVMBaseCell.h"

#import "LabelAndTextFieldViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LabelAndTextFieldCell : MVVMBaseCell

@property (strong, nonatomic) UITextField *textField;

- (instancetype)initWithTitle:(NSString*)title;

- (void)bindViewModel:(LabelAndTextFieldViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
