//
//  UIButton+Aliment.m
//  demo
//
//  Created by bjovov on 2017/10/17.
//  Copyright © 2017年 CaoXueLiang.cn. All rights reserved.
//

#import "UIButton+Aliment.h"

@implementation UIButton (Aliment)
- (void)layoutImageTitleVerticalOffSet:(CGFloat)margin{
    CGFloat offset = margin;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, -self.imageView.frame.size.height-offset, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(-self.titleLabel.intrinsicContentSize.height-offset, 0, 0, -self.titleLabel.intrinsicContentSize.width);
}

- (void)layoutTitleImageVerticalOffSet:(CGFloat)margin{
    CGFloat offset = margin;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, self.imageView.frame.size.height+offset, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(self.titleLabel.intrinsicContentSize.height+offset, 0, 0, -self.titleLabel.intrinsicContentSize.width);
}

- (void)layoutImageTitleHorizontalOffSet:(CGFloat)margin{
    CGFloat offset = margin;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, offset/2, 0, -offset/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -offset/2, 0, offset/2);
}

- (void)layoutTitleImageHorizontalOffSet:(CGFloat)margin{
    CGFloat offset = margin;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width - offset/2, 0, self.imageView.frame.size.width + offset/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.intrinsicContentSize.width + offset/2, 0, -self.titleLabel.intrinsicContentSize.width - offset/2);
}

@end

