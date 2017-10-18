//
//  TitleTableViewCell.m
//  Douyu
//
//  Created by pengpeng on 16/1/28.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "TitleTableViewCell.h"
#import "GameViewController.h"
#import "UIView+ViewController.h"
#import "NaviViewController.h"
@implementation TitleTableViewCell


- (void)awakeFromNib {
 
    _clickButton.adjustsImageWhenHighlighted = NO;

}




- (IBAction)moreAction:(id)sender {
    

    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"GameViewController" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    GameViewController *gameVC = [story instantiateViewControllerWithIdentifier:@"game"];
    //由navigationController推向我们要推向的view
    gameVC.strUrl= self.strUrl;
    gameVC.strtitle = self.strTitle;
    gameVC.hidesBottomBarWhenPushed = YES;
    gameVC.tag = 0;
    [self.viewController.navigationController pushViewController:gameVC animated:YES];
    
}
@end
