//
//  LandingView.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/18.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "LandingView.h"
#import "Masonry.h"



@implementation LandingView

-(id)init{
    self = [super init];
    if (self) {
        [self addLandingWebView];
        [self viewWillAppear:YES];
          NSLog(@"222222222");
      
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
//    [self viewWillAppear:animated];
    
    NSString *url = @"https://api.weibo.com/oauth2/authorize?client_id=3123440635&redirect_uri=https://api.weibo.com/oauth2/default.html&response_type=code&display=mobile;";
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
      NSLog(@"3333333");
    self.isGetToken = NO;
    [self.webView setDelegate:self];
    [self.webView loadRequest:request];
}

-(void)addLandingWebView{
    self.webView = [[UIWebView alloc]init];
    
    [self addSubview:self.webView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
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
    
    _access_token = [dictionary objectForKey:@"access_token"];
    
    NSLog(@"access token is:%@",_access_token);
    self.token = _access_token;
    if (_access_token != NULL) {
        
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"cancelView" object:self];
        
    }
    
}


@end
