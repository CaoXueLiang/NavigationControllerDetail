//
//  CustomNavigationBarView.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/16.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义导航栏渐变View
 */
@interface CustomNavigationBarView : UIView
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIVisualEffectView *effectView;
@property (nonatomic,strong) UIView *centerView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@end
