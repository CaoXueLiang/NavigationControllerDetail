//
//  CustomNavigationBarView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/16.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "CustomNavigationBarView.h"

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
    NSString *detailStr = @"副标题";
    CGSize titleSize = [titleStr sizeForFont:[UIFont systemFontOfSize:12] size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    CGSize detailSize = [detailStr sizeForFont:[UIFont systemFontOfSize:11] size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    CGFloat maxWidth = MAX(titleSize.width, detailSize.width);
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.frame = CGRectMake(0, 5, maxWidth, titleSize.height);
    _titleLabel.text = titleStr;
    
    _detailLabel = [[UILabel alloc]init];
    _detailLabel.font = [UIFont systemFontOfSize:11];
    _detailLabel.textColor = [UIColor whiteColor];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.frame = CGRectMake(0, titleSize.height + 5, maxWidth, detailSize.height);
    _detailLabel.text = detailStr;
    
    _centerView = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidth - maxWidth)/2.0, KTopHeight, maxWidth, 10 + titleSize.height + detailSize.height)];
    [_centerView addSubview:_titleLabel];
    [_centerView addSubview:_detailLabel];
    [_bgImageView addSubview:_centerView];
}

@end
