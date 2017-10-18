//
//  LiveViewController.m
//  Douyu
//
//  Created by pengpeng on 16/1/25.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "LiveViewController.h"
#import "AFNetworking.h"
@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //获得time的对应属性值 时间戳
    [manager GET:@"https://jj.toutiaowangdai.com/public/test.php" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    

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
