//
//  OrderDetailViewModel.h
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailViewModel : BaseViewModel

@property (strong, nonatomic) RACCommand *clearCommand;

@property (strong, nonatomic) RACSignal  *textSignal;

@end

NS_ASSUME_NONNULL_END
