//
//  HomeViewController.m
//  NetTool
//
//  Created by Mac on 15/12/15.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "HomeViewController.h"
#import "Header.h"
#import <MJRefresh.h>
@interface HomeViewController ()
@property (nonatomic ,assign) int index;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.name;
    self.index = 1;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"iconfont-fanhui"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self setUpdateUI];
    [self downLoadingData:self.index];
    self.bsy_TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.bsy_TableView reloadData];
        [self.bsy_TableView.mj_header endRefreshing];
    }];
    self.bsy_TableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        self.index++;
        NSLog(@"   %d",self.index);
        [self downLoadingData:self.index];
        [self.bsy_TableView.mj_footer endRefreshing];
    }];

}

-(void)downLoadingData:(int)page
{
    NSString *index = [[NSUserDefaults standardUserDefaults] objectForKey:@"0"];
    NSString *url;
    if ([index integerValue]==0) {
        url = [NSString stringWithFormat:API,@"list"];
    }else{
    url = [NSString stringWithFormat:NAPI,@"list"];
    }
    NSMutableDictionary *dict  =[NSMutableDictionary dictionary];
    [dict setValue:self.classID forKey:@"id"];
    [dict setValue:[NSString stringWithFormat:@"%d",page] forKey:@"page"];
    [dict setValue:@"20" forKey:@"rows"];
    
    [NetTool postRequestWithUrlString:url andparameters:dict anddictBlock:^(id DataDict) {
        
        for (NSDictionary *temp in DataDict[@"tngou"]) {
            [self.bsy_MutableArray addObject:temp];
        }
        [self.bsy_TableView reloadData];
        
    } View:self.view];

}
-(void)setUpdateUI
{
    self.bsy_TableView  =[[UITableView alloc]initWithFrame:CGRectMake(0, 0,WithScreen,HightScreen) style:UITableViewStylePlain];
    self.bsy_TableView.dataSource = self;
    self.bsy_TableView.delegate = self;
    [self.view addSubview:self.bsy_TableView];
    self.bsy_TableView.tableFooterView = [[UIView alloc]init];
    
    
}
-(void)doBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bsy_MutableArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = [HomeModel HomeModel:self.bsy_MutableArray[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 330;
}
-(NSMutableArray *)bsy_MutableArray

{
    if (!_bsy_MutableArray) {
        _bsy_MutableArray = [NSMutableArray array];
    }
    return _bsy_MutableArray;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    DetailViewController *web = [[DetailViewController alloc]init];
    web.classID = self.bsy_MutableArray[indexPath.row][@"id"];
    [self.navigationController pushViewController:web animated:YES];
}

@end
