//
//  LikeController.m
//  LearnAssistant
//
//  Created by biao on 16/1/9.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "LikeController.h"

@interface LikeController ()

@end

@implementation LikeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = CGRectMake(0, 0, theWidth, theHeight);
    [self.view addSubview:webView];
    
    NSURL *url =[NSURL URLWithString:@"http://www.bookschina.com"];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


@end
