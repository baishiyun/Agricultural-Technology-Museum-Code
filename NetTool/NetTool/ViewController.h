//
//  ViewController.h
//  NetTool
//
//  Created by Mac on 15/12/5.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)UITableView *bsy_TableView;
@property (nonatomic ,strong)NSMutableArray *bsy_MutableArray;
@end

