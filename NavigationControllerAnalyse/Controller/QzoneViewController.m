//
//  QzoneViewController.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "QzoneViewController.h"
#import "NormalTableViewCell.h"
#import "QQCustomNavigationView.h"

static CGFloat IMAGEHEIGHT = 250;
static CGFloat MaxDropDownHeight = 100;
@interface QzoneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) QQCustomNavigationView *navigationView;
@end

@implementation QzoneViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.myTable];
    [self.myTable addSubview:self.headImageView];
    self.myTable.contentInset = UIEdgeInsetsMake(IMAGEHEIGHT, 0, 0, 0);
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
    return UIStatusBarStyleLightContent;
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
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //改变导航栏的透明度
    [self.navigationView setAttributesWithOffSet:offsetY + IMAGEHEIGHT];
    
    //下拉时改变图片的高度和初始的Y值
    if (offsetY < -IMAGEHEIGHT) {
        self.headImageView.top = offsetY;
        self.headImageView.height = fabs(offsetY);
    }
    
    //限制最大下拉高度
    if (offsetY < -(IMAGEHEIGHT + MaxDropDownHeight)) {
        [self.myTable setContentOffset:CGPointMake(0, -(IMAGEHEIGHT + MaxDropDownHeight))];
    }
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

- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"qqbg"]];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.clipsToBounds = YES;
        _headImageView.frame = CGRectMake(0, -IMAGEHEIGHT, kScreenWidth, IMAGEHEIGHT);
    }
    return _headImageView;
}

- (QQCustomNavigationView *)navigationView{
    if (!_navigationView) {
        @weakify(self);
        _navigationView = [QQCustomNavigationView new];
        _navigationView.backBlock = ^{
            [weak_self.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navigationView;
}

@end
