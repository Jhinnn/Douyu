//
//  LiveViewController.m
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "LiveRoomViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "RoomModel.h"
#import "UIView+Blur.h"
#import "YJSegmentedControl.h"
#import "LiveRoomChatTableView.h"
#import "AnchorView.h"
#import "LiveNoticeVIew.h"

#define BASE_URL @"www.douyutv.com"
@interface LiveRoomViewController ()

@end

@implementation LiveRoomViewController {
    MPMoviePlayerController *_moviePlayer;
    UIView *_topView; //播放器顶部视图
    UIView *_bottomBlurView; //播放器底部毛玻璃视图
    YJSegmentedControl *_segment;
    
    LiveRoomChatTableView *_LRChatTableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    
    //创建播放器
    [self _createPlayer];
    
    //创建播放器上方视图
    [self _createTopView];
    
    //创建播放器下方视图
    [self _createBottomView];
    
    //创建选项卡视图
    [self _createSelectedView];
    
    //创建聊天表格视图
    [self _createChatTableView];
    
    NSString *message = [NSString stringWithFormat:@"%@,%@",self.name,self.roomId];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"你选择的主播名和房间号分别是：" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alertView show];
}



#pragma mark --创建播放器
- (void)_createPlayer {
    
    //http://hdl3.douyutv.com/live/12313rRT70ZYPIzn.flv?wsSecret=e71588f96dd6d1a22452058c311eeada&wsTime=1454131118
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mobile_vedio.mp4" withExtension:nil];
    _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    NSString *urlstring = [BASE_URL stringByAppendingString:_roomModel.url];
//    _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:urlstring]];
    _moviePlayer.view.frame = CGRectMake(3, 20, kScreenWidth-6,kScreenHeight/3);
    _moviePlayer.controlStyle = MPMovieControlStyleNone;
//    [_moviePlayer play];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    _moviePlayer.view.userInteractionEnabled = YES;
    [_moviePlayer.view addGestureRecognizer:tapGesture];
    

    [self.view addSubview:_moviePlayer.view];
}

#pragma mark -- 播放器上方视图
- (void)_createTopView {
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _moviePlayer.view.width, 34)];
    _topView.backgroundColor = [UIColor clearColor];
    
    //创建 左边回退按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(6, 4, 26, 26);
    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_round_back.png"]  forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_round_back_h.png"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:backButton];
    
    //创建右边菜单按钮
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    menuButton.frame = CGRectMake(_moviePlayer.view.width-4-26, 4, 26, 26);
    [menuButton setBackgroundImage:[UIImage imageNamed:@"btn_v_more.png"]  forState:UIControlStateNormal];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"btn_v_more_h.png"] forState:UIControlStateHighlighted];
    [_topView addSubview:menuButton];
    [_moviePlayer.view addSubview:_topView];
    
}

#pragma mark --创建播放器下方视图
- (void)_createBottomView {
    
    _bottomBlurView = [[UIView alloc] initWithFrame:CGRectMake(0, _moviePlayer.view.height-38, _moviePlayer.view.width, 38)];
    //开启视图的毛玻璃效果
//    [_bottomBlurView enableBlur:YES];
//    //设置颜色
//    _bottomBlurView.blurTintColor = [UIColor colorWithWhite:0.2 alpha:1];
//    //    playView.blurTintColor = [UIColor orangeColor];
//    //设置显示效果
//    _bottomBlurView.blurStyle = UIViewBlurDarkStyle;
    _bottomBlurView.backgroundColor = [UIColor clearColor];
    [_moviePlayer.view addSubview:_bottomBlurView];
    
    //创建播放暂停按钮
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(10, 4, 30, 30);
    playButton.tag = 101;
    [playButton setImage:[UIImage imageNamed:@"btn_player_play"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"btn_v_play_h"] forState:UIControlStateSelected];
    [playButton addTarget:self action:@selector(playAndPauseAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBlurView addSubview:playButton];
    //默认设置开启播放
    playButton.hidden = NO;
    
    UIButton *pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.frame = CGRectMake(10, 4, 30, 30);
    pauseButton.tag = 102;
    [pauseButton setBackgroundImage:[UIImage imageNamed:@"btn_player_pause"] forState:UIControlStateNormal];
    [pauseButton setBackgroundImage:[UIImage imageNamed:@"btn_v_pause_h"] forState:UIControlStateSelected];
    [pauseButton addTarget:self action:@selector(playAndPauseAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBlurView addSubview:pauseButton];
    pauseButton.hidden = YES;
    
    //创建人数imgView和人数label
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(playButton.frame)+6, (_bottomBlurView.height-20)/2, 20, 20)];
    [imgView setImage:[UIImage imageNamed:@"Image_online"]];
    [_bottomBlurView addSubview:imgView];
    
    UILabel *onlineLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgView.frame)+2, (_bottomBlurView.height -26)/2, 100, 26)];
//    onlineLabel.backgroundColor = [UIColor redColor];
    onlineLabel.text = @"100万";
    onlineLabel.textColor = [UIColor whiteColor];
    onlineLabel.font = [UIFont systemFontOfSize:12];
    [_bottomBlurView addSubview:onlineLabel];
    
    
    
    //创建全屏按钮
    UIButton *fullButton = [UIButton buttonWithType:UIButtonTypeSystem];
    fullButton.frame = CGRectMake(_moviePlayer.view.width-22-10, (_bottomBlurView.height-22)/2, 22, 22);
    [fullButton setBackgroundImage:[UIImage imageNamed:@"btn_vdo_full"] forState:UIControlStateNormal];
    [fullButton setBackgroundImage:[UIImage imageNamed:@"btn_vdo_full_click"] forState:UIControlStateHighlighted];
    [_bottomBlurView addSubview:fullButton];
    
    [_moviePlayer.view addSubview:_bottomBlurView];
}

#pragma mark --创建选项卡视图
- (void)_createSelectedView {
    
    NSArray *titleArray = @[@"聊天",@"主播",@"排行"];
    _segment = [YJSegmentedControl segmentedControlFrame:CGRectMake(2, _moviePlayer.view.bottom, kScreenWidth-4, 40) titleDataSource:titleArray backgroundColor:[UIColor colorWithRed:237.0f/255 green:237.0f/255 blue:237.0f/255 alpha:1.0f] titleColor:[UIColor grayColor] titleFont:[UIFont fontWithName:@".Helvetica Neue Interface" size:15.0f] selectColor:[UIColor orangeColor] buttonDownColor:[UIColor orangeColor] Delegate:self];
    [self.view addSubview:_segment];
    
}

//创建聊天的表格视图
- (void)_createChatTableView {
    
    _LRChatTableView = [[LiveRoomChatTableView alloc] initWithFrame:CGRectMake(2, _segment.bottom, kScreenWidth-4, 345)];
    [self.view addSubview:_LRChatTableView];
}


- (void)setRoomModel:(RoomModel *)roomModel {
    _roomModel = roomModel;
}



#pragma mark --视频界面点击事件
- (void)tapAction:(UITapGestureRecognizer *)tapGesture {
    
    _topView.hidden = !_topView.hidden;
    _bottomBlurView.hidden = !_bottomBlurView.hidden;
    
}

#pragma mark -- 遵守代理 实现代理方法
- (void)segumentSelectionChange:(NSInteger)selection{
    
    if (selection == 0) {  //聊天界面
        NSLog(@"聊天界面");
        
        UIView *anchorView =  (UIView *)[self.view viewWithTag:10];
        UIView *liveNoticeView = (UIView *)[self.view viewWithTag:11];
        anchorView.hidden = YES;
        liveNoticeView.hidden = YES;
        _LRChatTableView.hidden = NO;
        
        
    }else if (selection == 1){  //主播信息界面
        
        _LRChatTableView.hidden = YES;
        
        NSArray *viewArray = [[NSBundle mainBundle] loadNibNamed:@"AnchorView" owner:self options:nil];
        
        AnchorView *anchorView = [viewArray firstObject];
        anchorView.hidden = NO;
        anchorView.tag = 10;
        anchorView.frame = CGRectMake(0, _segment.bottom, kScreenWidth, 86);
        anchorView.roomModel = _roomModel;
        [self.view addSubview:anchorView];
        
        LiveNoticeVIew *liveNoticeView = [viewArray lastObject];
        liveNoticeView.tag = 11;
        liveNoticeView.hidden = NO;
        liveNoticeView.frame = CGRectMake(0, anchorView.bottom, kScreenWidth, kScreenHeight-anchorView.bottom);
        liveNoticeView.backgroundColor = [UIColor whiteColor];
        liveNoticeView.noticeString = _roomModel.show_details;
        
        [self.view addSubview:liveNoticeView];
            
    }else{                              //礼物排行界面
        NSLog(@"礼物排行");
        
        
    }
    
}





#pragma mark --播放暂停按钮事件
- (void)playAndPauseAction:(UIButton *)button {
    
    if (button.tag == 101) { //播放按钮
        
        UIButton *playBtn = (UIButton *)[_bottomBlurView viewWithTag:101];
        UIButton *stopBtn = (UIButton *)[_bottomBlurView viewWithTag:102];
        //切换播放，暂停按钮的显示
        playBtn.hidden = YES;
        stopBtn.hidden = NO;
        
        [_moviePlayer play];
    }else if (button.tag == 102) {
        UIButton *playBtn = (UIButton *)[_bottomBlurView viewWithTag:101];
        UIButton *stopBtn = (UIButton *)[_bottomBlurView viewWithTag:102];
        //切换播放，暂停按钮的显示
        playBtn.hidden = NO;
        stopBtn.hidden = YES;
        [_moviePlayer stop];
    }
}


- (void)backAction:(UIButton *)button {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

@end
