//
//  NormalTableViewCell.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/15.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "NormalTableViewCell.h"

@interface NormalTableViewCell()
@property (nonatomic,strong) UILabel *tipLabel;
@end

@implementation NormalTableViewCell
#pragma mark - Init Menthod
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.tipLabel];
        self.tipLabel.centerY = self.contentView.centerY;
    }
    return self;
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
        _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, kScreenWidth - 40, 30)];
        _tipLabel.font = [UIFont systemFontOfSize:15];
        _tipLabel.textColor = [UIColor blackColor];
    }
    return _tipLabel;
}

@end
