//
//  Plan.m
//  LearnAssistant
//
//  Created by biao on 16/1/5.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "Plan.h"

@implementation Plan

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.planNum = dict[@"planNum"];
        self.planContent = dict[@"planContent"];
        self.planDate = dict[@"planDate"];
        self.planCycle = dict[@"planCycle"];
    }
    return  self;
}
+ (instancetype)planWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
