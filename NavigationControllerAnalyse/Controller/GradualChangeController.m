//
//  GradualChangeController.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/16.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "GradualChangeController.h"
#import "NormalTableViewCell.h"
#import "UIScrollView+APParallaxHeader.h"
#import "CustomNavigationBarView.h"

static CGFloat HEADERHEIGHT = 250;
@interface GradualChangeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) CustomNavigationBarView *navigationView;
@end

@implementation GradualChangeController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"导航栏渐变";
    [self.view addSubview:self.myTable];
    [self.myTable addParallaxWithView:self.headerImageView andHeight:CGRectGetHeight(self.headerImageView.frame)];
    [self.view addSubview:self.navigationView];
    [self.view addSubview:self.leftButton];
    self.leftButton.frame = CGRectMake(0, kStatusBarHeight, 44, 44);
    self.fd_prefersNavigationBarHidden = YES;
    if (@available(iOS 11.0, *)){
        self.myTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.myTable.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Event Response
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalTableViewCell" forIndexPath:indexPath];
    [cell setTitle:[NSString stringWithFormat:@"索引_%ld",indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [NormalTableViewCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat newOffset = offsetY + HEADERHEIGHT;
    CGFloat ratio = MIN(MAX(0, newOffset / (HEADERHEIGHT - 64)), 1);
    self.navigationView.alpha = ratio;
    
    CGFloat distance = newOffset;
    CGFloat centerViewHeight = CGRectGetHeight(self.navigationView.centerView.bounds);
    CGFloat endY = kStatusBarHeight + (kNavBarHeight - centerViewHeight)/2.0;
    if (distance <= 60) {
        self.navigationView.centerView.top = KTopHeight;
    }else if (distance > 60 && distance <= 60 + centerViewHeight){
        self.navigationView.centerView.top = KTopHeight - (distance - 60);
    }else{
        self.navigationView.centerView.top = endY;
    }
    NSLog(@"%f",distance);
}

#pragma mark - Setter && Getter
- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - KTabbarSafeBottomMargin) style:UITableViewStylePlain];
        [_myTable registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"NormalTableViewCell"];
        _myTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _myTable.tableFooterView = [UIView new];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
        _headerImageView.frame = CGRectMake(0, 0, kScreenWidth, HEADERHEIGHT);
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (CustomNavigationBarView *)navigationView{
    if (!_navigationView) {
        _navigationView = [CustomNavigationBarView new];
    }
    return _navigationView;
}

@end


