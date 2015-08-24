//
//  UserInformationView.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/24.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "UserInformationView.h"

@implementation UserInformationView
@synthesize backgroundImageView; //背景
@synthesize nameLabel;//名字
@synthesize FollowCountLabel;// 关注数
@synthesize fansCountLabel;// 粉丝数
@synthesize individualLabel;//简介
@synthesize avatarImageViewi;//头像

-(id)init{
    self = [super init];
    if (self) {
        [self addSomeControls];
    }
    return self;
}
-(void)addSomeControls{
    backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj2.jpg"]];
    [self addSubview:backgroundImageView];
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    avatarImageViewi = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_2522.JPG"]];
    avatarImageViewi.layer.masksToBounds = YES;
    avatarImageViewi.layer.cornerRadius = 35;
    [backgroundImageView addSubview:avatarImageViewi];
    [avatarImageViewi mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo (self.mas_centerY).with.offset(-40);
        make.size.height.equalTo(@(70));
        make.size.width.equalTo(@(70));
    }];
    nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"陳升琪";
    nameLabel.font = [UIFont systemFontOfSize:15];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        
    }];
    
}
-(void)setBackgroundImage:(UIImage *)backgroundImage{
    [backgroundImageView setImage:backgroundImage];
}
-(void)setAvatarImageView:(UIImage *)avatarImage{
    [avatarImageViewi setImage:avatarImage];
}
@end
