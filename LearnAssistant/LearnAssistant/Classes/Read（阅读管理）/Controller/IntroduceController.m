//
//  IntroduceController.m
//  LearnAssistant
//
//  Created by biao on 16/1/6.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "IntroduceController.h"
#import "MBProgressHUD+MJ.h"
@interface IntroduceController ()
@property(nonatomic,strong)NSArray *books;

@property(nonatomic,weak)UILabel *bookName;
@end

@implementation IntroduceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];

    [self addBooks];
    
    self.title = @"推荐图书";
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
}
- (void)addBooks{
    int Columns = 3;
    
    CGFloat appH = 150;
    CGFloat appW = 100;
    
    CGFloat marginX = (self.view.frame.size.width - Columns * appW)/(Columns +1);
    CGFloat marginY = 30;
    
    for (int index = 0; index<self.books.count; index++) {
        
        UIView *appView = [[UIView alloc]init];
        //        appView.backgroundColor = [UIColor orangeColor];
        int row = index / Columns;
        int col = index % Columns;
        CGFloat appX = marginX + col *(marginX + appW);
        CGFloat appY = marginY + row * (marginY + appH);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        [self.view addSubview:appView];
        
        //添加小控件
        
        //添加图片
        NSDictionary *appInfo = self.books[index];
        UIImageView *iconImage = [[UIImageView alloc]init];
        CGFloat iconW = 80;
        CGFloat iconH = 100;
        CGFloat iconX = (appW - iconW)*0.5;
        CGFloat iconY = 0;
        iconImage.frame = CGRectMake(iconX, iconY, iconW, iconH);
        iconImage.image = [UIImage imageNamed:appInfo[@"icon"]];
        [appView addSubview:iconImage];
        
        //添加lable
        UILabel *nameLable = [[UILabel alloc]init];
        CGFloat nameW = appW;
        CGFloat nameH = 20;
        CGFloat nameX = 0;
        CGFloat nameY = iconY+iconH;
        nameLable.frame = CGRectMake(nameX, nameY, nameW, nameH);
        nameLable.text = appInfo[@"name"];
        nameLable.font = [UIFont systemFontOfSize:15];
        nameLable.textAlignment = NSTextAlignmentCenter;
//        self.bookName.text = nameLable.text;
        [appView addSubview:nameLable];
        
        //添加按钮
        UIButton *dowBtn = [[UIButton alloc]init];
        CGFloat dowX = 15;
        CGFloat dowY = nameY+nameH;
        CGFloat dowW = appW - 2*dowX;
        CGFloat dowH = 20;
        dowBtn.frame = CGRectMake(dowX, dowY, dowW, dowH);
        UIImage *normalImage = [UIImage imageNamed:@"buttongreen"];
        UIImage *highImage = [UIImage imageNamed:@"buttongreen_highlighted"];
        [dowBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
        [dowBtn setBackgroundImage:highImage forState:UIControlStateHighlighted];
        [dowBtn setTitle:@"下载" forState:UIControlStateNormal];
        dowBtn .titleLabel.font = [UIFont systemFontOfSize:13];
        [dowBtn addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
        dowBtn.tag = index;
        [appView addSubview:dowBtn];
        
    }
}
- (NSArray *)books
{
    if (_books == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"books2.plist" ofType:nil];
        
        // 2.加载数组
        _books = [NSArray arrayWithContentsOfFile:path];
    }
    return _books;
}

- (void)download:(UIButton *)button{
    [MBProgressHUD showMessage:@"正在下载"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        [button setTitle:@"已下载" forState:UIControlStateNormal];
    });
//    NSString *icon = [NSString stringWithFormat:@"%bookld",button.tag];
//    
//    NSDictionary *dic = @{@"icon":icon, @"name":,};
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"addBooks" object:nil userInfo:nil];
}

@end
