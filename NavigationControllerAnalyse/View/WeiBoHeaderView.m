//
//  WeiBoHeaderView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/19.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "WeiBoHeaderView.h"

@interface WeiBoHeaderView()
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIImageView *avatar;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *attentionLabel;
@property (nonatomic,strong) UILabel *introLabel;
@end

@implementation WeiBoHeaderView
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.introLabel];
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.bottom.equalTo(self).offset(-12);
    }];
    
    [self addSubview:self.attentionLabel];
    [self.attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.introLabel.mas_top).offset(-8);
    }];
    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.attentionLabel.mas_top).offset(-8);
    }];
    
    [self addSubview:self.avatar];
    [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.bottom.equalTo(self.nameLabel.mas_top).offset(-8);
    }];
}

#pragma mark - Setter && Getter
- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.clipsToBounds = YES;
        _bgImageView.image = [UIImage imageNamed:@"weibobg"];
    }
    return _bgImageView;
}

- (UIImageView *)avatar{
    if (!_avatar) {
        _avatar = [[UIImageView alloc]init];
        _avatar.contentMode = UIViewContentModeScaleAspectFill;
        _avatar.clipsToBounds = YES;
        _avatar.image = [UIImage imageNamed:@"avatar"];
        _avatar.layer.cornerRadius = 70/2.0;
        _avatar.layer.borderColor = [UIColor whiteColor].CGColor;
        _avatar.layer.borderWidth = CGFloatFromPixel(1);
    }
    return _avatar;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"_誌念";
    }
    return _nameLabel;
}

- (UILabel *)attentionLabel{
    if (!_attentionLabel) {
        _attentionLabel = [UILabel new];
        _attentionLabel.textAlignment = NSTextAlignmentCenter;
        _attentionLabel.font = [UIFont systemFontOfSize:13];
        _attentionLabel.textColor = [UIColor whiteColor];
        _attentionLabel.text = @"关注 666 | 粉丝 666";
    }
    return _attentionLabel;
}

- (UILabel *)introLabel{
    if (!_introLabel) {
        _introLabel = [UILabel new];
        _introLabel.textAlignment = NSTextAlignmentCenter;
        _introLabel.font = [UIFont systemFontOfSize:13];
        _introLabel.textColor = [UIColor whiteColor];
        _introLabel.numberOfLines = 0;
        _introLabel.text = @"简介:测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    }
    return _introLabel;
}

@end
