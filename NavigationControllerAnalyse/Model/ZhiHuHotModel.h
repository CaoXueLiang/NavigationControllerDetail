//
//  ZhiHuHotModel.h
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/23.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 知乎热搜model
 */
typedef NS_ENUM(NSInteger, CellType) {
    CellTypeNormal,
    CellTypeHot,
    CellTypeSearch,
};

@interface ZhiHuHotModel : NSObject
@property (nonatomic,copy) NSString *tip;
@property (nonatomic,assign) CellType type;
@end
