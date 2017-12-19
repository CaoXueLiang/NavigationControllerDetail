//
//  WeiBoCustomNavigationView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/19.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "WeiBoCustomNavigationView.h"
#import "UIButton+Aliment.h"

#define TRANSFORM_DISTANCE (200 - 2 *KTopHeight)
@interface WeiBoCustomNavigationView()
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation WeiBoCustomNavigationView
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
    
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
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

- (void)more{
    if (_moreBlock) {
        _moreBlock();
    }
}

#pragma mark - Public Menthod
- (void)setAttributesWithOffSet:(CGFloat)offset{
    CGFloat ratio = MIN(MAX(0, offset / TRANSFORM_DISTANCE), 1);
    self.backView.alpha = ratio;
    
    if (ratio < 0.5) {
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.rightButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        self.titleLabel.text = @"";
    }else{
        self.titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:ratio];
        [self.leftButton setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:ratio] forState:UIControlStateNormal];
        [self.leftButton setImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
        [self.rightButton setImage:[UIImage imageNamed:@"more_black"] forState:UIControlStateNormal];
        self.titleLabel.text = @"_誌念";
    }
}

#pragma mark - Setter && Getter
- (UIView *)backView{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *tmpView = [[UIVisualEffectView alloc]initWithEffect:effect];
        tmpView.frame = self.bounds;
        tmpView.alpha = 0.9;
        _backView.bounds = self.bounds;
        _backView.alpha = 0;
        [_backView addSubview:tmpView];
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

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"_誌念";
        _titleLabel.alpha = 1;
    }
    return _titleLabel;
}

@end
