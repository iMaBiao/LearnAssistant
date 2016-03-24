//
//  LoginController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "LoginController.h"
#import "MbTabBarController.h"
#import "MBProgressHUD+MJ.h"
#import "RegisterController.h"
@interface LoginController ()
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.login.layer.cornerRadius = 3;
    self.login.layer.masksToBounds = YES;
    
}

- (IBAction)login:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name= [defaults objectForKey:@"account"];
    NSString *pwd = [defaults objectForKey:@"pwd"];
    if ([self.account.text isEqualToString:name]&& [self.password.text isEqualToString:pwd]) {
           [UIApplication sharedApplication].keyWindow.rootViewController = [[MbTabBarController alloc] init];
    }else if(self.account.text.length == 0 || self.password.text.length == 0){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"警告"                                                                       message:@"请输入完整的账号和密码"                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction1];
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"警告"                                                                       message:@"账号和密码错误"                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction1];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

- (IBAction)registerAccount:(id)sender {
    
//    [UIApplication sharedApplication].keyWindow.rootViewController = [[RegisterController alloc] init];
    RegisterController *registerVc = [[RegisterController alloc]init];
    [self presentViewController:registerVc animated:YES completion:^{
        
    }];
    
}


- (IBAction)qqLogin:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"打开应用QQ"                                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
        [MBProgressHUD showMessage:@"未安装QQ"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
    }];
    UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction1];
    [alert addAction:defaultAction2];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)sinaLogin:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"打开应用微博"                                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
    [MBProgressHUD showMessage:@"未安装微博"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
    }];
    UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction1];
    [alert addAction:defaultAction2];
    [self presentViewController:alert animated:YES completion:nil];

}
- (IBAction)wechatLogin:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"打开应用微信"                                                               preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
        [MBProgressHUD showMessage:@"未安装微信"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
    }];
    UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction1];
    [alert addAction:defaultAction2];
    [self presentViewController:alert animated:YES completion:nil];}


@end
