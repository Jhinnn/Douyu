//
//  CollectionViewCell.h
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SectionTwoModel;
@interface CollectionViewCell : UICollectionViewCell {
    
    __weak IBOutlet UILabel *_containsLabel;
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_nameLabel;
    __weak IBOutlet UILabel *_onlineLabel;
    __weak IBOutlet UILabel *_titleLabel;
}

@property (nonatomic,assign) SectionTwoModel *secModel;
@end
