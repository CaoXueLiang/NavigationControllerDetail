//
//  ZhiHuCustomNavigationView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuCustomNavigationView.h"

@implementation ZhiHuCustomNavigationView
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
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(kStatusBarHeight);
    }];
    
    [self addSubview:self.navigationBarView];
    [self.navigationBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.topView.mas_bottom);
    }];
    
    [self addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.centerY.equalTo(self.mas_top).offset(kStatusBarHeight + kNavBarHeight/2.0);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_top).offset(kStatusBarHeight + kNavBarHeight/2.0);
        make.centerX.equalTo(self);
    }];
}

#pragma mark - Event Response
- (void)back{
    if (_backBlock) {
        _backBlock();
    }
}

#pragma mark - Public Menthod
- (void)setAttributesWithOffSet:(CGFloat)offset{
    CGFloat ratio = MIN(MAX(0, offset / (250 - KTopHeight)), 1);
    self.topView.alpha = ratio;
    self.navigationBarView.alpha = ratio;
}

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title ? : @"";
}

#pragma mark - Setter && Getter
- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor colorWithRed:16/255.0 green:122/255.0 blue:204/255.0 alpha:1];
        _topView.alpha = 0;
    }
    return _topView;
}

- (UIView *)navigationBarView{
    if (!_navigationBarView) {
        _navigationBarView = [UIView new];
        _navigationBarView.backgroundColor = [UIColor colorWithRed:16/255.0 green:122/255.0 blue:204/255.0 alpha:1];
        _navigationBarView.alpha = 0;
    }
    return _navigationBarView;
}

- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"horizontal"] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:14.5];
        [_leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"知乎日报";
        _titleLabel.alpha = 1;
    }
    return _titleLabel;
}

@end
