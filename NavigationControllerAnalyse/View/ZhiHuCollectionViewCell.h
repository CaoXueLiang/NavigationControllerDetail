//
//  ZhiHuCollectionViewCell.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZhiHuHotModel;
@interface ZhiHuCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) ZhiHuHotModel *model;
+ (CGSize)cellSizeWithModel:(ZhiHuHotModel *)model;
@end
