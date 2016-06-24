//
//  HomeViewController.h
//  NetTool
//
//  Created by Mac on 15/12/15.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)NSString *classID;
@property (nonatomic ,strong)NSString *name;
@property (nonatomic ,strong)UITableView *bsy_TableView;
@property (nonatomic ,strong)NSMutableArray *bsy_MutableArray;
@end
