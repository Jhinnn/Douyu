//
//  LiveViewController.h
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RoomModel;
@interface LiveRoomViewController : UIViewController

@property (nonatomic,assign) NSString *roomId;
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) RoomModel *roomModel;

@end
