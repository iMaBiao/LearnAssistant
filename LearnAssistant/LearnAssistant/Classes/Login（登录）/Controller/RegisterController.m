//
//  RegisterController.m
//  LearnAssistant
//
//  Created by biao on 16/1/7.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "RegisterController.h"
#import "MbTabBarController.h"
@interface RegisterController ()
@property (weak, nonatomic) IBOutlet UIButton *zhuce;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pwd1;
@property (weak, nonatomic) IBOutlet UITextField *pwd2;



@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.zhuce.layer.cornerRadius = 3;
    self.zhuce.layer.masksToBounds = YES;
}

- (IBAction)zhuce:(id)sender {
    [self.view endEditing:YES];
    if ([self.pwd1.text isEqualToString:self.pwd2.text]) {
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:self.account.text forKey:@"account"];
        [defaults setObject:self.pwd1.text forKey:@"pwd"];
        [defaults synchronize];
        
         [UIApplication sharedApplication].keyWindow.rootViewController = [[MbTabBarController alloc] init];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"警告"                                                                       message:@"两次密码输入不相同"                                                               preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"重新输入" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
            self.pwd1.text = nil;
            self.pwd2.text = nil;
        }];
        
        [alert addAction:defaultAction1];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

@end
