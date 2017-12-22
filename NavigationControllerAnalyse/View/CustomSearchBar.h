//
//  CustomSearchBar.h
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSearchBar : UISearchBar

/**
 创建SearchBar

 @param frame frame
 @param placeholder 占位符
 @param leftView textField的leftView
 @param showCancelButton 是否显示取消按钮
 @param tintColor 光标颜色
 @return 自定义的SearchBar
 */
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton tintColor:(UIColor *)tintColor;

/**
 让searchBar的内容居左显示
 */
- (void)setLeftPlaceholder;

@end
