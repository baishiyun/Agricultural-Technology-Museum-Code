//
//  HomeTableViewCell.m
//  NetTool
//
//  Created by Mac on 15/12/15.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Header.h"
@implementation HomeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, WithScreen-20, 255)];
        [self.contentView addSubview:self.icon];
        
        
        self.titleT = [[UILabel alloc]initWithFrame:CGRectMake(0, 225, WithScreen-20, 30)];
        self.titleT.font = [UIFont systemFontOfSize:12];
        self.titleT.textColor = [UIColor whiteColor];
        self.titleT.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:.5];
        self.titleT.textAlignment = NSTextAlignmentCenter;
        [self.icon addSubview:self.titleT];
        
        
        
        self.mioashuT = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.icon.frame)+5,  WithScreen-20, 60)];
        self.mioashuT.numberOfLines = 3;
        self.mioashuT.lineBreakMode = NSLineBreakByWordWrapping;
        self.mioashuT.textColor = [UIColor lightGrayColor];
        self.mioashuT.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:self.mioashuT];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        if (HightScreen>568) {
//            self.mioashuT.numberOfLines = 2;
//            
//        }else{
//            self.mioashuT.numberOfLines = 4;
//            
//        }
//        self.mioashuT.lineBreakMode = NSLineBreakByWordWrapping;

    }
    return self;
}

-(void)setModel:(HomeModel *)model
{
    _model = model;
    self.titleT.text =model.titleT;
    self.mioashuT.text = model.mioashuT;
    [self.icon setImageWithURL:[NSURL URLWithString:model.icon]];
}
- (void)awakeFromNib {
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
