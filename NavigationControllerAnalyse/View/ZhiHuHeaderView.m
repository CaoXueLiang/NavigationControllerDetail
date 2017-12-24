//
//  ZhiHuHeaderView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuHeaderView.h"

@interface ZhiHuHeaderView()
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation ZhiHuHeaderView
#pragma mark - Init Menthod
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
      [self addSubViews];
      self.contentView.backgroundColor = [UIColor colorWithRed:16/255.0 green:122/255.0 blue:204/255.0 alpha:1];
    }
    return self;
}

- (void)addSubViews{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

#pragma mark - Public Menthod
- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title ? : @"";
}

+ (CGFloat)headerHeight{
    return kNavBarHeight;
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

@end

