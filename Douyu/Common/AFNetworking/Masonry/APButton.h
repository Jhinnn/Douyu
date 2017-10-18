//
//  APButton.h
//  tobosu
//
//  Created by tobosu on 15/7/6.
//  Copyright (c) 2015年 tobosu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

typedef enum : NSUInteger {

    ButtonStyleNomal = 0,   // 图左字右
    ButtonStyleImageRight,  // 图右字左
    ButtonStyleImageUp,     // 图上字下
    BUttonStyleImageDown,   // 图下字上
    
} APButtonStyle;

@interface APButton : UIButton



@property (nonatomic, assign) APButtonStyle buttonStyle;
@property (nonatomic, strong) UIColor *selectedTinColor;

@property (nonatomic, assign) CGSize imageViewSize;

@property (nonatomic, assign) BOOL upNomal;
//@property (nonatomic, strong) UIColor *highlightedTinColor;

@end
