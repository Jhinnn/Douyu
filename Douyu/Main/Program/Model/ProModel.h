//
//  ProModel.h
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "cate_id": "1",
 "game_name": "\u82f1\u96c4\u8054\u76df",
 "short_name": "LOL",
 "game_url": "\/directory\/game\/LOL",
 "game_src": "http:\/\/staticlive.douyutv.com\/upload\/game_cate\/c543faae97189c529c37b7741906d5a1.jpg",
 "game_icon": "http:\/\/staticlive.douyutv.com\/upload\/game_cate\/8edf7d73a5643356721e1c18a84e06d8.jpg",
 "online_room": "665",
 "online_room_ios": "100"
 */
@interface ProModel : NSObject

@property (nonatomic,copy) NSString *cate_id;
@property (nonatomic,copy) NSString *game_name;
@property (nonatomic,copy) NSString *game_src;
@property (nonatomic,copy) NSString *online_room;
@property (nonatomic,copy) NSString *online_room_ios;
@property (nonatomic,copy) NSString *game_url;
@end
