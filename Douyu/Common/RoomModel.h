//
//  RoomModel.h
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYBaseModel.h"
/*
 "room": {
 "room_id": "286138",
 "room_src": "http:\/\/rpic.douyucdn.cn\/z1601\/30\/01\/286138_160130011010.jpg",
 "cate_id": "62",
 "room_name": "\u3010\u5192\u9669\u5c9b2\u3011\u5168\u6c11PK\uff01\u840c\u7cfb\u5f15\u7206\uff01\uff01",
 "vod_quality": "0",
 "show_status": "2",
 "show_time": "1454072680",
 "owner_uid": "19173834",
 "specific_catalog": "maoxiandao2",
 "specific_status": "1",
 "online": 0,
 "nickname": "\u4e3b\u64ad20\u6295",
 "url": "\/maoxiandao2",
 "game_url": "\/directory\/game\/zh",
 "game_name": "\u7efc\u5408\u6e38\u620f",
 "game_icon_url": "http:\/\/staticlive.douyutv.com\/upload\/game_cate\/e37eff0166035b7e1528e8a5a24a5fc3.jpg",
 "show_details": "\u65b0\u6d6a\u5fae\u535a\uff1a\u4e3b\u64ad20\u6295\u3002\u76f4\u64ad\u65f6\u95f411\u300112\u70b9\u5f80\u540e10\u5c0f\u65f6+\n12345\u7fa4\u5df2\u6ee1\u30016\u7fa4\uff1a123530658 \u3002VPN\uff1aleexx",
 "owner_avatar": "http:\/\/uc.douyutv.com\/avatar.php?uid=19173834&size=big",
 "owner_weight": "7.4t",
 "fans": "28399"
 }
 */
@interface RoomModel : DYBaseModel
@property (nonatomic,copy) NSString *online; //在线人数
@property (nonatomic,copy) NSString *owner_avatar; //头像url
@property (nonatomic,copy) NSString *nickname; //主播名
@property (nonatomic,copy) NSString *game_name; //游戏名
@property (nonatomic,copy) NSString *owner_weight; //体重
@property (nonatomic,copy) NSString *fans; //关注
@property (nonatomic,copy) NSString *show_details; //直播公告

@property (nonatomic,copy) NSString *url; //直播地址

@end
