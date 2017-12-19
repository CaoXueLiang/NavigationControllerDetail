//
//  UINavigationBar+Simple.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/19.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Simple)

/**
 设置导航栏的背景色
 @param color 背景色
 */
- (void)setNavigationBarBackgroundColor:(UIColor *)color;

/**
 设置导航栏的透明度
 @param alpha 透明度
 */
- (void)setNavigationBarAlpha:(CGFloat)alpha;

/**
 设置导航栏标题和按钮的颜色
 @param color 颜色
 */
- (void)setNavigationBarTitleColor:(UIColor *)color;

/**
 隐藏导航栏下面的那条线
 @param hide bool
 */
- (void)hideShadowImage:(BOOL)hide;

/**
 设置状态栏的样式，白色或者黑色
 @param barStyle 样式
 */
- (void)setStautsBarStyle:(UIBarStyle)barStyle;

/**
 设置导航栏的标题文字大小
 @param font 字体
 */
- (void)setNavigationTitleFont:(UIFont *)font;


/**
 设置导航栏的标题颜色
 @param color 颜色
 */
- (void)setNavigationTitleColor:(UIColor *)color;

@end

