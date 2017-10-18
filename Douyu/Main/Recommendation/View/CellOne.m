//
//  CellOne.m
//  Douyu
//
//  Created by pengpeng on 16/1/27.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "CellOne.h"
#import "SectionOneModel.h"
#import "Common.h"
@implementation CellOne {
    
    NSMutableArray *_picArray;
    NSMutableArray *_titleArray;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSMutableArray *)menuArray {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _picArray = @[].mutableCopy;
        _titleArray = @[].mutableCopy;
        for (SectionOneModel *model in menuArray) {
            NSString *imgUrl = model.pic_url;
            NSString *title = model.title;
            [_picArray addObject:imgUrl];
//            [_titleArray addObject:title];
        }
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, 110)];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.contentInset = UIEdgeInsetsMake(0, 10, 0, 0);
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.contentSize = CGSizeMake(kScreenWidth/3*8+10, 110);
        [self addSubview:scrollView];
        
        //创建8个imageView和label
        for (int i = 0; i < menuArray.count; i++) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kScreenWidth/3, 0, kScreenWidth/3, 80)];
            imgView.layer.cornerRadius = 10;
            imgView.tag = i+20;
            imgView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapAction:)];
            [imgView addGestureRecognizer:tap];
            
            
            imgView.layer.masksToBounds = YES;
            imgView.transform = CGAffineTransformMakeScale(0.95, 0.95);
            
            [imgView setImageWithURL:_picArray[i]];
            [scrollView addSubview:imgView];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*kScreenWidth/3, CGRectGetMaxY(imgView.frame), kScreenWidth/3, 25)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:15];
//            label.text = _titleArray[i];
            [scrollView addSubview:label];

        }
    }
    return self;
}


- (void)imgTapAction:(UITapGestureRecognizer *)gesture {
    
    
    
}

@end
