//
//  LiveNoticeVIew.m
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "LiveNoticeVIew.h"

@implementation LiveNoticeVIew

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setNoticeString:(NSString *)noticeString {
    _noticeString = noticeString;
    _detailLabel.text = _noticeString;
}

@end
