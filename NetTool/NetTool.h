//
//  NetTool.h
//  NetTool
//
//  Created by Mac on 15/12/5.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <MBProgressHUD.h>
typedef void (^RequestDataBlock)(AFHTTPRequestOperation *opt,id responseObj);
typedef void(^failedDataBlock) (AFHTTPRequestOperation *operation, NSError *error);
typedef void(^dictBlock) (id DataDict);
@interface NetTool : NSObject
+(void)requestWithUrlString:(NSString *)urlString andRequestBlock:(RequestDataBlock)requset andFailedBlock:(failedDataBlock)faile ;

+(void)requestWithUrlString:(NSString *)urlString  andparameters:(id)parameters  anddictBlock:(dictBlock)dictBlock View:(id)view;


+(void)postRequestWithUrlString:(NSString *)urlString  andparameters:(id)parameters  anddictBlock:(dictBlock)dictBlock View:(id)view;

+(NSDictionary *)addResponseObject:(id)responseObject;
@end
