//
//  ZhiHuNormalTableViewCell.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuNormalTableViewCell.h"

@interface ZhiHuNormalTableViewCell()
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIButton *deleteButton;
@end

@implementation ZhiHuNormalTableViewCell
#pragma mark - Init Menthod
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)addSubViews{
    [self.contentView addSubview:self.leftImageView];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.contentView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.contentView addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.leftImageView.mas_right).offset(12);
        make.right.equalTo(self.deleteButton.mas_left).offset(10);
    }];
}

#pragma mark - Event Response
- (void)deleteHistory{
    
}

#pragma mark - Public Menthod
- (void)setTitle:(NSString *)title{
    self.tipLabel.text = title ? : @"";
}

+ (CGFloat)cellHeight{
    return 50;
}

#pragma mark - Setter && Getter
- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.font = [UIFont systemFontOfSize:12];
        _tipLabel.textColor = RGBA(77, 77, 77, 1);
    }
    return _tipLabel;
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Night_ZHSearch_History"]];
    }
    return _leftImageView;
}

- (UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"ZHSearchHistoryDelete_Highlight"] forState:UIControlStateHighlighted];
        [_deleteButton setImage:[UIImage imageNamed:@"ZHSearchHistoryDelete_Normal"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteHistory) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

@end
