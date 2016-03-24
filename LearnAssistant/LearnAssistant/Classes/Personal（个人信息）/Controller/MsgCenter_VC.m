//
//  MsgCenter_VC.m
//  京东
//
//  Created by midmirror on 15/10/10.
//  Copyright (c) 2015年 midmirror. All rights reserved.
//

#import "MsgCenter_VC.h"
#import "MsgSetting_VC.h"
#import "CustomTableViewCell.h"
@interface MsgCenter_VC ()

@end

@implementation MsgCenter_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    
    UIButton *myMessageSetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myMessageSetBtn.frame = CGRectMake(0, 0, 30, 30);
    [myMessageSetBtn setImage:[UIImage imageNamed:@"my_more_btn_n"] forState:UIControlStateNormal];
    [myMessageSetBtn addTarget:self action:@selector(MessageSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:myMessageSetBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)MessageSetting
{
    MsgSetting_VC *msgSettingVC = [[MsgSetting_VC alloc] init];
    [self.navigationController pushViewController:msgSettingVC animated:YES];
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *Iden = @"theCell";
    CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:Iden];
    if (customCell == nil) {
        customCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Iden];
    }
    if (indexPath.section ==0) {
        NSArray *imageArray = @[@"jingdongdongdong",@"Msgicon_1",@"Msgicon_2",@"Msgicon_4"];
        NSArray *titleArray = @[@"助手咚咚",@"我的图书",@"限免图书",@"我的资产"];
        NSArray *detailArray = @[@"点击查看您最近的学习计划记录",@"你未购买过图书",@"来看看吧，这里有限时免费的图书哟···",@"您昨日收到一张优惠券，优惠额2元"];
        NSArray *timeArray = @[@"前天",@"1月4日",@"1月3日"];
        customCell.titleLabel.text = titleArray[indexPath.row];
        customCell.detailLabel.text = detailArray[indexPath.row];
        customCell.detailLabel.font = [UIFont systemFontOfSize:16];
        customCell.detailLabel.textColor = [UIColor grayColor];
        customCell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
        
        switch (indexPath.row) {
            case 1:
            case 2:
            case 3:
                customCell.rightLabel.text = timeArray[indexPath.row-1];
                customCell.rightLabel.font = [UIFont systemFontOfSize:15];
                customCell.rightLabel.textAlignment = NSTextAlignmentRight;
                customCell.rightLabel.textColor = [UIColor grayColor];
            default:
                break;
        }
    }
    return customCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
