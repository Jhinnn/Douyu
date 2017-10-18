//
//  RecViewController.m
//  Douyu
//
//  Created by pengpeng on 16/1/25.
//  Copyright © 2016年 pengpeng. All rights reserved.
//



#import "RecViewController.h"
#import "MyDataService.h"
#import "AFNetworking.h"//;
#import "LZAutoScrollView.h"
#import "CellOne.h"
#import "SectionOneModel.h"
#import "SectionTwoModel.h"
#import "TitleTableViewCell.h"
#import "CollectionTableViewCell.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefresh.h"
#import "LiveRoomViewController.h"
#import "RoomModel.h"
#import "GameViewController.h"
@interface RecViewController ()<UITableViewDataSource,UITableViewDelegate,LZScrollViewDelegate>

@end

@implementation RecViewController {
    
    UITableView *_tableView;
    
    NSMutableArray *_picArray; //存放轮播图片的数组
    NSMutableArray *_titleArray; //存放轮播标题的数组
    
    LZAutoScrollView  *_lzAutoScrollView;//定时滚动视图；
    
    NSMutableArray *_secOne;  //存放第一列数据的模型的数组
    NSMutableArray *_baseSecTwo;  //存放第二列 以后的数据模型的数组
    NSMutableArray *_copyArray;
    NSMutableArray *_secTwo;
    
    NSMutableArray *_roomDataArray; //存放直播房间数据模型的数组
    
    NSArray *_gameTitleArray;
    NSArray *_gamePYTitleArray;
    NSString *_identityOne;
    NSString *_identityTwo;
}

- (void)viewDidLoad {
    [super viewDidLoad];


    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    //注册单元格
    _identityOne = @"title_cell";
    [_tableView registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier:_identityOne];
   _identityTwo = @"channle_cell";
    
    [_tableView registerNib:[UINib nibWithNibName:@"CollectionTableViewCell" bundle:nil] forCellReuseIdentifier:_identityTwo];
    

    _gameTitleArray = @[@"竞技游戏",@"玻璃渣区",@"主机游戏",@"网络游戏",@"休闲游戏",@"手机游戏"];
    _gamePYTitleArray = @[@"jjyx",@"blzq",@"zjyx",@"wlyx",@"xxyx",@"sjyx"];
    
    //创建头部滚动视图
    if (kScreenWidth==414) {
        _lzAutoScrollView = [[LZAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 240)];
    }else if (kScreenWidth == 375) {
        _lzAutoScrollView = [[LZAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 210)];
    }else {
        _lzAutoScrollView = [[LZAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 181)];
    }
    _lzAutoScrollView.pageControlAligment = PageControlAligmentRight;
    _lzAutoScrollView.placeHolder = [UIImage imageNamed:@"place.jpg"];
    _lzAutoScrollView.delegate = self;
  
    _tableView.tableHeaderView = _lzAutoScrollView;
    
    
    
    //请求首页轮播图
    [self requestCyclePicture];

    //请求滚动视图数据
    [self requestScrollData];
    
    //请求视频数据
    [self requestChannelData];
    
    
}





#pragma 请求轮播图
- (void)requestCyclePicture {
    //http://www.douyutv.com/api/v1/slide/6?aid=ios&client_sys=ios&time=1453823700&auth=6d314ce50dc7b8a1b97f613983b32826

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //获得time的对应属性值 时间戳
    NSString *time = [NSString stringWithFormat:@"%ld",[self getTime]];
    
    NSDictionary *params = @{
                             @"aid":@"ios",
                             @"client_sys":@"ios",
                             @"time":time,
                             @"auth":@"6d314ce50dc7b8a1b97f613983b32826"
                             };
    [manager POST:@"http://www.douyutv.com/api/v1/slide/6" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *dataDic) {
        
        
        NSArray *data = dataDic[@"data"];
        
        _titleArray = @[].mutableCopy;
        _picArray = @[].mutableCopy;
        _roomDataArray = @[].mutableCopy;
        [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *dataDic = data[idx];
            [_titleArray addObject:dataDic[@"title"]];
            [_picArray addObject:dataDic[@"pic_url"]];
            //获得直播房间的数据
            NSDictionary *roomDic = dataDic[@"room"];
            RoomModel *roomModel = [[RoomModel alloc] initWithDataDic:roomDic];
            [_roomDataArray addObject:roomModel];
        }];
        _lzAutoScrollView.titles = _titleArray;
        _lzAutoScrollView.images = _picArray;
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
}

#pragma 请求滚动视图图片标题数据
- (void)requestScrollData {
    
   //http://www.douyutv.com/api/v1/getCyclePicture?aid=ios&client_sys=ios&time=1453829040&auth=d03a100b7847b3b13b5a84a094f55fb6
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //获得time的对应属性值 时间戳
    NSString *time = [NSString stringWithFormat:@"%ld",[self getTime]];
    
    NSDictionary *params = @{
                             @"aid":@"ios",
                             @"client_sys":@"ios",
                             @"time":time,
                             @"auth":@"d03a100b7847b3b13b5a84a094f55fb6"
                             };
    [manager POST:@"http://www.douyutv.com/api/v1/getCyclePicture" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *dataDic) {
        
        NSDictionary *data = dataDic[@"data"];
        NSArray *dataArray = data[@"result"]; //存放图片和标题的数组
    
        _secOne = @[].mutableCopy;
        [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *dataDic = dataArray[idx];
            
            SectionOneModel *one = [[SectionOneModel alloc] init];
            one.title = dataDic[@"name"];
            one.pic_url = dataDic[@"url"];
            [_secOne addObject:one];
        }];
        [_tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];

}

//请求视频数据
- (void)requestChannelData {
    //http://www.douyutv.com/api/v1/channel?aid=ios&client_sys=ios&limit=4&time=1453985700&auth=f2c29df3607a7e346c3d7c02d86031d7
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //获得time的对应属性值 时间戳
    NSString *time = [NSString stringWithFormat:@"%ld",[self getTime]];
    NSDictionary *params = @{
                             @"aid":@"ios",
                             @"client_sys":@"ios",
                             @"limit":@"4",
                             @"time":time,
                             @"auth":@"f2c29df3607a7e346c3d7c02d86031d7"
                             };
    _baseSecTwo = @[].mutableCopy;
    _copyArray = @[].mutableCopy;
    _secTwo = @[].mutableCopy;
    
    [manager POST:@"http://www.douyutv.com/api/v1/channel" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *dicData) {
        
        NSArray *channelArray =  dicData[@"data"];  //存放频道内容的数组
        [channelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *detailChannelDic = channelArray[idx]; //存放频道详细内容的数组
            NSArray *roomListArray = detailChannelDic[@"roomlist"];
            //遍历 roomlist数组，获得直播间对应数据
            [roomListArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                SectionTwoModel *two = [[SectionTwoModel alloc] init];
                NSDictionary *roomListDic = roomListArray[idx];
                two.room_name = roomListDic[@"room_name"];
                two.room_src = roomListDic[@"room_src"];
                two.nickname = roomListDic[@"nickname"];
                two.room_id = roomListDic[@"room_id"];
                two.url = roomListDic[@"url"];
                two.online = roomListDic[@"online"];
                [_baseSecTwo addObject:two];
            }];
            _copyArray = [_baseSecTwo copy];
            [_secTwo addObject:_copyArray];
            [_baseSecTwo removeAllObjects];
        }];
        
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }else{
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }else{
        return 5;
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        if (_secOne != nil ) {
            static NSString *cellIndentifier = @"sectionOne";
            CellOne *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[CellOne alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier menuArray:_secOne.mutableCopy];
                cell.backgroundColor = [UIColor whiteColor];
            
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    else if (indexPath.section >= 1) { //第二组 第一列
        if (indexPath.row == 0) {  //第一列
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identityOne forIndexPath:indexPath];
            //设置频道的标题
            UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
            label.text = _gameTitleArray[indexPath.section-1];
            
            cell.strUrl = _gamePYTitleArray[indexPath.section-1];  //传递url jjyx，blzq
            cell.strTitle = _gameTitleArray[indexPath.section-1]; //传递竞技游戏
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            return cell;
        }else if (indexPath.row == 1) {  //第二列 视频频道列
            CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identityTwo forIndexPath:indexPath];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            if (_secTwo.count != 0) {
                cell.channelArray = _secTwo[indexPath.section-1];

            }
            
            return cell;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    }else {
        if (indexPath.row == 0) {
            return 36;
        }else {
            return 240;
        }
    }
}

#pragma mark --LZScrollViewDelegate
- (void)clickAction:(NSInteger)index {
    
    LiveRoomViewController *liveVC = [[LiveRoomViewController alloc] init];
    liveVC.roomModel = _roomDataArray[index];
    [self.navigationController pushViewController:liveVC animated:YES];
    
}

- (NSInteger)getTime {
    return [[NSDate date] timeIntervalSince1970];
}



@end

