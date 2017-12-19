//
//  UIButton+Aliment.h
//  demo
//
//  Created by bjovov on 2017/10/17.
//  Copyright © 2017年 CaoXueLiang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Aliment)

/**
 button图片文字垂直布局
 @param margin 间距
 */
- (void)layoutImageTitleVerticalOffSet:(CGFloat)margin;

/**
 button文字图片垂直布局
 @param margin 间距
 */
- (void)layoutTitleImageVerticalOffSet:(CGFloat)margin;

/**
 button文字图片水平布局
 @param margin 间距
 */
- (void)layoutTitleImageHorizontalOffSet:(CGFloat)margin;

/**
 button图片文字水平布局
 @param margin 间距
 */
- (void)layoutImageTitleHorizontalOffSet:(CGFloat)margin;

@end
