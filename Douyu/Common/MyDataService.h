//
//  MyDataService.h
//  WXWeibo
//
//  Created by wei.chen on 15/9/14.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataService : NSObject

+ (void)requestURL:(NSString *)urlstring
        httpMethod:(NSString *)method
            params:(NSDictionary *)params
       complection:(void(^)(id result, NSError *error))block;


@end
