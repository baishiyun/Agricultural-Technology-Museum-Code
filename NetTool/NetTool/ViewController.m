//
//  ViewController.m
//  NetTool
//
//  Created by Mac on 15/12/5.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import <HMSegmentedControl.h>
#import <MJRefresh.h>
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpdateUI];
    self.tabBarItem.title = @"首页";
    [self downLoadingData];
  
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"0"];
    
    self.bsy_TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.bsy_TableView reloadData];
        [self.bsy_TableView.mj_header endRefreshing];
    }];
    
    self.bsy_TableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self.bsy_TableView reloadData];
        [self.bsy_TableView.mj_footer endRefreshing];
    }];
}
-(void)downLoadingData
{
    [self.bsy_MutableArray removeAllObjects];
    NSString *url = [NSString stringWithFormat:API,@"classify"];
    [NetTool postRequestWithUrlString:url andparameters:nil anddictBlock:^(id DataDict) {
        for (NSDictionary *temp in DataDict[@"tngou"]) {
            [self.bsy_MutableArray addObject:temp];
        }
        [self.bsy_TableView reloadData];
    } View:self.view];


}

-(void)downLoadingNongData
{
    [self.bsy_MutableArray removeAllObjects];
    NSString *url = [NSString stringWithFormat:NAPI,@"classify"];
    [NetTool postRequestWithUrlString:url andparameters:nil anddictBlock:^(id DataDict) {
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
    
    HMSegmentedControl *segmentedControl1 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"农业技术", @"农业新闻"]];
    segmentedControl1.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    segmentedControl1.frame = CGRectMake(0,0, WithScreen, 44);
    segmentedControl1.segmentEdgeInset = UIEdgeInsetsMake(10, 50, 0, 50);
    segmentedControl1.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl1.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl1.verticalDividerEnabled = YES;
    segmentedControl1.verticalDividerWidth = 0.0f;
    segmentedControl1.selectionIndicatorHeight = 1.0;
    segmentedControl1.selectionIndicatorColor =[UIColor colorWithRed:85/255.0 green:145/255.0 blue:114/255.0 alpha:1.0];
    [segmentedControl1 setTitleFormatter:^NSAttributedString *(HMSegmentedControl *segmentedControl, NSString *title, NSUInteger index, BOOL selected) {
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title];
        return attString;
    }];
    [segmentedControl1 addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl1;
    


}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    
    if (segmentedControl.selectedSegmentIndex==0) {
        [self downLoadingData];
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"0"];

    }else{
        [self downLoadingNongData];
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"0"];

    }
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bsy_MutableArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassifyTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ClassifyTableViewCell" owner:nil options:nil] lastObject];
    cell.name.text = self.bsy_MutableArray[indexPath.row][@"name"];
    cell.miaoshu.text = self.bsy_MutableArray[indexPath.row][@"description"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
    HomeViewController *home = [[HomeViewController alloc]init];
    home.classID = self.bsy_MutableArray[indexPath.row][@"id"];
    home.name = self.bsy_MutableArray[indexPath.row][@"name"];
    [self.navigationController pushViewController:home animated:YES];

}


@end
