//
//  QQCustomNavigationView.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 QQ自定义导航栏
 */
@interface QQCustomNavigationView : UIView
@property (nonatomic,copy) void(^backBlock)(void);
- (void)setAttributesWithOffSet:(CGFloat)offset;
@end
