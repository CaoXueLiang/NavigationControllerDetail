//
//  ZHiHuHeaderView.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/24.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZHiHuSeaarchHeaderView.h"

@interface ZHiHuSeaarchHeaderView()
@property (nonatomic,strong) UILabel *tipLabel;
@end

@implementation ZHiHuSeaarchHeaderView
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLabel];
    }
    return self;
}

- (void)addLabel{
    [self addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-12);
    }];
}

#pragma mark - Public Menthod
- (void)setTip:(NSString *)tip{
    self.tipLabel.text = tip;
}

+ (CGSize)headerSize{
    return CGSizeMake(kScreenWidth, 50);
}

#pragma mark - Setter && Getter
- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.font = [UIFont boldSystemFontOfSize:20];
        _tipLabel.textColor = [UIColor blackColor];
    }
    return _tipLabel;
}

@end
