//
//  AddPlanController.m
//  LearnAssistant
//
//  Created by biao on 16/1/7.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "AddPlanController.h"
#import "PlanTextView.h"

@interface AddPlanController ()<UITextViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *planTime;
@property (weak, nonatomic) IBOutlet UIButton *sure;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *monthPlan;
@property (weak, nonatomic) IBOutlet UIButton *weekPlan;
@property (weak, nonatomic) IBOutlet UIButton *dayPlan;

@property(nonatomic,weak)PlanTextView *planView;
@end

@implementation AddPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置时间
    [self setupPlanTime];
    
    [self setButton:self.monthPlan];
    [self setButton:self.weekPlan];
    [self setButton:self.dayPlan];
    [self addPlanTextView];
    
}
- (void)addPlanTextView{
    PlanTextView *planView = [[PlanTextView alloc]init];
    planView.frame = CGRectMake(0, 80, theWidth, theHeight/3);
    planView.placehoder = @"请输入你的学习计划。。。";
    planView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    planView.delegate = self;
//    planView.scrollEnabled = YES;
    self.planView = planView;
    [self.view addSubview:planView];
    
    self.sure.backgroundColor = [UIColor colorWithRed:34/255.0 green:168/255.0 blue:210/255.0 alpha:1.0];
    self.cancel.backgroundColor = [UIColor colorWithRed:34/255.0 green:168/255.0 blue:210/255.0 alpha:1.0];
    self.sure.layer.cornerRadius = 3;
    self.sure.layer.masksToBounds = YES;
    self.cancel.layer.cornerRadius = 3;
    self.cancel.layer.masksToBounds = YES;
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    [self.view endEditing:YES];
//}

- (void)setButton:(UIButton *)button{
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    button.selected = NO;
    [button setAdjustsImageWhenHighlighted:NO];
}

- (void)setupPlanTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *currentDate = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:currentDate];
    self.planTime.textColor = [UIColor darkGrayColor];
    self.planTime.text = dateStr;
}
- (IBAction)sureAdd:(id)sender {
    NSString *planNum = @"4";
    NSString *planCycle;
    if ([self.monthPlan isSelected]) {
        planCycle = @"1";
    }else if ([self.weekPlan isSelected]){
        planCycle = @"2";
    }else if([self.dayPlan isSelected]){
        planCycle = @"3";
    }
    NSString *planDate = [NSString stringWithFormat:@"%@",self.planTime.text];
    NSString *planContent = [NSString stringWithFormat:@"%@",self.planView.text];
    
    if (self.planView.text.length == 0) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                       message:@"请你输入学习计划"                                                             preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault                                                               handler:^(UIAlertAction * action) {
            
        }];
        [alert addAction:defaultAction2];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if(self.planView.text.length != 0){
        NSDictionary *dic = @{@"planNum":planNum, @"planCycle":planCycle,@"planDate":planDate,@"planContent":planContent };
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"addPlanName" object:nil userInfo:dic];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }

   
}
- (IBAction)cancelPlan:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)selectMonthPlan:(UIButton *)sender {
    [self.view endEditing:YES];
    if (sender.selected) {
        sender.selected = NO;
    }else {
    sender.selected = YES;
    }
}
- (IBAction)selectWeekPlan:(UIButton *)sender {
    [self.view endEditing:YES];
    if (sender.selected) {
        sender.selected = NO;
    }else {
        sender.selected = YES;
    }
}
- (IBAction)selectDayPlan:(UIButton *)sender {
    [self.view endEditing:YES];
    if (sender.selected) {
        sender.selected = NO;
    }else {
        sender.selected = YES;
    }
}



@end
