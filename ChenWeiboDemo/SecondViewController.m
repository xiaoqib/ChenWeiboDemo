//
//  SecondViewController.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/19.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "SecondViewController.h"
#import "WeiboAPIManager.h"

@interface SecondViewController ()

@property (nonatomic,strong) WeiboAPIManager *weiboAPIManager;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    _weiboAPIManager = [[WeiboAPIManager alloc]initWithDelegate:self];
    
    [_weiboAPIManager getPublicTimelineWithCount:1 withPage:1];
    
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
