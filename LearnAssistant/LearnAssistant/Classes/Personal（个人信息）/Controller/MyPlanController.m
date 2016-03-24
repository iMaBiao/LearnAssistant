//
//  MyPlanController.m
//  LearnAssistant
//
//  Created by biao on 16/1/9.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MyPlanController.h"
#import "Plan.h"
#import "PlanCell.h"
@interface MyPlanController ()
@property(nonatomic,strong)NSMutableArray *planList;
@end

@implementation MyPlanController

- (NSMutableArray *)planList{
    if (_planList == nil) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"plan" ofType:@"plist"];
        NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
        NSMutableArray *planArray = [NSMutableArray array];
        for (NSDictionary *dict in data) {
            Plan *plan  = [Plan planWithDict:dict];
            [planArray addObject:plan];
        }
        _planList = planArray;
    }
    return _planList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学习计划";
//    Plan *plan = [[Plan alloc]init];
//    plan.planNum = dic[@"planNum"];
//    plan.planDate = dic[@"planDate"];
//    plan.planCycle = dic[@"planCycle"];
//    plan.planContent = dic[@"planContent"];
//    [self.planList addObject:plan];
//    
//    [self.planView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.planList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PlanCell *cell = [PlanCell cellWithTableView:tableView];
    cell.plan = self.planList[indexPath.row];
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}



@end
