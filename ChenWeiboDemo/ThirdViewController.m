//
//  ThirdViewController.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/19.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "ThirdViewController.h"
#import "Masonry.h"
#import "UserInformationView.h"

@interface ThirdViewController ()
@property (nonatomic,strong) UserInformationView *userInformationView;

@end

@implementation ThirdViewController
@synthesize userInformationView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    userInformationView = [[UserInformationView alloc]init];
    [self.view addSubview:userInformationView];
    [userInformationView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@([[UIScreen mainScreen]bounds].size.height/3));
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
