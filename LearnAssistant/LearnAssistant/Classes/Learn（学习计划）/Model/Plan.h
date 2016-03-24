//
//  Plan.h
//  LearnAssistant
//
//  Created by biao on 16/1/5.
//  Copyright © 2016年 biao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plan : NSObject

@property(nonatomic,copy)NSString *planDate;
@property(nonatomic,copy)NSString *planContent;
@property(nonatomic,copy)NSString *planNum;
@property(nonatomic,copy)NSString *planCycle;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)planWithDict:(NSDictionary *)dict;
@end
