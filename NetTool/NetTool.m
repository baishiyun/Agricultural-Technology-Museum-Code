//
//  NetTool.m
//  NetTool
//
//  Created by Mac on 15/12/5.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "NetTool.h"

@implementation NetTool
+(void)requestWithUrlString:(NSString *)urlString andRequestBlock:(RequestDataBlock)requset andFailedBlock:(failedDataBlock)faile
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    [manger.requestSerializer setValue:@"application/rendou.1+json" forHTTPHeaderField:@"Accept"];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:nil success:requset failure:^(AFHTTPRequestOperation * Operation, NSError * error) {
        NSLog(@"  wanglu");
    }];
    
   

}

+(void)requestWithUrlString:(NSString *)urlString  andparameters:(id)parameters  anddictBlock:(dictBlock)dictBlock View:(id)view
{

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    [manger.requestSerializer setValue:@"416fd0f4740cbe21e886d46c5104873f" forHTTPHeaderField:@"apikey"];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:parameters success:^(AFHTTPRequestOperation * Operation, id data) {
        
       
        if ([data isKindOfClass:[NSDictionary class]]) {
            
            if ([data[@"status"] integerValue]==1) {
                dictBlock(data);
                [hud hide:YES];
            }else{
                hud.mode = MBProgressHUDModeText;
                hud.labelText = @"服务器错误";
                [hud hide:YES afterDelay:0.5];
                
            }
           
        }
        if([data isKindOfClass:[NSData class]]){
            id temp = [self addResponseObject:data];
            
            if ([temp[@"status"] integerValue]==1) {
               dictBlock(temp);
                [hud hide:YES];
            }else{
                hud.mode = MBProgressHUDModeText;
                hud.labelText = @"服务器错误";
                [hud hide:YES afterDelay:0.5];
            }
            
        }
    } failure:^(AFHTTPRequestOperation * Operation, NSError * error) {
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"网络错误";
            [hud hide:YES afterDelay:0.5];
    }];
}
+(void)postRequestWithUrlString:(NSString *)urlString andparameters:(id)parameters anddictBlock:(dictBlock)dictBlock View:(id)view
{

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    [manger.requestSerializer setValue:@"416fd0f4740cbe21e886d46c5104873f" forHTTPHeaderField:@"apikey"];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger POST:urlString parameters:parameters success:^(AFHTTPRequestOperation * Operation, id data) {
        
        if ([data isKindOfClass:[NSDictionary class]]) {
            
            if ([data[@"status"] integerValue]==1) {
                dictBlock(data);
                [hud hide:YES];
            }else{
                hud.mode = MBProgressHUDModeText;
                hud.labelText = @"服务器错误";
                [hud hide:YES afterDelay:0.5];
            
            }
            
        }else if([data isKindOfClass:[NSData class]]){
            
        id temp = [self addResponseObject:data];
            if ([temp[@"status"] integerValue]==1) {
                dictBlock(temp);
                [hud hide:YES];
            }else{
                hud.mode = MBProgressHUDModeText;
                hud.labelText = @"服务器错误";
                [hud hide:YES afterDelay:0.5];
            
            }
        
        }
        
    } failure:^(AFHTTPRequestOperation * Operation, NSError * Error) {
                hud.mode = MBProgressHUDModeText;
                hud.labelText = @"网络错误";
                [hud hide:YES afterDelay:0.5];
    }];

}
+(NSMutableDictionary *)addResponseObject:(id)responseObject{

    NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
    NSData *jsonData = [result dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    return [NSJSONSerialization JSONObjectWithData:jsonData
                                           options:NSJSONReadingMutableContainers
                                             error:&err];

}
@end
