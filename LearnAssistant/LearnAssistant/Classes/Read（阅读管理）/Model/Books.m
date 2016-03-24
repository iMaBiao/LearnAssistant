//
//  Books.m
//  LearnAssistant
//
//  Created by biao on 16/1/6.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "Books.h"

@implementation Books

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return  self;
}
+ (instancetype)bookWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
