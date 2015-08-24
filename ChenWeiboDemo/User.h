//
//  User.h
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/21.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LandingView.h"

@interface User : NSObject{
    NSString *sccess_token;
}

@property (nonatomic,strong) NSString *sccess_token;
@property (nonatomic,strong) LandingView *landingView;

-(NSString *)getSccess_token;
@end
