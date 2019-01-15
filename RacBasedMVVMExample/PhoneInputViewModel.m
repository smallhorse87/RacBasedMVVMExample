//
//  PhoneInputViewModel.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "PhoneInputViewModel.h"

@implementation PhoneInputViewModel

-(void)verifyPhoneSignal
{
    _verifyPhoneSignal = [RACObserve(self, inputText) map:^id (NSString *phone) {
        NSString *phoneRegexp = @"^1(3[0-9]|5[0-35-9]|8[0-25-9])\\d{8}$";
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegexp];
        return @((BOOL)[regextestmobile evaluateWithObject:phone]);
    }];
}

@end
