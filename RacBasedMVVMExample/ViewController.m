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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *cellArr;
}
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
    HotelTitleCell *hotelTitleCell = [[HotelTitleCell alloc] init];
    HotelTitleViewModel *hotelTitleVM = [[HotelTitleViewModel alloc] init];
    hotelTitleVM.title = @"美团酒店-望京国际研发园店";
    [hotelTitleCell bindViewModel:hotelTitleVM];
    [cellArr addObject:hotelTitleCell];
    
}

#pragma mark - table

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
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
