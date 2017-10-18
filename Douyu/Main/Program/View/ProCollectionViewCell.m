//
//  ProCollectionViewCell.m
//  Douyu
//
//  Created by pengpeng on 16/1/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "ProCollectionViewCell.h"
#import "ProModel.h"
@implementation ProCollectionViewCell

- (void)setProModel:(ProModel *)proModel {
    _proModel = proModel;
    [_imgView setImageWithURL:[NSURL URLWithString:_proModel.game_src] placeholderImage:[UIImage imageNamed:@"Image_column_default.png"]];
    _titleLabel.text = _proModel.game_name;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
