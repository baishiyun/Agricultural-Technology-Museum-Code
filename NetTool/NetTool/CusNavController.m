//
//  CusNavController.m
//  NetTool
//
//  Created by Mac on 15/12/6.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "CusNavController.h"
#import "ViewController.h"
@implementation CusNavController
-(void)viewDidLoad
{
    [super viewDidLoad];
  
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    self.navigationBar.barTintColor = [UIColor whiteColor];

}
@end
