//
//  ProViewController.m
//  Douyu
//
//  Created by pengpeng on 16/1/25.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "ProViewController.h"
#import "AFNetworking.h"
#import "ProModel.h"
#import "ProCollectionViewCell.h"
#import "GameViewController.h"
@interface ProViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ProViewController {
    NSMutableArray *_modelArray;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //请求网格列表数据
    
    
    [self requestCollectionData];
    
}

- (void)requestCollectionData {
    
    //http://www.douyutv.com/api/v1/game?aid=ios&client_sys=ios&time=1454079720&auth=1059a6013ec84848f8d35aced3ca24cb
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //获得time的对应属性值 时间戳
    NSString *time = [NSString stringWithFormat:@"%d",(int)[self getTime]];
    
    NSDictionary *params = @{
                             @"aid":@"ios",
                             @"client_sys":@"ios",
                             @"time":time,
                             @"auth":@"1059a6013ec84848f8d35aced3ca24cb"
                             };
    _modelArray = @[].mutableCopy;
    [manager POST:@"http://www.douyutv.com/api/v1/game" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *proDic) {
        NSArray *proArray = proDic[@"data"];
        //遍历栏目的数组
        [proArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ProModel *model = [[ProModel alloc] init];
            NSDictionary *dic =  proArray[idx];
            model.cate_id = dic[@"cate_id"];
            model.game_name = dic[@"game_name"];
            model.game_src = dic[@"game_src"];
            model.online_room = dic[@"online_room"];
            model.game_url = dic[@"game_url"];
            model.online_room_ios = dic[@"online_room_ios"];
            [_modelArray addObject:model];
        }];
        [_collectionView reloadData];
    
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark --collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modelArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pro_cell" forIndexPath:indexPath];
    ProModel *model = _modelArray[indexPath.item];
    cell.proModel = model;
    return cell;
}

//设定单元格的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (kScreenWidth-40)/3;
    
    if (kScreenWidth == 375) {
        return CGSizeMake(width, 180);
    }
    
    return CGSizeMake(width, 146);
}

//设定单元格与边缘的间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}


#pragma mark --单元格点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"GameViewController" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    GameViewController *gameVC = [story instantiateViewControllerWithIdentifier:@"game"];
    //由navigationController推向我们要推向的view
    ProModel *proModel = _modelArray[indexPath.item];
    gameVC.strtitle = proModel.game_name;
    gameVC.strUrl =proModel.cate_id;
    gameVC.tag = 1;
    
    gameVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:gameVC animated:YES];
}

- (NSInteger)getTime {
    return [[NSDate date] timeIntervalSince1970];
}

@end
