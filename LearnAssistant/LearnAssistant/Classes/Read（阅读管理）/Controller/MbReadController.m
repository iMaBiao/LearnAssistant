//
//  MbReadController.m
//  LearnAssistant
//
//  Created by biao on 16/1/4.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "MbReadController.h"
#import "MBProgressHUD+MJ.h"
#import "IntroduceController.h"
#import "Books.h"
#import "bookCell.h"

#define  MbBooksID  @"books"

@interface MbReadController ()
@property(nonatomic,strong)NSMutableArray *books;

@end

@implementation MbReadController

-(NSMutableArray *)books{
    if (_books == nil) {
        NSArray *data = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"books1.plist" ofType:nil]];
        NSMutableArray *booksArray = [NSMutableArray array];
        for (NSDictionary *dict  in data) {
            Books *book = [Books bookWithDict:dict];
            [booksArray addObject:book];
        }
        _books = booksArray;
    }
    return _books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBooksTips)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"推荐图书" style:UIBarButtonItemStylePlain target:self action:@selector(introduce)];
    
    
    UINib *nib  = [UINib nibWithNibName:@"bookCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:MbBooksID];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //添加图书
//    [self addBooks];

//    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didAddBooks) name:@"addBooks" object:nil];
}
- (void)didAddBooks{
    Books *book = [[Books alloc]init];
    book.icon = @"book7";
    book.name = @"三体";
    
    [self.books addObject:book];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.books.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    bookCell *book = [collectionView dequeueReusableCellWithReuseIdentifier:MbBooksID forIndexPath:indexPath];
    book.books = self.books[indexPath.item];
    
    return book;
}

- (id)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat itemW = 100;
    CGFloat itemH = 150;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    return [super initWithCollectionViewLayout:layout];
}


//添加图书提示
- (void)addBooksTips{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"友情提示"
                                                                   message:@"添加图书？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
                                  [MBProgressHUD showMessage:@"正在查找本地图书..."];
                                                               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                   [MBProgressHUD hideHUD];
                                                                   [MBProgressHUD showMessage:@"未查找到图书"];
                                                                   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                      [MBProgressHUD hideHUD];
                                                                   });                                                                                                                                 });
                                                           }];
    
    [alert addAction:defaultAction1];
    [alert addAction:defaultAction2];
    [self presentViewController:alert animated:YES completion:nil];
}
//推荐
- (void)introduce{
    IntroduceController *vc = [[IntroduceController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (NSArray *)books
//{
//    if (_books == nil) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"books1.plist" ofType:nil];
//  
//        _books = [NSArray arrayWithContentsOfFile:path];
//    }
//    return _books;
//}
//- (void)addBooks{
//    int Columns = 3;
//    
//    CGFloat appH = 150;
//    CGFloat appW = 100;
//    
//    CGFloat marginX = (self.view.frame.size.width - Columns * appW)/(Columns +1) ;
//    CGFloat marginY = 30;
//    
//    for (int index = 0; index<self.books.count; index++) {
//        
//        UIView *appView = [[UIView alloc]init];
//        int row = index / Columns;
//        int col = index % Columns;
//        CGFloat appX = marginX + col *(marginX + appW);
//        CGFloat appY = marginY + row * (marginY + appH);
//        appView.frame = CGRectMake(appX, appY, appW, appH);
//        
//        [self.view addSubview:appView];
//        //添加小控件
//        
//        //添加图片
//        NSDictionary *appInfo = self.books[index];
//        UIImageView *iconImage = [[UIImageView alloc]init];
//        CGFloat iconW = 60;
//        CGFloat iconH = 100;
//        CGFloat iconX = (appW - iconW)*0.5;
//        CGFloat iconY = 0;
//        iconImage.frame = CGRectMake(iconX, iconY, iconW, iconH);
//        iconImage.image = [UIImage imageNamed:appInfo[@"icon"]];
//        [appView addSubview:iconImage];
//        
//        //添加lable
//        UILabel *nameLable = [[UILabel alloc]init];
//        CGFloat nameW = appW;
//        CGFloat nameH = 30;
//        CGFloat nameX = 0;
//        CGFloat nameY = iconY+iconH;
//        nameLable.frame = CGRectMake(nameX, nameY, nameW, nameH);
//        nameLable.text = appInfo[@"name"];
//        nameLable.font = [UIFont systemFontOfSize:15];
//        nameLable.textAlignment = NSTextAlignmentCenter;
//        [appView addSubview:nameLable];
//        
//    }
//
//}



@end
