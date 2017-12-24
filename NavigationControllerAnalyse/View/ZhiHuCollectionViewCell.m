//
//  ZhiHuCollectionViewCell.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuCollectionViewCell.h"
#import "ZhiHuHotModel.h"

@interface ZhiHuCollectionViewCell()
@property (nonatomic,strong)  YYLabel *tagLabel;
@end

@implementation ZhiHuCollectionViewCell
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(242, 242, 242, 1);
        self.layer.cornerRadius = 28/2.0;
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    _tagLabel = [YYLabel new];
    _tagLabel.userInteractionEnabled = NO;
    _tagLabel.origin = CGPointMake(10, 0);
    _tagLabel.height = 28.0;
    _tagLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _tagLabel.displaysAsynchronously = NO;
    _tagLabel.ignoreCommonProperties = YES;
    _tagLabel.fadeOnAsynchronouslyDisplay = NO;
    [self.contentView addSubview:_tagLabel];
}

#pragma mark - Setter && Getter
- (void)setModel:(ZhiHuHotModel *)model{
    if (!model) {
        return;
    }
    _model = model;
    NSMutableAttributedString *tag = [self stringWithModel:model];
    CGSize size = CGSizeMake(kScreenWidth - 20, 28);
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainerSize:size text:tag];
    _tagLabel.textLayout = textLayout;
    _tagLabel.width = textLayout.textBoundingSize.width;
}

+ (CGSize)cellSizeWithModel:(ZhiHuHotModel *)model{
    ZhiHuCollectionViewCell *cell = [[ZhiHuCollectionViewCell alloc]init];
    NSMutableAttributedString *tag = [cell stringWithModel:model];
    CGSize size = CGSizeMake(kScreenWidth - 20, 28);
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainerSize:size text:tag];
    return CGSizeMake(textLayout.textBoundingSize.width + 20, 28);
}

- (NSMutableAttributedString *)stringWithModel:(ZhiHuHotModel *)model{
    
    NSMutableAttributedString *tipString = [[NSMutableAttributedString alloc]initWithString:model.tip];
    UIImage *searchImage = [UIImage imageNamed:@"Night_ZHSearchHistoryIcon"];
    UIImage *hotImage = [UIImage imageNamed:@"ZHSearch_Trending"];
    /*将图片转化为字符串*/
    NSMutableAttributedString *searchAttachment = [NSMutableAttributedString yy_attachmentStringWithContent:searchImage contentMode:UIViewContentModeCenter attachmentSize:searchImage.size alignToFont:[UIFont systemFontOfSize:14] alignment:YYTextVerticalAlignmentCenter];
    NSMutableAttributedString *hotAttacment = [NSMutableAttributedString yy_attachmentStringWithContent:hotImage contentMode:UIViewContentModeCenter attachmentSize:hotImage.size alignToFont:[UIFont systemFontOfSize:14] alignment:YYTextVerticalAlignmentCenter];
    
    if (model.type == CellTypeHot) {
        [tipString insertAttributedString:hotAttacment atIndex:0];
    }else if (model.type == CellTypeSearch){
        [tipString insertAttributedString:searchAttachment atIndex:0];
    }
    tipString.yy_font = [UIFont systemFontOfSize:14];
    tipString.yy_color = RGBA(77, 77, 77, 1);
    return tipString;
}

@end
