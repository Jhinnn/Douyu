//
//  MyDataService.m
//  WXWeibo
//
//  Created by wei.chen on 15/9/14.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MyDataService.h"
#import "AFNetworking.h"

#define BASE_URL @""

@implementation MyDataService

+ (void)requestURL:(NSString *)urlstring
        httpMethod:(NSString *)method
            params:(NSDictionary *)params
       complection:(void(^)(id result, NSError *error))block {
    
    //1.拼接URL
    NSString *url = [BASE_URL stringByAppendingString:urlstring];
    
    NSMutableDictionary *mutableParmas = params.mutableCopy;
    if (mutableParmas == nil) {
        mutableParmas = @{}.mutableCopy;
    }
    
    //3.创建AFHTTPSessionManager对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //4.判断请求方式
    if ([method caseInsensitiveCompare:@"GET"] == NSOrderedSame) {
        
        //发送GET请求
        [manager GET:url parameters:mutableParmas success:^(NSURLSessionDataTask *task, id responseObject) {
            
            block(responseObject,nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            block(nil,error);
        }];
    }
    else if([method caseInsensitiveCompare:@"POST"] == NSOrderedSame) {
        
        //发送POST请求
        [manager POST:url parameters:mutableParmas success:^(NSURLSessionDataTask *task, id responseObject) {
            
            block(responseObject,nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            block(nil,error);
            
        }];
        
    }
}





@end
