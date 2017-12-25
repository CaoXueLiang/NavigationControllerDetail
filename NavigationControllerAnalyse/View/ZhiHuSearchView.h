//
//  ZhiHuSearchView.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZhiHuSearchViewDelegate <NSObject>
- (void)scrollViewDidScroll;
@end

@interface ZhiHuSearchView : UIView
@property (nonatomic,weak) id<ZhiHuSearchViewDelegate> delegate;
@end
