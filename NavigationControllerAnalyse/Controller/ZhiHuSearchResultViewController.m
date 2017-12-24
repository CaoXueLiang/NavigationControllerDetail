//
//  ZhiHuSearchResultViewController.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuSearchResultViewController.h"
#import "CustomSearchController.h"
#import "ZhiHuSearchView.h"

@interface ZhiHuSearchResultViewController ()<UISearchBarDelegate>
@property (nonatomic,strong) CustomSearchController *searchController;
@property (nonatomic,strong) ZhiHuSearchView *searchView;
@end

@implementation ZhiHuSearchResultViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    [self addSubViews];
}

- (void)setNavigation{
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    leftView.bounds = CGRectMake(0, 0, 16, 16);
    self.searchController = [[CustomSearchController alloc]initWithSearchResultsController:self searchBarFrame:CGRectMake(0, 0, kScreenWidth - 80, 44) placeholder:@"搜索知乎内容" textFieldLeftView:leftView showCancelButton:YES barTintColor:[UIColor colorWithRed:12/255.0 green:107/255.0 blue:254/255.0 alpha:1]];
    [self.searchController.customSearchBar becomeFirstResponder];
    self.searchController.customSearchBar.delegate = self;
    self.navigationItem.titleView = self.searchController.customSearchBar;
    self.navigationItem.hidesBackButton = YES;
}

- (void)addSubViews{
    [self.view addSubview:self.searchView];
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@",searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"点击了搜索");
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Setter && Getter
- (ZhiHuSearchView *)searchView{
    if (!_searchView) {
        _searchView = [[ZhiHuSearchView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - KTopHeight - KTabbarSafeBottomMargin)];
    }
    return _searchView;
}

@end
