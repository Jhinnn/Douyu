//
//  TitleTableViewCell.h
//  Douyu
//
//  Created by pengpeng on 16/1/28.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleTableViewCell : UITableViewCell {
    
    __weak IBOutlet UIButton *_clickButton;
    
}

@property (weak, nonatomic) IBOutlet UILabel *_titleLabel;
@property (nonatomic,assign) NSString *strUrl;
@property (nonatomic,assign) NSString *strTitle;
- (IBAction)moreAction:(id)sender;


@end
