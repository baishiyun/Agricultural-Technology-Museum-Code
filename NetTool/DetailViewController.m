//
//  DetailViewController.m
//  NetTool
//
//  Created by Mac on 15/12/15.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "DetailViewController.h"
#import "Header.h"
#import <MJRefresh.h>
@interface DetailViewController ()
{
    MBProgressHUD *hud;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = 0;
    self.title = @"详情";
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WithScreen, HightScreen-64)];
    web.delegate  = self;
    [self.view addSubview:web];
    
    
    NSString *url;
    NSString *index = [[NSUserDefaults standardUserDefaults] objectForKey:@"0"];
    if ([index integerValue]==0) {
        url = [NSString stringWithFormat:API,@"show"];

    }else{
    
        url = [NSString stringWithFormat:NAPI,@"show"];

    }
    NSMutableDictionary *dict= [NSMutableDictionary dictionary];
    [dict setValue:self.classID forKey:@"id"];
    [NetTool postRequestWithUrlString:url andparameters:dict anddictBlock:^(id DataDict) {
    [web loadHTMLString:DataDict[@"message"] baseURL:nil];
   
    } View:self.view];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"iconfont-fanhui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    
    
    web.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetTool postRequestWithUrlString:url andparameters:dict anddictBlock:^(id DataDict) {
            [web loadHTMLString:DataDict[@"message"] baseURL:nil];
            
        } View:self.view];        [ web.scrollView.mj_header endRefreshing];
    }];
    
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{

   [hud hide:YES afterDelay:1.5];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"加载失败";
    [hud hide:YES afterDelay:0.5];

}
-(void)doBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
