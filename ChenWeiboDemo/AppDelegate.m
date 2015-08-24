//
//  AppDelegate.m
//  ChenWeiboDemo
//
//  Created by 陈升琪 on 15/8/18.
//  Copyright (c) 2015年 陈升琪. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "LandingView.h"
#import "Masonry.h"
#import "User.h"
#import "WeiboAPIManager.h"



@interface AppDelegate ()

@property (nonatomic,strong)LandingView *landingView;

@end

@implementation AppDelegate
@synthesize rootView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.rootView = [[ViewController alloc]init];
    [self.window setRootViewController:self.rootView];
    [self.window makeKeyAndVisible];
    
    
    
    
    tabBarController = [[UITabBarController alloc]init];
    [self.window setRootViewController:tabBarController];
    
    FirstViewController *first = [[FirstViewController alloc]init];
    SecondViewController *second = [[SecondViewController alloc]init];
    ThirdViewController  *third = [[ThirdViewController alloc]init];
    
    User *user = [User new];
    WeiboAPIManager *weiboAPIManger = [WeiboAPIManager new];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:first,second,third,nil];
    
    UIImage * image1 = [UIImage imageNamed:@"sad.png"];
    UIImage * image2 = [UIImage imageNamed:@"bigsmile.png"];
    UIImage * image3 = [UIImage imageNamed:@"tongue.png"];
    UIImage * image4 = [UIImage imageNamed:@"smirk.png"];
    UIImage * image5 = [UIImage imageNamed:@"blah.png"];
    UIImage * image6 = [UIImage imageNamed:@"scream.png"];
    
    
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *firstItem = [[tabBar.items objectAtIndex:0]initWithTitle:@"发微博" image:image1 selectedImage:image2];
    UITabBarItem *secondItem = [[tabBar.items objectAtIndex:1]initWithTitle:@"信息" image:image3 selectedImage:image4];
    UITabBarItem *thirdItem = [[tabBar.items objectAtIndex:2]initWithTitle:@"个人" image:image5 selectedImage:image6];
    
    tabBar.backgroundColor = [UIColor grayColor];
    
    
    tabBar.barStyle = UIBarStyleBlack;
    
    tabBar.selectedImageTintColor = [UIColor colorWithRed:128.0f green:0.0f blue:150.0f alpha:1.0f];
   
    _landingView = [[LandingView alloc]init];
    
   
    first.landinView = _landingView;
    weiboAPIManger.landingView = first.landinView;
    
    [self.window addSubview:_landingView];
    [_landingView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.window.mas_top);
        make.left.equalTo(self.window.mas_left);
        make.right.equalTo(self.window.mas_right);
        make.bottom.equalTo(self.window.mas_bottom);
    }];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(callback) name:@"cancelView" object:nil];
    
    
    return YES;
}
-(void)callback{
    _landingView.hidden = YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
