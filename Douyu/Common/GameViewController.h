//
//  GameViewController.h
//  Douyu
//
//  Created by pengpeng on 16/2/2.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController {
    
    
    
    __weak IBOutlet UICollectionView *_gameCollectionView;

    
}


@property (nonatomic,assign) NSString *strUrl;
@property (nonatomic,assign) NSString *strtitle;

@property (nonatomic,assign) NSInteger tag;
@end
