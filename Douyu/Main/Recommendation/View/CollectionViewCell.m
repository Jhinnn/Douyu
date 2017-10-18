//
//  CollectionViewCell.m
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "CollectionViewCell.h"
#import "SectionTwoModel.h"
@implementation CollectionViewCell

- (void)awakeFromNib {
   
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)setSecModel:(SectionTwoModel *)secModel {
    _secModel = secModel;
    
    _containsLabel.backgroundColor = [UIColor clearColor];
    [_imgView setImageWithURL:[NSURL URLWithString:_secModel.room_src]];
    _imgView.layer.cornerRadius = 4;
    _imgView.layer.masksToBounds = YES;
    
    [_titleLabel setText:_secModel.room_name];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.text = _secModel.nickname;
    _onlineLabel.text = [self getOnlineString:_secModel.online];;
}

- (NSString *)getOnlineString:(NSNumber *)number {
    
    float online = [number floatValue];
    if ((int)online / 10000 >= 1) { //大于10000人
        return [NSString stringWithFormat:@"%0.1f万",online/10000];
    }
    
    return [NSString stringWithFormat:@"%d",(int)online];
}

@end
