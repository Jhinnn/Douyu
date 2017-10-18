//
//  NaviViewController.m
//  Douyu
//
//  Created by pengpeng on 16/1/25.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "NaviViewController.h"

@interface NaviViewController ()

@end

@implementation NaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
