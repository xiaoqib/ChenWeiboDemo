//
//  WeiboAPIManager.h
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/21.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "LandingView.h"


@protocol WeiBoAPIDelegate <NSObject>


@optional
//获取最新的公共微博
-(void)didGetPublicTimelineWithStatues:(NSArray *)statusArr;

////发布一条微博
//-(void)PostWeibo;

@end
@interface WeiboAPIManager : NSObject


@property (nonatomic,strong) NSString *sccess_token;
@property (nonatomic,strong) LandingView *landingView;

-(id)initWithDelegate:(id)theDelegate;

//获取最新的公共微博
-(void)getPublicTimelineWithCount:(int)count withPage:(int)page;

@end
