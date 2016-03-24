//
//  MbTabBarController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MbTabBarController.h"
#import "MbEnglishController.h"
#import "MbLearnController.h"
#import "MbPersonalController.h"
#import "MbReadController.h"
#import "MbNavController.h"
@interface MbTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, weak) UIViewController *lastSelectedViewContoller;

@property (nonatomic, weak) MbLearnController *learn;
@property (nonatomic, weak)MbEnglishController *english;
@property (nonatomic, weak) MbReadController *read;
@property (nonatomic,weak) MbPersonalController *personal;

@end

@implementation MbTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    // 添加所有的子控制器
    [self addAllChildVcs];
    
    [self addCustomTabBar];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_background"];
}

- (void)addAllChildVcs{
    //添加子控制器
    MbLearnController *learn = [[MbLearnController alloc] init];
    [self addOneChlildVc:learn title:@"学习计划" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.learn = learn;
    self.lastSelectedViewContoller = learn;
    
    MbEnglishController *english = [[MbEnglishController alloc] init];
    [self addOneChlildVc:english title:@"英语学习" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    self.english = english;
    
    MbReadController *read = [[MbReadController alloc] init];
    [self addOneChlildVc:read title:@"阅读管理" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    self.read = read;
    
    MbPersonalController *personal = [[MbPersonalController alloc] init];
    [self addOneChlildVc:personal title:@"个人信息" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    self.personal = personal;
    
}

- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName ];
    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    MbNavController *nav = [[MbNavController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


- (void)addCustomTabBar{
    
}


//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController
//{
//    UIViewController *vc = [viewController.viewControllers firstObject];
//    if ([vc isKindOfClass:[MbLearnController class]]) {
//     
//    }
//    
//    self.lastSelectedViewContoller = vc;
//}
@end
