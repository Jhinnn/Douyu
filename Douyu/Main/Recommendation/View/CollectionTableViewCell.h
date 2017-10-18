//
//  CollectionTableViewCell.h
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionTableViewCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>{
    
    __weak IBOutlet UICollectionView *_collectionView;
    
}

@property (nonatomic,assign) NSArray *channelArray;

@end
