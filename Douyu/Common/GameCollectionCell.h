//
//  GameCollectionViewCell.h
//  Douyu
//
//  Created by pengpeng on 16/2/2.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameModel;
@interface GameCollectionCell : UICollectionViewCell {
    
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_nameLabel;
    __weak IBOutlet UILabel *_onlineLabel;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_containsLabel;
    
}

@property (nonatomic,assign) GameModel *gameModel;

@end
