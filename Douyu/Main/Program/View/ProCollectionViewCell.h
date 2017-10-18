//
//  ProCollectionViewCell.h
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProModel;
@interface ProCollectionViewCell : UICollectionViewCell {
    
    __weak IBOutlet UIImageView *_imgView;
    
    __weak IBOutlet UILabel *_titleLabel;
}
@property (nonatomic,assign) ProModel *proModel;

@end
