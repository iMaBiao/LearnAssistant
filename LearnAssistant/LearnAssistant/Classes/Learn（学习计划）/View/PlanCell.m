//
//  PlanCell.m
//  LearnAssistant
//
//  Created by biao on 16/1/6.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "PlanCell.h"
#import "Plan.h"
@interface PlanCell()

@property (weak, nonatomic) IBOutlet UILabel *planNum;
@property (weak, nonatomic) IBOutlet UILabel *planContent;
@property (weak, nonatomic) IBOutlet UILabel *planDate;
@property (weak, nonatomic) IBOutlet UILabel *planCycle;

@end

@implementation PlanCell

- (void)awakeFromNib {
    // Initialization code
    self.planNum.backgroundColor = [UIColor colorWithRed:209/255.0 green:209/255.0 blue:255/255.0 alpha:1.0];;
    self.planNum.layer.cornerRadius = self.planNum.frame.size.width * 0.5;
    self.planNum.layer.masksToBounds = YES;
    
    self.planContent.numberOfLines = 0;
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"plan";
    // 1.取缓存中取
    PlanCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建cell
    if (cell == nil) {
        // 如果找不到就从xib中创建cell
        cell =  [[[NSBundle mainBundle] loadNibNamed:@"PlanCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setPlan:(Plan *)plan{
    _plan = plan;
    self.planNum.text = plan.planNum;
    self.planContent.text = plan.planContent;
    self.planDate.text = plan.planDate;
    
    if ([plan.planCycle intValue] == 1) {
        self.planCycle.text = @"月计划";
        self.planCycle.textColor = [UIColor colorWithRed:220/255.0 green:200/255.0 blue:80/255.0 alpha:1.0];
    }else if ([plan.planCycle intValue] == 2){
        self.planCycle.text = @"周计划";
        self.planCycle.textColor = [UIColor orangeColor];
    }else if ([plan.planCycle intValue] == 3){
        self.planCycle.text = @"日计划";
        self.planCycle.textColor = [UIColor redColor];
    }
}

@end
