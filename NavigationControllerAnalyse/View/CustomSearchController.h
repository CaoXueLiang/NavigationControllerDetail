//
//  CustomSearchController.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSearchBar.h"

@interface CustomSearchController : UISearchController
@property (nonatomic,strong) CustomSearchBar *customSearchBar;

/**
 初始化搜索控制器

 @param searchResultsController 搜索结果控制器
 @param frame 搜索栏的大小
 @param placeholder 占位提示文字
 @param leftView textField的leftView
 @param showCancelButton 是否显示取消按钮
 @param barTintColor 光标颜色
 @return 搜索控制器
 */
- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController
                                 searchBarFrame:(CGRect)frame
                                    placeholder:(NSString *)placeholder
                              textFieldLeftView:(UIImageView *)leftView
                               showCancelButton:(BOOL)showCancelButton
                                   barTintColor:(UIColor *)barTintColor;
@end

