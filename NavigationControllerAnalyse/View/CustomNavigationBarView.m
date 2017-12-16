//
//  CustomNavigationBarView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/16.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "CustomNavigationBarView.h"

@interface CustomNavigationBarView()
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIVisualEffectView *effectView;
@property (nonatomic,strong) UIView *centerView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@end

@implementation CustomNavigationBarView
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    if (frame.size.height == 0 || frame.size.width == 0) {
        frame.size.height = KTopHeight;
        frame.size.width = kScreenWidth;
    }
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0;
    }
    return self;
}

- (void)addSubViews{
    _bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topBg"]];
    _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    _bgImageView.clipsToBounds = YES;
    _bgImageView.frame = self.bounds;
    [self addSubview:_bgImageView];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    _effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    _effectView.frame = self.bounds;
    _effectView.alpha = 0.9;
    [_bgImageView addSubview:_effectView];
    
    NSString *titleStr = @"哈哈这是一个父标题";
    NSString *detailStr = @"子标题";
    UILabel *
    _centerView = [UIView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

@end
