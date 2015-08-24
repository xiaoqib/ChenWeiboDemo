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


-(id)init;

-(void)setBackgroundImage:(UIImage *)backgroundImage;

-(void)setAvatarImageView:(UIImage *)avatarImage;
@end
