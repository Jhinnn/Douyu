//
//  AnchorView.h
//  Douyu
//
//  Created by pengpeng on 16/1/30.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RoomModel;
@interface AnchorView : UIView {
    
    
    __weak IBOutlet UIButton *_noticeButton;
    __weak IBOutlet UIImageView *_imgView;
    
    __weak IBOutlet UILabel *_gameLabel;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_weightLabel;
    __weak IBOutlet UILabel *_fansLabel;
}
- (IBAction)attentionAction:(id)sender;

@property (nonatomic,assign) RoomModel *roomModel;

@end
