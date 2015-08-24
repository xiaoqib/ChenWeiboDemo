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
    nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor whiteColor];
    [backgroundImageView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(avatarImageViewi.mas_bottom).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.size.height.equalTo(@(19));
    }];
    UIView *splitView = [[UIView alloc]init];
    splitView.backgroundColor = [UIColor whiteColor];
    [backgroundImageView addSubview:splitView];
    [splitView mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(nameLabel.mas_bottom).with.offset(20);
        make.height.equalTo(@(17));
        make.width.equalTo(@(2));
    }];
    
    UILabel *followLabel =[[UILabel alloc]init];
    followLabel.text = @"关注";
    followLabel.textColor =[UIColor whiteColor];
    [backgroundImageView addSubview:followLabel];
    [followLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(splitView.mas_centerY);
        make.right.equalTo(splitView.mas_left).with.offset(-62);
        make.width.equalTo(@(38));
        make.height.equalTo(@(15));
    }];
    
    FollowCountLabel = [[UILabel alloc]init];
    FollowCountLabel.text = @"100";
    FollowCountLabel.textColor = [UIColor whiteColor];
    FollowCountLabel.textAlignment = NSTextAlignmentCenter;
    [backgroundImageView addSubview:FollowCountLabel];
    [FollowCountLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(splitView.mas_centerY);
        make.right.equalTo(splitView.mas_left).with.offset(-16);
        make.left.equalTo(followLabel.mas_right).with.offset(16);
        make.height.equalTo(@(15));
    }];
    
    UILabel *fansLabel =[[UILabel alloc]init];
    fansLabel.text = @"粉丝";
    fansLabel.textColor =[UIColor whiteColor];
    [backgroundImageView addSubview:fansLabel];
    [fansLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(splitView.mas_centerY);
        make.left.equalTo(splitView.mas_right).with.offset(16);
        make.width.equalTo(@(38));
        make.height.equalTo(@(15));
    }];
    fansCountLabel = [[UILabel alloc]init];
    fansCountLabel.text = @"100000";
    fansCountLabel.textColor = [UIColor whiteColor];
    fansCountLabel.textAlignment = NSTextAlignmentLeft;
    [backgroundImageView addSubview:fansCountLabel];
    [fansCountLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(splitView.mas_centerY);
        make.left.equalTo(fansLabel.mas_right).with.offset(16);
        make.width.equalTo(@(200));
        make.height.equalTo(@(15));
    }];
    //简介
    individualLabel = [[UILabel alloc]init];
    individualLabel.textAlignment = NSTextAlignmentCenter;
    individualLabel.text = @"I am one of the those ,Melodramatic fools";
    individualLabel.textColor = [UIColor whiteColor];
    [backgroundImageView addSubview:individualLabel];
    [individualLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.equalTo(@(15));
        make.top.equalTo(splitView.mas_bottom).with.offset(20);
    }];
}
//改背景
-(void)setBackgroundImage:(UIImage *)backgroundImage{
    [backgroundImageView setImage:backgroundImage];
}
//改头像
-(void)setAvatarImageView:(UIImage *)avatarImage{
    [avatarImageViewi setImage:avatarImage];
}
//昵称
-(void)changeName:(NSString *)name{
    nameLabel.text = name;
}
//关注数
-(void)changeFollowCountLabel:(int)followCount{
    FollowCountLabel.text = [NSString stringWithFormat:@"%d",followCount];
}
//粉丝数
-(void)changeFansCountLabel:(int)fansCount{
    fansCountLabel.text = [NSString stringWithFormat:@"%d",fansCount];
}
//简介
-(void)changeIndividualLabel:(NSString *)individual{
    individualLabel.text = individual;
}
@end
