//
//  MbPersonalController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MbPersonalController.h"
#import "LoginController.h"
#import "MyAccount_VC.h"
#import "More_VC.h"
#import "MsgCenter_VC.h"
#import "MsgSetting_VC.h"

#import "MyPlanController.h"
#import "AdviceController.h"
#import "LikeController.h"
@interface MbPersonalController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,copy)UITableView *tableView;
@property(nonatomic,copy)UIButton *portraitButton;//头像按钮
@end

@implementation MbPersonalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, theWidth, theHeight) style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.rowHeight = 44;
    [self.view addSubview:_tableView];
    
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 150)];
    headImageView.image = [UIImage imageNamed:@"jshop_banner_default"];
    headImageView.userInteractionEnabled = YES;
    
    _tableView.tableHeaderView = headImageView;
    
    _portraitButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 70, 70)];
    _portraitButton.layer.masksToBounds  = YES;//遮盖位于它之下的 layer
    _portraitButton.layer.cornerRadius = _portraitButton.bounds.size.width*0.5;//设置 layer 的圆角，是自身宽度的一半
    _portraitButton.layer.borderWidth = 1;//设置边宽的宽度
    _portraitButton.layer.borderColor = [UIColor redColor].CGColor;//设置边宽的颜色
    
    UIImage *image = [UIImage imageNamed:@"my_head_default"];
    [_portraitButton setImage:image forState:UIControlStateNormal];
    
    [_portraitButton addTarget:self action:@selector(sheetAction:) forControlEvents:UIControlEventTouchUpInside];
    [headImageView addSubview:_portraitButton];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, 150, 30)];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name= [defaults objectForKey:@"account"];
    nameLabel.text = name;
    nameLabel.font = [UIFont fontWithName:@"Heiti SC" size:15];
    nameLabel.textColor = [UIColor whiteColor];
    [headImageView addSubview:nameLabel];
    
    UIButton *levelButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 55, 75, 15)];
    [levelButton setTitle:@"新用户" forState:UIControlStateNormal];
    [levelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [levelButton addTarget:self action:@selector(testLoginAction) forControlEvents:UIControlEventTouchUpInside];
    levelButton.font = [UIFont fontWithName:@"Heiti SC" size:13];
    [headImageView addSubview:levelButton];
    
    UIButton *addressButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 70, 130, 15)];
    [addressButton setTitle:@"查看信息 >" forState:UIControlStateNormal];
    [addressButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addressButton.font = [UIFont fontWithName:@"Heiti SC" size:13];
    [addressButton addTarget:self action:@selector(myAccountAction) forControlEvents:UIControlEventTouchUpInside];
    [headImageView addSubview:addressButton];
    
    self.navigationItem.title = @"个人信息";
    
    UIButton *myMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myMoreBtn.frame = CGRectMake(0, 0, 30, 30);
    [myMoreBtn setImage:[UIImage imageNamed:@"my_more_btn_n"] forState:UIControlStateNormal];
    [myMoreBtn addTarget:self action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:myMoreBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *myMsgCenterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myMsgCenterBtn.frame = CGRectMake(0, 0, 30, 30);
    [myMsgCenterBtn setImage:[UIImage imageNamed:@"my_message_btn_n"] forState:UIControlStateNormal];
    [myMsgCenterBtn addTarget:self action:@selector(msgSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:myMsgCenterBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)testLoginAction
{
    LoginController *loginVC = [[LoginController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)myAccountAction
{
    MyAccount_VC *myAccountVC = [[MyAccount_VC alloc] init];
    [self.navigationController pushViewController:myAccountVC animated:YES];
}

- (void)moreAction
{
    More_VC *moreVC = [[More_VC alloc] init];
    [self.navigationController pushViewController:moreVC animated:YES];
}

- (void)msgSetting
{
    MsgCenter_VC *msgCenterVC = [[MsgCenter_VC alloc] init];
    [self.navigationController pushViewController:msgCenterVC animated:YES];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NSArray *array = @[@"1",@"1",@"1",@"1"];
    NSInteger i = [array[section] integerValue];
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIndentifier = @"myCell";
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (tableCell == nil) {
        //        UITableViewCellStyleValue1 图片-文字-副标题风格
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndentifier];
        tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//后面的小箭头风格
    }
    tableCell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    NSArray *array = @[@"我的计划",@"我的钱包"];
    NSArray *arry2 = @[@"服务与反馈"];

    NSArray *imageArray1 = @[@"my_order_icon",@"my_wallet_icon"];
    NSArray *imageArray2 = @[@"my_service_icon",@"my_privilege_icon"];
    //    tableCell.imageView.image = [UIImage imageNamed:imageArray1[indexPath.section]];
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                tableCell.textLabel.text = array[indexPath.section];
                tableCell.imageView.image = [UIImage imageNamed:imageArray1[indexPath.section]];
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                tableCell.textLabel.text = array[indexPath.section];
                tableCell.imageView.image = [UIImage imageNamed:imageArray1[indexPath.section]];
            }
            break;
        case 2:
            tableCell.textLabel.text = arry2[indexPath.row];
            tableCell.imageView.image = [UIImage imageNamed:imageArray2[indexPath.row]];
            break;
        case 3:
            tableCell.textLabel.text = @"猜你喜欢";
            tableCell.imageView.image = [UIImage imageNamed:@"my_guess_icon"];
            break;
        default:
            break;
    }
    
    
    if ([tableCell.textLabel.text isEqualToString:@"我的计划"]) {
        tableCell.detailTextLabel.text = @"查看全部计划";
    }
    else if ([tableCell.textLabel.text isEqualToString:@"我的钱包"])
    {
        tableCell.detailTextLabel.text = @"小金库";
    }
    else if ([tableCell.textLabel.text isEqualToString:@"意见与反馈"])
    {
        tableCell.detailTextLabel.text = @"意见反馈搬这儿了";
    }

    tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return tableCell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
    return 4;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    if (section == 0) {
        return 10;
    }
    else
    {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    //    return 60;
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    if (section == 2) {
        return nil;
    }
    else
    {
        UIView *view = [[UIView alloc] init];
        
        for (int i = 1; i<=3; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor greenColor];
            button.frame = CGRectMake(0, 180, theWidth/4, 36);
        }
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
        //        [button setFrame:CGRectMake_button];
        [view addSubview:button];
        return view;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
               //计划
//                MyPlanController
                [self.navigationController pushViewController:[[MyPlanController alloc]init] animated:YES];
            }
            break;
        case 1:
            if (indexPath.row == 0) {
               //钱包
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"仅支持网银支付，请前往个人网银中心"                                                               preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
                UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction1];
                [alert addAction:defaultAction2];
                [self presentViewController:alert animated:YES completion:nil];

            }
            break;
        case 2:
            if (indexPath.row == 0) {
                //服务与反馈
                [self.navigationController pushViewController:[[AdviceController alloc]init] animated:YES];
            }
            break;
        case 3:{
            //猜你喜欢
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[[LikeController alloc]init] animated:YES];
            }
        }
        default:
            break;
    }
    
}

//更新头像
- (void)sheetAction:(UIButton *)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"摄像头",@"相册", nil];
    [sheet showInView:self.view];
    
}

- (void)alertAction
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"模拟器" message:@"模拟器没有摄像头哦" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    UIImagePickerController *imagePickerCtr = [[UIImagePickerController alloc] init];
    
    if (buttonIndex == 0) {
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            NSLog(@"不支持摄像头");
            [self alertAction];
            return;
        }
        imagePickerCtr.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else if(buttonIndex == 1)
    {
        imagePickerCtr.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePickerCtr.delegate = self;
    imagePickerCtr.allowsEditing = YES;
    [self presentViewController:imagePickerCtr animated:YES completion:^{
        
    }];
    
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    UIImage *theImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [_portraitButton setImage:theImage forState:UIControlStateNormal];//给 button 设置图片
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
