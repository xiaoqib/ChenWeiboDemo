//
//  FirstViewController.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/19.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "FirstViewController.h"
#import "AFNetworking.h"

@interface FirstViewController ()
@property (strong,nonatomic)UITextView *textView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    _textView = [[UITextView alloc]init];
    // textView 文本框
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(40);
        make.height.equalTo(@(100));
    }];
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = self.view.backgroundColor;
    [_textView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_textView.mas_top);
        make.left.equalTo(_textView.mas_left);
        make.width.equalTo(@(5));
        make.height.equalTo(@(5));
    }];
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = self.view.backgroundColor;
    [_textView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_textView.mas_top);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.width.equalTo(@(5));
        make.height.equalTo(@(5));
    }];
    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = self.view.backgroundColor;
    [_textView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.view.mas_top).with.offset(140);
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.width.equalTo(@(5));
        make.height.equalTo(@(5));
    }];
    UIView *view4 = [[UIView alloc]init];
    view4.backgroundColor = self.view.backgroundColor;
    [_textView addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.view.mas_top).with.offset(140);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.width.equalTo(@(5));
        make.height.equalTo(@(5));
    }];
    
    // 发表上传按钮
    
    UIView *buttonView = [[UIView alloc]init];
    buttonView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:buttonView];
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view.mas_top).with.offset(150);
        make.right.equalTo(self.view.mas_right).with.offset(-40);
        make.width.equalTo(@(50));
        make.height.equalTo(@(22));
    }];
    
    
    UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    [publishButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    publishButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    publishButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [publishButton setTitle:@"发送" forState:UIControlStateNormal];
    [buttonView addSubview:publishButton];
    [publishButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(buttonView.mas_top);
        make.right.equalTo(buttonView.mas_right);
        make.bottom.equalTo(buttonView.mas_bottom);
        make.left.equalTo(buttonView.mas_left);
    }];
}
-(void)publish{
    NSString *requestUrl = @"https://api.weibo.com/2/statuses/update.json";
    NSURLRequest *nsUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:requestUrl]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:nsUrlRequest];
    
    
    
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
