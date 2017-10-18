//
//  SectionTwoModel.h
//  Douyu
//
//  Created by pengpeng on 16/1/28.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
"data": [{
    "title": "\u7ade\u6280\u6e38\u620f",
    "cate_id": "homechannel_jjyx",
    "roomlist": [{
        "room_id": "522425",
        "room_src": "http:\/\/rpic.douyucdn.cn\/z1601\/28\/20\/522425_160128203021.jpg",
        "cate_id": "1",
        "room_name": "LMS\u8054\u8d5b\u6625\u5b63\u8d5b M17 vs HKE",
        "show_status": "1",
        "subject": "",
        "show_time": "1453801734",
        "owner_uid": "34223809",
        "specific_catalog": "LMS",
        "specific_status": "1",
        "vod_quality": "0",
        "nickname": "Riot\u4e36LMS",
        "online": 11037,
        "url": "\/LMS",
        "game_url": "\/directory\/game\/LOL",
        "game_name": "\u82f1\u96c4\u8054\u76df",
        "child_id": "28"
    }, {
        "room_id": "532152",
        "room_src": "http:\/\/rpic.douyucdn.cn\/z1601\/28\/20\/532152_160128203831.jpg",
        "cate_id": "3",
        "room_name": "Pis\u7684\u76f4\u64ad\u95f4 \u5355\u6392 \u6012\u51b27000",
        "show_status": "1",
        "subject": "",
        "show_time": "1453952210",
        "owner_uid": "35195701",
        "specific_catalog": "pis",
        "specific_status": "1",
        "vod_quality": "0",
        "nickname": "YaphetS\u4e36666",
        "online": 187218,
        "url": "\/pis",
        "game_url": "\/directory\/game\/DOTA2",
        "game_name": "DOTA2",
        "child_id": "0"
    }, {
        "room_id": "37807",
        "room_src": "http:\/\/rpic.douyucdn.cn\/z1601\/28\/20\/37807_160128202853.jpg",
        "cate_id": "29",
        "room_name": "\u65e0\u9650\u676f...\u77ac\u95f4\u7206\u70b8",
        "show_status": "1",
        "subject": "",
        "show_time": "1453979724",
        "owner_uid": "881294",
        "specific_catalog": "vrkof97",
        "specific_status": "1",
        "vod_quality": "0",
        "nickname": "\u6218\u795e_\u6cb3\u6c60VR",
        "online": 172284,
        "url": "\/vrkof97",
        "game_url": "\/directory\/game\/FTG",
        "game_name": "\u683c\u6597\u6e38\u620f",
        "child_id": "0"
    }, {
        "room_id": "62102",
        "room_src": "http:\/\/rpic.douyucdn.cn\/z1601\/28\/20\/62102_160128202355.jpg",
        "cate_id": "29",
        "room_name": "\u591c\u67ab:\u65e0\u9650\u676f",
        "show_status": "1",
        "subject": "",
        "show_time": "1453978702",
        "owner_uid": "1939443",
        "specific_catalog": "",
        "specific_status": "0",
        "vod_quality": "0",
        "nickname": "\u6c88\u9633\u591c\u67ab",
        "online": 52137,
        "url": "\/62102",
        "game_url": "\/directory\/game\/FTG",
        "game_name": "\u683c\u6597\u6e38\u620f",
        "child_id": "0"
    }]
 */
@interface SectionTwoModel : NSObject

@property (nonatomic,copy) NSString *room_id;
@property (nonatomic,copy) NSString *channelTitle;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSNumber *online;
@property (nonatomic,copy) NSString *room_name;
@property (nonatomic,copy) NSString *room_src;
@property (nonatomic,copy) NSString *url;

@end
