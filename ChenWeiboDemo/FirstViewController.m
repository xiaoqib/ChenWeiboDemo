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
@property (strong,nonatomic)NSString *token;
@property (strong,nonatomic)UIView *buttonView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    _textView = [[UITextView alloc]init];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.textColor =self.view.backgroundColor;
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
    
    _buttonView = [[UIView alloc]init];
    _buttonView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_buttonView];
    [_buttonView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view.mas_top).with.offset(150);
        make.right.equalTo(self.view.mas_right).with.offset(-40);
        make.width.equalTo(@(50));
        make.height.equalTo(@(22));
    }];
    
    UIView *view5 = [[UIView alloc]init];
    view5.backgroundColor = self.view.backgroundColor;
    [_buttonView addSubview:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_buttonView.mas_top);
        make.left.equalTo(_buttonView.mas_left);
        make.width.equalTo(@(4));
        make.height.equalTo(@(4));
    }];
    
    UIView *view6 = [[UIView alloc]init];
    view6.backgroundColor = self.view.backgroundColor;
    [_buttonView addSubview:view6];
    [view6 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_buttonView.mas_top);
        make.right.equalTo(_buttonView.mas_right);
        make.width.equalTo(@(4));
        make.height.equalTo(@(4));
    }];
    UIView *view7 = [[UIView alloc]init];
    view7.backgroundColor = self.view.backgroundColor;
    [_buttonView addSubview:view7];
    [view7 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(_buttonView.mas_bottom);
        make.left.equalTo(_buttonView.mas_left);
        make.width.equalTo(@(4));
        make.height.equalTo(@(4));
    }];
    UIView *view8 = [[UIView alloc]init];
    view8.backgroundColor = self.view.backgroundColor;
    [_buttonView addSubview:view8];
    [view8 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(_buttonView.mas_bottom);
        make.right.equalTo(_buttonView.mas_right);
        make.width.equalTo(@(4));
        make.height.equalTo(@(4));
    }];
    
    
    UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    [publishButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    publishButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    publishButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [publishButton addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchDragInside];
    
    [publishButton setTitle:@"发送" forState:UIControlStateNormal];
    [_buttonView addSubview:publishButton];
    [publishButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_buttonView.mas_top);
        make.right.equalTo(_buttonView.mas_right);
        make.bottom.equalTo(_buttonView.mas_bottom);
        make.left.equalTo(_buttonView.mas_left);
    }];
    
    
    //键盘关闭手势
    [self tapBackground];
    
    //注册观察者中心
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(textDidBiginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(textDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
}

-(void) textDidBiginEditing:(NSNotification *) notification{
    
    _buttonView.backgroundColor = [UIColor colorWithRed:255/255.0f green:20/255.0f blue:255/255.0f alpha:1.0f];
   
}
-(void) textDidEndEditing:(NSNotification *) notification{
    if ([_textView.text  isEqual:@""]) {
        _buttonView.backgroundColor = [UIColor whiteColor];
    }
  
    
     NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
}


-(void)tapBackground //在ViewDidLoad中调用
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
}
-(void)tapOnce//手势方法
{
    [self.textView resignFirstResponder];
}




-(void)publish{

    self.token =_landinView.token;
    NSLog(@"access_token  = %@",self.token);
    NSString *str = self.textView.text;

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"access_token": self.token,
                             @"status": str};
    [manager POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
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
