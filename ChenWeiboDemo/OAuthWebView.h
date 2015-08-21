//
//  LandingView.h
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/18.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingView : UIView<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) NSString *access_token;
@property (nonatomic,strong) NSString *token;
@property BOOL isGetToken;
-(id)init;

@end
