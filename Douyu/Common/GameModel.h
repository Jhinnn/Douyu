//
//  GameModel.h
//  Douyu
//
//  Created by pengpeng on 16/2/2.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYBaseModel.h"

/*
 {
 "room_id": "101342",
 "room_src": "http:\/\/rpic.douyucdn.cn\/z1602\/02\/21\/101342_160202214408.jpg",
 "cate_id": "2",
 "room_name": "\u677f\uff1a\u65e5\u5e3812\u80dc",
 "show_status": "1",
 "subject": "",
 "show_time": "1454407790",
 "owner_uid": "996206",
 "specific_catalog": "board",
 "specific_status": "1",
 "vod_quality": "0",
 "nickname": "\u840c\u592a\u59475238",
 "online": 340091,
 "url": "\/board",
 "game_url": "\/directory\/game\/How",
 "game_name": "\u7089\u77f3\u4f20\u8bf4",
 "child_id": "0",
 "fans": "461008"
 }
 */
@interface GameModel : DYBaseModel

@property (nonatomic,copy) NSString *room_id;
@property (nonatomic,copy) NSString *channelTitle;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSNumber *online;
@property (nonatomic,copy) NSString *room_name;
@property (nonatomic,copy) NSString *room_src;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *game_name;

@end
