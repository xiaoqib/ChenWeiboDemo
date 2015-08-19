//
//  AppDelegate.h
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/18.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UITabBarController *tabBarController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *rootView;


@end

