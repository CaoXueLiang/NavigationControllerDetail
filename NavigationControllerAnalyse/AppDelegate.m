//
//  AppDelegate.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/15.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "MainListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainListViewController *controller = [[MainListViewController alloc]init];
    self.window.rootViewController = [[BaseNavigationController alloc]initWithRootViewController:controller];
    [self.window makeKeyAndVisible];
    
    //设置导航栏
    [self customSetting];
    return YES;
}

- (void)customSetting{
    //设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:(93 / 255.0) green:(174 / 255.0) blue:(33 / 255.0) alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    //去掉UINavigationBar下的那条线
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //返回按钮的箭头颜色
    [navigationBarAppearance setTintColor:[UIColor whiteColor]];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:20],
                                     NSForegroundColorAttributeName: [UIColor whiteColor],
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

@end
