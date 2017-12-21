//
//  QQCustomNavigationView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "QQCustomNavigationView.h"
#import "UIButton+Aliment.h"

@interface QQCustomNavigationView()
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation QQCustomNavigationView
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
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.centerY.equalTo(self.mas_top).offset(kStatusBarHeight + kNavBarHeight/2.0);
    }];
    [self.leftButton layoutImageTitleHorizontalOffSet:8];
    
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
    self.backView.alpha = ratio;
}

#pragma mark - Setter && Getter
- (UIView *)backView{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor colorWithRed:25/255.0 green:170/255.0 blue:233/255.0 alpha:1];
        _backView.bounds = self.bounds;
        _backView.alpha = 0;
    }
    return _backView;
}

- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_leftButton setTitle:@"首页" forState:UIControlStateNormal];
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
        _titleLabel.text = @"QQ空间";
        _titleLabel.alpha = 1;
    }
    return _titleLabel;
}

@end
