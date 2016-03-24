//
//  AdviceController.m
//  LearnAssistant
//
//  Created by biao on 16/1/9.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "AdviceController.h"
#import "PlanTextView.h"
@interface AdviceController ()<UITextViewDelegate>

@end

@implementation AdviceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitAdvice)];
    self.title = @"意见与反馈";
    [self addPlanTextView];
}

- (void)addPlanTextView{
    PlanTextView *planView = [[PlanTextView alloc]init];
    planView.frame = CGRectMake(0, 5, theWidth, theHeight);
    planView.placehoder = @"请输入您的宝贵意见及反馈。。。";
    planView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    planView.delegate = self;
    planView.scrollEnabled = YES;
    [self.view addSubview:planView];
    [planView becomeFirstResponder];
    
}

/**
 *  当textView的文字改变就会调用
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (void)submitAdvice{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"感谢"                                                                       message:@"感谢您的宝贵建议"                                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:defaultAction1];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
