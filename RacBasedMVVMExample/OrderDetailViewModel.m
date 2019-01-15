//
//  OrderDetailViewModel.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "OrderDetailViewModel.h"

@implementation OrderDetailViewModel

- (void)combineHotelTitleViewModel:(HotelTitleViewModel *)hotelTitleVM
                nameInputViewModel:(LabelAndTextFieldViewModel *)nameInputVM
               phoneInputViewModel:(LabelAndTextFieldViewModel *)phoneInputVM
{
    
    NSArray *signals = @[RACObserve(hotelTitleVM, title),
                         RACObserve(nameInputVM , inputText),
                         RACObserve(phoneInputVM, inputText)];
    
    _textSignal = [RACSignal combineLatest:signals
                                    reduce:^id (NSString *title, NSString *name, NSString *phone) {
                                        return [NSString stringWithFormat:@"%@ 将入住 %@\n联系电话：%@",
                                                name? : @"",
                                                title,
                                                phone? : @""];
                                    }];

    _clearCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        nameInputVM.inputText  = nil;
        phoneInputVM.inputText = nil;
        return [RACSignal empty];
    }];
    
    _submitCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        if (nameInputVM.inputText == nil) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"入住人不能为空！"};
            NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:userInfo];
            return [RACSignal error:error];
        } else if (phoneInputVM.inputText == nil) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"手机号不能为空！"};
            NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:userInfo];
            return [RACSignal error:error];
        }
        
        return [RACSignal empty];
    }];
    
}


@end
