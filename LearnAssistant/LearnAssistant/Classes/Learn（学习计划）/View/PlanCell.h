//
//  PlanCell.h
//  LearnAssistant
//
//  Created by biao on 16/1/6.
//  Copyright © 2016年 biao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Plan;

@interface PlanCell : UITableViewCell
@property(nonatomic,strong)Plan *plan;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
