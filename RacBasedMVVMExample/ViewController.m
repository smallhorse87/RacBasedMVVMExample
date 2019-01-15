//
//  ViewController.m
//  RacBasedMVVMExample
//
//  Created by chenxiaosong on 2019/1/15.
//  Copyright © 2019年 chenxiaosong. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"
#import "ReactiveObjC.h"

#import "HotelTitleCell.h"
#import "HotelTitleViewModel.h"

#import "LabelAndTextFieldCell.h"
#import "LabelAndTextFieldViewModel.h"
#import "PhoneInputViewModel.h"

#import "OrderDetailCell.h"
#import "OrderDetailViewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *cellArr;
}

@property (nonatomic,assign) BOOL      validPhone;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUI];
    
    [self constructTable];
}


- (void)buildUI
{
    self.title = @"数据绑定";

    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView =  [[UITableView alloc] init];
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate   = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        if(@available(iOS 11.0, *))
        {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.view).offset(64.0);
        }
        
        make.bottom.equalTo(self.view);
    }];
}

- (void)constructTable
{
    cellArr = [[NSMutableArray alloc] init];
    
    //标题单元格
    HotelTitleViewModel *hotelTitleVM = [[HotelTitleViewModel alloc] init];
    HotelTitleCell *hotelTitleCell = [[HotelTitleCell alloc] init];
    hotelTitleCell.isw_height = 30;
    hotelTitleVM.title = @"美团酒店-望京国际研发园店";
    [hotelTitleCell bindViewModel:hotelTitleVM];
    [cellArr addObject:hotelTitleCell];

    LabelAndTextFieldViewModel *personLabelAndTextFieldVM = [[LabelAndTextFieldViewModel alloc] init];
    LabelAndTextFieldCell *personLabelAndTextFieldCell    = [[LabelAndTextFieldCell alloc] init];
    personLabelAndTextFieldCell.titleLabel.text = @"入住人:";
    personLabelAndTextFieldCell.isw_height = 44;
    [personLabelAndTextFieldCell bindViewModel:personLabelAndTextFieldVM];
    [cellArr addObject:personLabelAndTextFieldCell];

    PhoneInputViewModel *phoneLabelAndTextFieldVM = [[PhoneInputViewModel alloc] init];
    [phoneLabelAndTextFieldVM buildVerifyPhoneSignal];
    LabelAndTextFieldCell *phoneLabelAndTextFieldCell    = [[LabelAndTextFieldCell alloc] init];
    phoneLabelAndTextFieldCell.titleLabel.text = @"手机号:";
    phoneLabelAndTextFieldCell.isw_height = 44;
    [phoneLabelAndTextFieldCell bindViewModel:phoneLabelAndTextFieldVM];
    [cellArr addObject:phoneLabelAndTextFieldCell];

    OrderDetailViewModel *orderDetailViewModel = [[OrderDetailViewModel alloc] init];
    [orderDetailViewModel combineHotelTitleViewModel:hotelTitleVM
                                  nameInputViewModel:personLabelAndTextFieldVM
                                 phoneInputViewModel:phoneLabelAndTextFieldVM];
    OrderDetailCell *orderDetailCell = [[OrderDetailCell alloc] init];
    orderDetailCell.isw_height = 120;
    [orderDetailCell bindViewModel:orderDetailViewModel];
    [cellArr addObject:orderDetailCell];
    
    RAC(self, validPhone) = phoneLabelAndTextFieldVM.verifyPhoneSignal;
}

#pragma mark - table

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(cellArr==nil || cellArr.count==0)
        return 0;

    MVVMBaseCell *baseCell = cellArr[indexPath.row];

    return baseCell.isw_height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"row num : %ld", cellArr.count);
    
    return cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellArr[indexPath.row];
}

@end
