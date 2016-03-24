//
//  MbNavController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MbNavController.h"

@interface MbNavController ()

@end

@implementation MbNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *appearance = [UINavigationBar appearance];
//    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
//    appearance.backgroundColor = [UIColor colorWithRed:0/255.0 green:100/255.0 blue:218/255.0 alpha:1.0];
    appearance.backgroundColor = [UIColor blueColor];

}

///**
// *  能拦截所有push进来的子控制器
// */
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
//        viewController.hidesBottomBarWhenPushed = YES;
//        
//    [super pushViewController:viewController animated:animated];
//    }
//}

@end
