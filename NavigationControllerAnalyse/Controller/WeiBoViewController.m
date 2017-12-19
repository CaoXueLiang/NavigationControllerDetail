//
//  WeiBoViewController.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/17.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "WeiBoViewController.h"
#import "NormalTableViewCell.h"
#import "WeiBoHeaderView.h"
#import "WeiBoCustomNavigationView.h"
#import "UIScrollView+APParallaxHeader.h"

@interface WeiBoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@property (nonatomic,assign) UIStatusBarStyle barStyle;
@property (nonatomic,strong) WeiBoHeaderView *headView;
@property (nonatomic,strong) WeiBoCustomNavigationView *navigationView;
@end

@implementation WeiBoViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.myTable];
    [self.myTable addParallaxWithView:self.headView andHeight:CGRectGetHeight(self.headView.frame)];
    [self.view addSubview:self.navigationView];
    if (@available(iOS 11.0, *)){
        self.myTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.fd_prefersNavigationBarHidden = YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.myTable.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.barStyle;
}

#pragma mark - Event Response
- (void)moreClicked{
    NSLog(@"点击了更多");
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalTableViewCell" forIndexPath:indexPath];
    [cell setTitle:[NSString stringWithFormat:@"当前索引_%ld",indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [NormalTableViewCell cellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y + 200;
    [self.navigationView setAttributesWithOffSet:offsetY];
    
    CGFloat ratio = MIN(MAX(0, offsetY / (200 - 2 *KTopHeight)), 1);
    if (ratio < 0.5) {
        self.barStyle = UIStatusBarStyleLightContent;
    }else{
        self.barStyle = UIStatusBarStyleDefault;
    }
    [self setNeedsStatusBarAppearanceUpdate];
    
    NSLog(@"%f",offsetY);
}

#pragma mark - Setter && Getter
- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight  - KTabbarSafeBottomMargin) style:UITableViewStylePlain];
        [_myTable registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"NormalTableViewCell"];
        _myTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _myTable.tableFooterView = [UIView new];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

- (WeiBoCustomNavigationView *)navigationView{
    if (!_navigationView) {
        @weakify(self);
        _navigationView = [WeiBoCustomNavigationView new];
        _navigationView.backBlock = ^{
            [weak_self.navigationController popViewControllerAnimated:YES];
        };
        _navigationView.moreBlock = ^{
            NSLog(@"点击了more按钮");
        };
    }
    return _navigationView;
}

- (WeiBoHeaderView *)headView{
    if (!_headView) {
        _headView = [[WeiBoHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    }
    return _headView;
}

@end
