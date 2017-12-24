//
//  ZhiHuSearchFootView.h
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/24.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhiHuSearchFootView : UICollectionReusableView
@property (nonatomic,strong) NSMutableArray *historyArray;
+ (CGSize)footSizeWithArray:(NSMutableArray *)array;
@end
