//
//  MyAccount_VC.m
//  京东
//
//  Created by midmirror on 15/10/12.
//  Copyright (c) 2015年 midmirror. All rights reserved.
//

#import "MyAccount_VC.h"

@interface MyAccount_VC ()

@end

@implementation MyAccount_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITableView *theTableView = [[UITableView alloc] initWithFrame:self.tableView.bounds style:UITableViewStyleGrouped];
//    self.tableView = theTableView;
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
        return 5;
    }
    else
    {
        return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Iden = @"theCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Iden];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSArray *titleArray = @[@"头像",@"用户名",@"昵称",@"性别",@"出生日期"];
    NSArray *titleArray2 = @[@"地址管理",@"账户安全"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name= [defaults objectForKey:@"account"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *currentDate = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:currentDate];
    NSArray *detailArray = @[@"",name,@"MIDMIRROR",@"男",dateStr];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = titleArray[indexPath.row];
        cell.detailTextLabel.text = detailArray[indexPath.row];
        if (indexPath.row == 0) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_head_default"]];
        }
    }
    else
    {
        cell.textLabel.text = titleArray2[indexPath.row];
        if (indexPath.row == 1) {
            cell.detailTextLabel.text = @"可修改密码";
        }
    }
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 80;
        }
        else
        {
            return 44;
        }
    }
    else
    {
        return 44;
    }
}

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        }
    }
}
@end
