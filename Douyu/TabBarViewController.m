
//
//  TabBarViewController.m
//  Douyu
//
//  Created by pengpeng on 16/1/25.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "TabBarViewController.h"
#import "RecViewController.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController {
    NSMutableArray *_buttonItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //创建视图控制器
    [self _createViewControllers];
    //创建标签栏按钮
    [self _createTabBarButton];
}


//创建视图控制器
- (void)_createViewControllers {
    
    NSMutableArray *viewControllers = @[].mutableCopy;
    //1.定义各个故事版的名字
    NSArray *storyBoardNames = @[@"Recommendation",@"Program",@"Live",@"Me"];
    [storyBoardNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        //2.创建故事版对象
        UIStoryboard *st = [UIStoryboard storyboardWithName:name bundle:nil];
        //3.加载故事版，获得故事版中箭头指的控制器
        UINavigationController *navi = [st instantiateInitialViewController];
        [viewControllers addObject:navi];
    }];
    self.viewControllers = viewControllers;
}
//创建标签栏按钮
- (void)_createTabBarButton {
    
    
    self.tabBar.clipsToBounds = YES;
    NSArray *titleArray = @[@"推荐",@"栏目",@"直播",@"我的"];
    NSArray *imagsArray = @[
                            @"btn_home_normal.png",
                            @"btn_column_normal.png",
                            @"btn_live_normal.png",
                            @"btn_user_normal.png"
                            ];
    
    CGFloat itemWidth = self.tabBar.bounds.size.width / imagsArray.count;
    CGFloat height = self.tabBar.bounds.size.height;
    
     _buttonItems = @[].mutableCopy;
    
    for (int i = 0; i < imagsArray.count; i++) {
        
        NSString *imageName = imagsArray[i];
        NSString *titleName = titleArray[i];
        
        UIControl *itemCotrl = [[UIControl alloc] initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, height)];
        itemCotrl.tag = i;
        itemCotrl.backgroundColor = [UIColor clearColor];
        [itemCotrl addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        //1.创建图片视图
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((itemWidth-20)/2, 5, 20, 20)];
        imgView.tag = 100;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image = [UIImage imageNamed:imageName];
        [itemCotrl addSubview:imgView];
        
        //2.创建标题
        CGFloat maxY = CGRectGetMaxY(imgView.frame);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, maxY, itemWidth, 20)];
        titleLabel.text = titleName;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor colorWithRed:74/255.0 green:61/255.0 blue:61/255.0 alpha:1];
        titleLabel.tag = 200;
        titleLabel.font = [UIFont systemFontOfSize:11];
        [itemCotrl addSubview:titleLabel];
        
        [self.tabBar addSubview:itemCotrl];
        [_buttonItems addObject:itemCotrl];
        
    
    }
    
    
}


- (void)clickItem:(UIControl *)control {

    self.selectedIndex = control.tag;

    
    
    NSArray *imageSelected = @[
                          @"btn_home_selected.png",
                          @"btn_column_selected.png",
                          @"btn_live_selected.png",
                          @"btn_user_selected.png"
                          ];
    NSArray *imagsArray = @[
                            @"btn_home_normal.png",
                            @"btn_column_normal.png",
                            @"btn_live_normal.png",
                            @"btn_user_normal.png"
                            ];
    
    [_buttonItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControl *control = (UIControl *)obj;
        
        UIImageView * imgView=(UIImageView *)[control viewWithTag:100];
        UILabel * label=(UILabel *)[control viewWithTag:200];
        
        if (idx == self.selectedIndex) {
            
            imgView.image=[UIImage imageNamed:imageSelected[idx]];
            label.textColor=UIColoerFromRGB(0xFF7713);
            label.font=[UIFont boldSystemFontOfSize:11];
        }else {
            
            imgView.image=[UIImage imageNamed:imagsArray[idx]];
            label.textColor=UIColoerFromRGB(0x929292);
            label.font=[UIFont systemFontOfSize:11];
        }
    }];
    
}



- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
        
    }
    
}


@end
