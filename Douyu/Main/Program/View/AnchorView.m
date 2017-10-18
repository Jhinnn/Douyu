//
//  AnchorView.m
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "AnchorView.h"
#import "RoomModel.h"
@implementation AnchorView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)setRoomModel:(RoomModel *)roomModel {
    _roomModel = roomModel;
    _imgView.layer.cornerRadius = _imgView.width/2;
    _imgView.layer.masksToBounds = YES;
    
    _noticeButton.layer.masksToBounds = YES;
    _noticeButton.layer.cornerRadius = 3;
    _noticeButton.layer.borderWidth = 1;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 238/255.0, 87/255.0, 23/255.0, 1 });
    _noticeButton.layer.borderColor = colorref;
    
    //用户头像
    [_imgView setImageWithURL:[NSURL URLWithString:_roomModel.owner_avatar]];
    //游戏类型
    _gameLabel.text = _roomModel.game_name;
    //主播名字
    _titleLabel.text = _roomModel.nickname;
    //鱼丸
    _weightLabel.text = _roomModel.owner_weight;
    //关注人数
    
    _fansLabel.text = [self getOnlineString:_roomModel.fans];
    
}

- (IBAction)attentionAction:(id)sender {
}

- (NSString *)getOnlineString:(NSString *)number {
    
    float online = [number floatValue];
    if ((int)online / 10000 >= 1) { //大于10000人
        return [NSString stringWithFormat:@"%0.1f万",online/10000];
    }
    
    return [NSString stringWithFormat:@"%d",(int)online];
}
@end
