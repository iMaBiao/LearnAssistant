//
//  SearchTool.h
//  LearnAssistant
//
//  Created by biao on 16/1/5.
//  Copyright © 2016年 biao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Search;

@interface SearchTool : NSObject

/**
 *  保存一个联系人
 */
+ (void)save:(Search *)search;

/**
 *  查询所有的联系人
 */
+ (NSArray *)query;
+ (NSArray *)queryWithCondition:(NSString *)condition;

@end
