//
//  LiveNoticeVIew.h
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveNoticeVIew : UIView {
    
    __weak IBOutlet UILabel *_detailLabel;
}

@property (nonatomic,copy) NSString *noticeString;

@end
