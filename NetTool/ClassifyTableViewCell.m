//
//  ClassifyTableViewCell.m
//  NetTool
//
//  Created by Mac on 15/12/15.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "ClassifyTableViewCell.h"

@implementation ClassifyTableViewCell

- (void)awakeFromNib {

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.miaoshu.numberOfLines = 0;
    self.miaoshu.lineBreakMode =NSLineBreakByWordWrapping;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
