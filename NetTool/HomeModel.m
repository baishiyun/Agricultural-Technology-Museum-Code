//
//  HomeModel.m
//  NetTool
//
//  Created by Mac on 15/12/16.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "HomeModel.h"
#import "Header.h"
@implementation HomeModel
-(id)initHomeModel:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.titleT = dict[@"title"];
        if (dict[@"img"]) {
            self.icon = [Icon stringByAppendingString:dict[@"img"]];
        }
        self.mioashuT = dict[@"description"];
    }
    return self;
}
+(id)HomeModel:(NSDictionary *)dict
{
    return [[HomeModel alloc]initHomeModel:dict];
}
@end
