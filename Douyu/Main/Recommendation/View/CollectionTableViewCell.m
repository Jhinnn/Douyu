//
//  CollectionTableViewCell.m
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "CollectionViewCell.h"
#import "SectionTwoModel.h"
#import "AFNetworking.h"
#import "RoomModel.h"
#import "LiveRoomViewController.h"
@implementation CollectionTableViewCell {
    NSString *_indetity;
    NSMutableArray *_roomDataArray;
}

- (void)awakeFromNib {
    // Initialization code
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _indetity = @"collection_cell";
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:_indetity];
    
    
    
    
}

- (void)setChannelArray:(NSArray *)channelArray {
    _channelArray = channelArray;
    
    [_collectionView reloadData];
}

//请求对应网格的数据
- (void)requestCellData:(NSString *)roomId{
    
//    http://capi.douyucdn.cn/api/v1/room/27836?aid=ios&client_sys=ios&time=1454431260&auth=2ad07d0bf48a4665deadc8eade0e2606
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //获得time的对应属性值 时间戳
    NSString *time = [NSString stringWithFormat:@"%ld",(long)[self getTime]];
    
    NSString *urlstring = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/room/%@",roomId];
    
    NSDictionary *params = @{
                             @"aid":@"ios",
                             @"client_sys":@"ios",
                             @"time":time,
                             @"auth":@"2ad07d0bf48a4665deadc8eade0e2606"
                             };
    [manager POST:urlstring parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *dataDic) {
        
        
        NSDictionary *data = dataDic[@"data"];
        _roomDataArray = @[].mutableCopy;
        [data enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            //获得直播房间的数据
            
            RoomModel *roomModel = [[RoomModel alloc] initWithDataDic:data];
            [_roomDataArray addObject:roomModel];
        }];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_indetity forIndexPath:indexPath];
    SectionTwoModel *model = _channelArray[indexPath.item];
    cell.secModel = model;
    return cell;
}

//设定单元格的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (kScreenWidth - 35)/2;
    CGFloat height = 100;
    
    return CGSizeMake(width, height);
}

//设定单元格与边缘的间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

//单元格选中事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SectionTwoModel *twoModel = _channelArray[indexPath.item];
    NSString *roomId = twoModel.room_id;
    NSString *name =twoModel.nickname;
    
    LiveRoomViewController *liveRoomVC  = [[LiveRoomViewController alloc] init];
    liveRoomVC.roomId = roomId;
    liveRoomVC.name = name;
    liveRoomVC.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:liveRoomVC animated:YES];
    
//    [self requestCellData:roomId];
}

- (NSInteger)getTime {
    return [[NSDate date] timeIntervalSince1970];
}
@end
