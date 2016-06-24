//
//  HomeTableViewCell.h
//  NetTool
//
//  Created by Mac on 15/12/15.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeTableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *titleT;
@property (strong, nonatomic)  UILabel *mioashuT;
@property (nonatomic ,strong) HomeModel *model;
@end
