//
//  GameCollectionViewCell.m
//  Douyu
//
//  Created by pengpeng on 16/2/2.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "GameCollectionCell.h"
#import "GameModel.h"

@implementation GameCollectionCell


- (void)setGameModel:(GameModel *)gameModel {
    _gameModel = gameModel;
    
    _containsLabel.backgroundColor = [UIColor clearColor];
    
    _imgView.layer.cornerRadius = 4;
    _imgView.layer.masksToBounds = YES;
    [_imgView setImageWithURL:[NSURL URLWithString:_gameModel.room_src]];
    _nameLabel.text  = _gameModel.nickname;
    _onlineLabel.text = [self getOnlineString:_gameModel.online];
    
    _titleLabel.text = _gameModel.room_name;
    
    
    
    
}

- (NSString *)getOnlineString:(NSNumber *)number {
    
    float online = [number floatValue];
    if ((int)online / 10000 >= 1) { //大于10000人
        return [NSString stringWithFormat:@"%0.1f万",online/10000];
    }
    
    return [NSString stringWithFormat:@"%d",(int)online];
}

@end
