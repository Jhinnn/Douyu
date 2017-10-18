//
//  GameViewController.m
//  Douyu
//
//  Created by pengpeng on 16/2/2.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "GameViewController.h"
#import "AFNetworking.h"
#import "GameModel.h"
#import "GameCollectionCell.h"
#import "LiveRoomViewController.h"
@interface GameViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation GameViewController {
    NSMutableArray *_gameModelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = _strtitle; //设置标题
    self.view.backgroundColor = [UIColor whiteColor]; //设置颜色
    
    //请求数据
    [self _requestData];
    
}




//请求数据
- (void)_requestData {

    //http://capi.douyucdn.cn/api/v1/live/homechannel_jjyx?aid=ios&client_sys=ios&limit=20&offset=0&time=1454413800&auth=814af33893a81e6d680ad7e90eee04f8 //更多的url
    
    //各种游戏对应的url
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"";
    if (self.tag == 0) {  //点击更多
            url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/live/homechannel_%@",_strUrl];
    }else if (self.tag == 1) {
        url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/live/%@",_strUrl];
    }
    
    
    NSString *time = [NSString stringWithFormat:@"%ld",(long)[self getTime]];
    NSDictionary *params = @{
                             @"aid":@"ios",
                             @"client_sys":@"ios",
                             @"limit":@"20",
                             @"offset":@"0",
                             @"time":time,
                             @"auth":@"814af33893a81e6d680ad7e90eee04f8"
                             };
    _gameModelArray = @[].mutableCopy;
    [manager POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task,    NSDictionary *dic) {
        NSArray *data = dic[@"data"];
        
        [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *dic = data[idx];
            GameModel *gameModel = [[GameModel alloc] initWithDataDic:dic];
            [_gameModelArray addObject:gameModel];
            
        }];
        [_gameCollectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _gameModelArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GameCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"game_cell" forIndexPath:indexPath];
    cell.gameModel  = _gameModelArray[indexPath.item];
    
    return cell;
}

//设定单元格的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (kScreenWidth-30)/2;
    
    if (kScreenWidth == 375) {
        return CGSizeMake(width, 120);
    }
    
    return CGSizeMake(width, 115);
}

//设定单元格与边缘的间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GameModel *gameModel = _gameModelArray[indexPath.item];
    LiveRoomViewController *liveRoomVC = [[LiveRoomViewController alloc] init];
    liveRoomVC.roomId = gameModel.room_id;
    liveRoomVC.name = gameModel.nickname;
    [self.navigationController pushViewController:liveRoomVC animated:YES];
    
    
    
}

- (NSInteger)getTime {
    return [[NSDate date] timeIntervalSince1970];
}

@end
