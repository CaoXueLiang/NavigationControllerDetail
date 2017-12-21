//
//  ZhiHuCustomNavigationView.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 知乎自定义导航栏
 */
@interface ZhiHuCustomNavigationView : UIView
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *navigationBarView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,copy) void(^backBlock)(void);
- (void)setAttributesWithOffSet:(CGFloat)offset;
- (void)setTitle:(NSString *)title;
@end
