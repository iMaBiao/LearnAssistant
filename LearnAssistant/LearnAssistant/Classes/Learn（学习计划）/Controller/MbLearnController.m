//
//  MbLearnController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MbLearnController.h"
#import "PlanCell.h"
#import "Plan.h"
#import "AddPlanController.h"
#define planColor [UIColor colorWithRed:34/255.0 green:161/255.0 blue:218/255.0 alpha:1.0]

@interface MbLearnController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UIView *addPlanView;
@property(nonatomic,weak)UITableView *planView;

@property(nonatomic,strong)NSMutableArray *planList;

@end

@implementation MbLearnController

- (NSMutableArray *)planList{
    if (_planList == nil) {
        
//        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//        NSString *path=[paths objectAtIndex:0];
//        NSLog(@"path = %@",path);
//        NSString *filename=[path stringByAppendingPathComponent:@"plan.plist"];
//        NSMutableArray* dataArray = [NSMutableArray arrayWithContentsOfFile:filename];
//        NSLog(@"dataArray = %@",dataArray);
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"plan" ofType:@"plist"];
        NSMutableArray *dataArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];

        NSMutableArray *planArray = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            Plan *plan  = [Plan planWithDict:dict];
            [planArray addObject:plan];
        }
        _planList = planArray;
    }
    NSLog(@"plist = %@",_planList);
    return _planList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加学习计划View
    UIView *addPlan = [[UIView alloc]initWithFrame:CGRectMake(0, 0, theWidth, theHeight *0.3)];
    addPlan.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.addPlanView = addPlan;
    [self.view addSubview:addPlan];
    [self addPlanAndChangePlan];
   
    //添加计划列表
    UITableView *planView = [[UITableView alloc]initWithFrame:CGRectMake(0, addPlan.frame.origin.y+ addPlan.frame.size.height, theWidth, theHeight - addPlan.frame.size.height)];
    planView.showsVerticalScrollIndicator = NO;
    planView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.planView = planView;
    [self.view addSubview:planView];
    self.planView.delegate = self;
    self.planView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didAddPlan:) name:@"addPlanName" object:nil];
}
- (void)didAddPlan:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
//    NSLog(@"dic= %@",dic);
    
    Plan *plan = [[Plan alloc]init];
    plan.planNum = dic[@"planNum"];
    plan.planDate = dic[@"planDate"];
    plan.planCycle = dic[@"planCycle"];
    plan.planContent = dic[@"planContent"];
    [self.planList addObject:plan];
    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSLog(@"path = %@",path);
    NSString *filename=[path stringByAppendingPathComponent:@"plan.plist"];
    NSMutableArray* dataArray = [NSMutableArray arrayWithContentsOfFile:filename];
    [dataArray addObject:dic];
    
    [dataArray writeToFile:filename atomically:YES];
//    NSLog(@"dic2 = %@",dataArray);
    [self.planView reloadData];
//    NSLog(@"%ld",self.planList.count);
}
- (void)viewWillAppear:(BOOL)animated{
     [self.planView reloadData];
}
//添加按钮
- (void)addPlanAndChangePlan{
    
    UIButton *addPlanBtn = [[UIButton alloc]init];
    CGFloat addPlanBtnW = 200;
    addPlanBtn.frame = CGRectMake((theWidth - addPlanBtnW)/2, 100, 200, 80);
    [addPlanBtn setTitle:@"添加计划" forState:UIControlStateNormal];
    addPlanBtn.layer.cornerRadius = 3;
    addPlanBtn.layer.masksToBounds = YES;
    [addPlanBtn addTarget:self action:@selector(addPlans) forControlEvents:UIControlEventTouchUpInside];
    addPlanBtn.backgroundColor = [UIColor colorWithRed:190/255.0 green:190/255.0 blue:255/255.0 alpha:1.0];;
    [self.addPlanView addSubview:addPlanBtn];
    
//    UIButton *changePlanBtn = [[UIButton alloc]init];
//    changePlanBtn.frame = CGRectMake(220, 100, 100, 80);
////    changePlanBtn.backgroundColor = [UIColor redColor];
//    changePlanBtn.layer.cornerRadius = 3;
//    changePlanBtn.layer.masksToBounds = YES;
//    [changePlanBtn addTarget:self  action:@selector(changePlans) forControlEvents:UIControlEventTouchUpInside];
//    changePlanBtn.backgroundColor = [UIColor colorWithRed:190/255.0 green:190/255.0 blue:255/255.0 alpha:1.0];;
//    [changePlanBtn setTitle:@"修改计划" forState:UIControlStateNormal];
//    [self.addPlanView addSubview:changePlanBtn];
}

- (void)addPlans{
    AddPlanController *addPlansVc = [[AddPlanController alloc]init];
    [self presentViewController:addPlansVc animated:YES completion:^{
        
    }];
    
}
- (void)changePlans{
    NSLog(@"-----changePlans-------");
}

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
