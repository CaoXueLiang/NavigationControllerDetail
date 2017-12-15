//
//  BaseNavigationController.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/15.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
