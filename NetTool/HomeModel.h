//
//  HomeModel.h
//  NetTool
//
//  Created by Mac on 15/12/16.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *titleT;
@property (strong, nonatomic) NSString *mioashuT;
-(id)initHomeModel:(NSDictionary *)dict;
+(id)HomeModel:(NSDictionary *)dict;
@end
