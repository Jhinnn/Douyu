//
//  APButton.m
//  Apathy
//
//  Created by Apathy on 15/7/6.
//  Copyright (c) 2015年 Apathy. All rights reserved.
//

#import "APButton.h"

@implementation APButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView && self.titleLabel) {

//        self.imageView.layer.masksToBounds = NO;
        self.clipsToBounds = self.imageView.clipsToBounds = NO;

        CGSize imageSize = self.imageViewSize;

        if (CGSizeEqualToSize(self.imageViewSize, CGSizeZero)) {

            imageSize = self.imageView.image.size;
        }

        self.imageView.size = imageSize;

        
        // 文字在图片下面的情况
        if (self.buttonStyle == ButtonStyleImageUp) {

            self.titleLabel.bottom = self.height;
            self.titleLabel.width = self.width;

            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            if (self.upNomal) {

                // 拿到间隔
                CGFloat gap = (self.height - imageSize.height - self.titleLabel.height) / 2.0f;

                // titleLabel 与 imageView 并不是紧密相连，而是上下隔开了 2.0f 的间距
                self.imageView.center = CGPointMake(self.width / 2.0f, gap + self.imageView.height / 2.0f - 3.0f);
                self.titleLabel.center = CGPointMake(self.width / 2.0f, self.height - gap - self.titleLabel.height / 2.0f + 3.0f);

            } else {


                self.imageView.bottom = self.titleLabel.top - 4.0f;

                CGFloat height = self.height - self.imageView.bottom;

                self.imageView.size = CGSizeMake(height / imageSize.height * imageSize.width, height);
                self.imageView.centerX = self.titleLabel.centerX = self.width / 2.0f;
            }

        } else if (self.buttonStyle == BUttonStyleImageDown) {
            
            
            // 拿到间隔
            CGFloat gap = (self.height - imageSize.height - self.titleLabel.height) / 2.0f;

            // titleLabel 与 imageView 并不是紧密相连，而是上下隔开了 2.0f 的间距
            self.titleLabel.center = CGPointMake(self.width / 2.0f, gap + self.titleLabel.height / 2.0f - 2.0f);
            self.imageView.center = CGPointMake(self.width / 2.0f, self.height - gap - self.imageView.height / 2.0f + 2.0f);

        } else if (self.buttonStyle == ButtonStyleImageRight) {


            // 拿到间隔
            CGFloat gap = (self.width - imageSize.width - self.titleLabel.width) / 2.0f;

            // titleLabel 与 imageView 并不是紧密相连，而是左右隔开了 2.0f 的间距
            self.titleLabel.centerX = gap + self.titleLabel.width / 2.0f - 2.0f;
            self.imageView.centerX = self.width - gap - imageSize.width / 2.0f + 2.0f;
            
        } else if (self.buttonStyle == ButtonStyleNomal) {
            // 拿到间隔
            CGFloat gap = (self.width - imageSize.width - self.titleLabel.width) / 2.0f;

            // titleLabel 与 imageView 并不是紧密相连，而是左右隔开了 2.0f 的间距
            self.imageView.centerX = gap + imageSize.width / 2.0f - 2.0f;
            self.titleLabel.centerX = self.width - gap - self.titleLabel.width / 2.0f + 2.0f;
        }
    }

    // 暂时定为 白色，可根据需要判断条件设置不同的值
////    self.tintColor = [UIColor whiteColor];
//    if (self.selected && self.selectedTinColor) {
//        self.tintColor = self.selectedTinColor;
//    }
}

@end
