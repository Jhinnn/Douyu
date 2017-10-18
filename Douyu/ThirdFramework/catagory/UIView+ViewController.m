//
//  UIViewController+ViewController.m
//  05 Responder
//
//  Created by wei.chen on 15/6/24.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController {
    
    UIResponder *next = self.nextResponder;  //1
    
    do {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
            
            break;
        }
        
        next = next.nextResponder;
        
    }while(next != nil);
    
    
    return nil;
}

@end
