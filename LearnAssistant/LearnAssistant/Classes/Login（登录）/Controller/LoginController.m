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


//首先被启动的应用需要向iPhone注册一个自定义URL协议。这是在你的项目文件夹的info.plist文件进行的（就是你改变应用程序图标的同一个文件）。
//Step1.选择“URL types”
//Step3. 打开“Item 0″,然后为该key增加一个URL identifier。可以是任何值，但建议用“反域名”(例如 “com.fcplayer.testHello”)。
//Step4. 在“Item 0”下再加一行。
//Step5. 选择“URL Schemes” 作为Key。
//Step6. 输入你的URL协议名 (例如“testHello://” 应写做“testHello”)。如果有必要，你可以在这里加入多个协议。

- (IBAction)qqLogin:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"打开应用QQ"                                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
        UIApplication *app = [UIApplication sharedApplication];
        //打开系统的设置页
//        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        NSURL *url = [NSURL URLWithString:@"mabiao://com.mabiaoRefresh.test"];
        if ([app canOpenURL:url]) {
            [app openURL:url];
        }
        else{
            [MBProgressHUD showMessage:@"未安装QQ"];
        }
        
        

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
