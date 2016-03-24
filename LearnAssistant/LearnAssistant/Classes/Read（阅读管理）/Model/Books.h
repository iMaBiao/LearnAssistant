//
//  Books.h
//  LearnAssistant
//
//  Created by biao on 16/1/6.
//  Copyright © 2016年 biao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Books : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)bookWithDict:(NSDictionary *)dict;
@end
