//
//  MessageSetting_VC.m
//  京东
//
//  Created by midmirror on 15/10/9.
//  Copyright (c) 2015年 midmirror. All rights reserved.
//

#import "MsgSetting_VC.h"
#import "PopViewController.h"

@interface MsgSetting_VC ()

@end

@implementation MsgSetting_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息设置";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    }
    else
    {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Iden = @"theCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Iden];
    }
    
    NSArray *array = @[@"购买通知",@"优惠促销",@"付款提醒",@"我的资产",@"系统通知",@"我的动态"];
    if (indexPath.section == 0) {
        cell.textLabel.text = array[indexPath.row];
        
        UISwitch *switchView = [[UISwitch alloc] init];
        cell.accessoryView = switchView;
    }
    else
    {
        cell.textLabel.text = @"静音免打扰时段";
    }
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    if (section == 0) {
        return 15;
    }
    else
    {
        return 1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            PopViewController *popVc = [[PopViewController alloc] init];
            [self.navigationController pushViewController:popVc animated:YES];
        }
    }
}

@end
