//
//  ViewController.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/18.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "ViewController.h"
#import "LandingView.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic,strong) UIWebView *webView;

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString *url = @"https://api.weibo.com/oauth2/authorize?client_id=3123440635&redirect_uri=https://api.weibo.com/oauth2/default.html&response_type=code&display=mobile;";
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    
    [self.webView setDelegate:self];
    [self.webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    LandingView *landingView = [[LandingView alloc]initWithFrame:self.view.frame];;
//    
//    [self.view addSubview:landingView];
    self.webView = [[UIWebView alloc]init];
    
    [self.view addSubview:self.webView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebView的代理方法

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"222222222");
    
    NSString *url = webView.request.URL.absoluteString;
    NSLog(@"absolutestring:%@",url);
    
    //找到" code= " 的range
    NSRange rangeOne;
    rangeOne = [url rangeOfString:@"="];
    
    //获取code值
    NSString * codeString = [url substringFromIndex:rangeOne.location+1];
    NSLog(@"code = :%@",codeString);
    
    //access token 调用URL的string
    NSMutableString *muString = [[NSMutableString alloc]initWithString:@"https://api.weibo.com/oauth2/access_token?client_id=3123440635&client_secret=ab212d5577205050de55a0f2c41d8477&grant_type=authorization_code&redirect_uri=https://api.weibo.com/oauth2/default.html&code="];
    [muString appendString:codeString];
    NSLog(@"access token url :%@",muString);
        
    //第一步,创建URL
    NSURL *urlString = [NSURL URLWithString:muString];
    //第二部，创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    NSString *str = @"type=focus-c";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //第三步,连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
        
    NSLog(@"Back String :%@",str1);
        
    NSError *error;
    //如何从str1中获取到access_token
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableContainers error:&error];
        
    NSString *_access_token = [dictionary objectForKey:@"access_token"];
        
    NSLog(@"access token is:%@",_access_token);

}


@end
