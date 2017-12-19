//
//  UINavigationBar+Simple.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/19.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "UINavigationBar+Simple.h"

@implementation UINavigationBar (Simple)
- (void)setNavigationBarBackgroundColor:(UIColor *)color{
    [self setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
}

- (void)setNavigationBarAlpha:(CGFloat)alpha{
    UIView * barBackground = self.subviews.firstObject;
    if (@available(iOS 11.0, *))
    {
        for (UIView *tmp in barBackground.subviews) {
            tmp.alpha = alpha;
        }
    } else {
        barBackground.alpha = alpha;
    }
}

- (void)setStautsBarStyle:(UIBarStyle)barStyle{
    self.barStyle = barStyle;
}

- (void)setNavigationBarTitleColor:(UIColor *)color{
    self.tintColor = color;
}

- (void)hideShadowImage:(BOOL)hide{
    self.shadowImage = hide ? [UIImage new] : nil;
}

- (void)setNavigationTitleFont:(UIFont *)font{
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: font,
                                     };
    [self setTitleTextAttributes:textAttributes];
}

- (void)setNavigationTitleColor:(UIColor *)color{
    NSDictionary *textAttributes = @{
                                     NSForegroundColorAttributeName: color,
                                     };
    [self setTitleTextAttributes:textAttributes];
}

@end
