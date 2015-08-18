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

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLandingButton];
//        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
-(void)addLandingButton{
    UIButton *landingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [landingButton setTitle:@"登录新浪账号" forState:UIControlStateNormal];
    
    landingButton.layer.cornerRadius = 5.0;
    
    landingButton.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:landingButton];
    [landingButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).with.offset(-50);
        make.left.equalTo(self.mas_left).with.offset(60);
        make.right.equalTo(self.mas_right).with.offset(-60);
        make.height.equalTo(@(40));
    }];
}

@end
