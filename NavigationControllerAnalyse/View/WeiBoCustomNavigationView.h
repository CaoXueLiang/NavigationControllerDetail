//
//  WeiBoCustomNavigationView.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/19.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 微博自定义导航栏
 */
@interface WeiBoCustomNavigationView : UIView
@property (nonatomic,copy) void(^backBlock)(void);
@property (nonatomic,copy) void(^moreBlock)(void);
- (void)setAttributesWithOffSet:(CGFloat)offset;

@end
