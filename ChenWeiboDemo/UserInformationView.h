//
//  UserInformationView.h
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/24.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface UserInformationView : UIView
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *FollowCountLabel;//关注数Label
@property (nonatomic,strong) UILabel *fansCountLabel;//粉丝数Label
@property (nonatomic,strong) UILabel *individualLabel;//简介Label
@property (nonatomic,strong) UIImageView *avatarImageViewi;//头像View

//初始化
-(id)init;
//背景图片
-(void)setBackgroundImage:(UIImage *)backgroundImage;
//头像
-(void)setAvatarImageView:(UIImage *)avatarImage;
//昵称
-(void)changeName:(NSString *)name;
//关注数
-(void)changeFollowCountLabel:(int)followCount;
//粉丝数
-(void)changeFansCountLabel:(int)fansCount;
//简介
-(void)changeIndividualLabel:(NSString *)individual;

@end
