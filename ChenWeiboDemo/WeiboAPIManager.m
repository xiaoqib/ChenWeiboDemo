//
//  WeiboAPIManager.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/21.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "WeiboAPIManager.h"
#import "AFNetworking.h"

@implementation WeiboAPIManager
@synthesize sccess_token;

-(id)initWithDelegate:(id)theDelegate{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - 获取最新的关注的和自己微博
-(void)getPublicTimelineWithCount:(int)count withPage:(int)page{
   // 返回最新的微博 https://api.weibo.com/2/statuses/friends_timeline.json
   
    sccess_token =@"2.00bbxnbDlad46D750c2443devtOLHC";
    NSLog(@"sccess_token值 = %@",sccess_token);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *countString = [NSString stringWithFormat:@"%d",count];
    NSString *pageString = [NSString stringWithFormat:@"%d",page];
    
    NSDictionary *parameters = @{@"access_token": sccess_token,
                                 @"count":countString,
                                 @"page":pageString};
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parameters success:^(AFHTTPRequestOperation *operation,id responseObject){
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation,NSError *error){
        NSLog(@"Error:%@",error);
    }];
    
}
@end

