//
//  OrderDetailViewModel.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "OrderDetailViewModel.h"

#import "HotelTitleViewModel.h"
#import "LabelAndTextFieldViewModel.h"

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
    
}


@end
