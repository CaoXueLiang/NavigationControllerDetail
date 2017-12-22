//
//  CustomSearchController.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "CustomSearchController.h"

@interface CustomSearchController ()

@end

@implementation CustomSearchController
#pragma mark - Init Menthod
- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController
                                 searchBarFrame:(CGRect)frame
                                    placeholder:(NSString *)placeholder
                              textFieldLeftView:(UIImageView *)leftView
                               showCancelButton:(BOOL)showCancelButton
                                   barTintColor:(UIColor *)barTintColor
{
    self = [super initWithSearchResultsController:searchResultsController];
    if (self) {
        self.customSearchBar = [[CustomSearchBar alloc]initWithFrame:frame placeholder:placeholder textFieldLeftView:leftView showCancelButton:YES tintColor:barTintColor];
        
        if (showCancelButton) {
            //设置取消按钮的状态
            UIButton *cancleButton = [self.customSearchBar valueForKey:@"cancelButton"];
            cancleButton.tintColor = [UIColor colorWithRed:12/255.0 green:107/255.0 blue:254/255.0 alpha:1];
            [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
            [self.customSearchBar setValue:cancleButton forKey:@"cancelButton"];
        }
    }
    return self;
}


@end
