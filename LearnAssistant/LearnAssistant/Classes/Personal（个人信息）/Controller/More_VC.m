//
//  More_VC.m
//  京东
//
//  Created by midmirror on 15/10/9.
//  Copyright (c) 2015年 midmirror. All rights reserved.
//

#import "More_VC.h"
#import "LoginController.h"
#import "MBProgressHUD+MJ.h"
@interface More_VC ()
@property(nonatomic,copy)NSString *memory;
@end

@implementation More_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    self.memory = @"2.99M";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"myCell";
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (tableCell == nil) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndentifier];
        tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//后面的小箭头风格
    }
    NSArray *textArray = @[@"非Wifi环境下手动下载图片",@"WiFi环境下自动升级客户端",@"清除本地缓存",@"应用推荐",@"关于"];
    NSArray *textArray2 = @[@"关于",@"退出登录"];

    tableCell.textLabel.text = textArray[indexPath.row];
    if (indexPath.section == 1) {
        tableCell.textLabel.text = textArray2[indexPath.row];
    }
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 2)
            {
                tableCell.detailTextLabel.text = self.memory;
//                tableCell.accessoryType = UITableViewCellAccessoryNone;//后面的小箭头风格
            }
            else
            {
                UISwitch *switchView = [[UISwitch alloc] init];
                [switchView addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventValueChanged];
                tableCell.accessoryView = switchView;
            }
            break;
            
        default:
            break;
    }
    return tableCell;
}

- (void)switchAction
{
    NSLog(@"切换");
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            [MBProgressHUD showMessage:@"正在清理，请稍后"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.memory = @"0M";
                [tableView reloadData];
            });

        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            //关于
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"这里是您的学习助手"                                                               preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction2];
            [self presentViewController:alert animated:YES completion:nil];
 
        }else if (indexPath.row == 1){
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"退出登录"                                                                       message:nil                                                              preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [[LoginController alloc] init];
            }];
            UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction1];
            [alert addAction:defaultAction2];
            [self presentViewController:alert animated:YES completion:nil];

        }
    }
}

@end
