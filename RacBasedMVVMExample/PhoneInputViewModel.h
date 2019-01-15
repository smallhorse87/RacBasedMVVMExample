//
//  PhoneInputViewModel.h
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "LabelAndTextFieldViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhoneInputViewModel : LabelAndTextFieldViewModel

-(void)buildVerifyPhoneSignal;

@property (strong, nonatomic) RACSignal *verifyPhoneSignal;

@end

NS_ASSUME_NONNULL_END
