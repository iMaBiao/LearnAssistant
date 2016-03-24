//
//  MbEnglishController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MbEnglishController.h"
#import "HMSearchBar.h"
#import "Search.h"
#import "SearchTool.h"
@interface MbEnglishController ()<UISearchBarDelegate,UISearchBarDelegate>
@property(nonatomic,weak)UISearchBar *searchBar;
@property(nonatomic,strong)NSArray *words;

@property(nonatomic,weak)UILabel *word;
@property(nonatomic,weak)UILabel *explain;
@end

@implementation MbEnglishController

- (NSArray *)words
{
    if (_words == nil) {
//        self.words = [SearchTool query];
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"words.plist" ofType:nil]];
    }
    return _words;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 搜索框
//    HMSearchBar *searchBar = [HMSearchBar searchBar];
//    
//    searchBar.width = 300;
//    searchBar.height = 30;
//    self.navigationItem.titleView = searchBar;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(0, 0, 300, 44);
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    self.searchBar = searchBar;
    self.searchBar.delegate = self;
    
    UILabel *world = [[UILabel alloc]init];
    world.textColor = [UIColor blackColor];
    world.font =  [UIFont systemFontOfSize:30];
    world.textAlignment = NSTextAlignmentCenter;
    world.frame = CGRectMake(0, 100, theWidth, 50);
    self.word = world;
    [self.view addSubview:world];
    world.hidden = YES;
    world.text = @"English";
    
    UILabel *explanin = [[UILabel alloc]init];
    explanin.textColor =[UIColor blackColor];
    explanin.font = [UIFont systemFontOfSize:20];
    explanin.textAlignment = NSTextAlignmentCenter;
    explanin.frame = CGRectMake(0, 150, theWidth, 50);
    self.explain = explanin;
    [self.view addSubview:explanin];
    explanin.hidden = YES;
    self.explain.text = @"n. 英语; adj. 英国的 ";
    
    
    UILabel *dayLabel = [[UILabel alloc]init];
    dayLabel.text = @"每日一句";
    dayLabel.textColor = [UIColor grayColor];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.font = [UIFont systemFontOfSize:25];
    dayLabel.frame = CGRectMake(0, 250, theWidth, 50);
    [self.view addSubview:dayLabel];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"everyday"];
    imageView.frame = CGRectMake(10, 300, theWidth - 20, 280);
    [self.view addSubview:imageView];
    
    //添加查询数据
    [self addWordData];

}

//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    // 根据查询条件搜索联系人信息
//    self.words  = [SearchTool queryWithCondition:searchText];
//    
//    self.word = [self.words firstObject];
//    // 刷新表格
////    [self.tableView reloadData];
//    [self.view setNeedsDisplay];
//}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    UIButton *cover = [[UIButton alloc]init];
    cover.frame = CGRectMake(0,0, theWidth, theHeight);
    cover.backgroundColor = [UIColor whiteColor];
    cover.alpha = 0.2;
    [cover addTarget:self action:@selector(removeCover:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cover];
    return YES;
}

- (void)addWordData{
    
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{

    self.word.hidden = NO;
    self.explain.hidden = NO;
}
- (void)removeCover:(UIButton *)cover{
    
//    [self.view endEditing:YES];
    [self.searchBar resignFirstResponder];
    [cover removeFromSuperview];
}
@end
