//
//  User.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/21.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize sccess_token;

-(NSString *)getSccess_token{
    sccess_token = _landingView.token;
    return sccess_token;
}

@end
