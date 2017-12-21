//
//  ZhiHuDailyViewController.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/20.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuDailyViewController.h"
#import "NormalTableViewCell.h"
#import "ZhiHuCustomNavigationView.h"
#import "ZhiHuHeaderView.h"

static CGFloat CAROUSELHEIGHT = 250;
static CGFloat MaxDropDownHeight = 100;
@interface ZhiHuDailyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@property (nonatomic,strong) ZhiHuCustomNavigationView *navigationView;
@property (nonatomic,strong) SDCycleScrollView *carouselView;
@end

@implementation ZhiHuDailyViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.myTable];
    [self.view addSubview:self.navigationView];
    [self.myTable addSubview:self.carouselView];
    self.myTable.contentInset = UIEdgeInsetsMake(CAROUSELHEIGHT, 0, 0, 0);
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalTableViewCell" forIndexPath:indexPath];
    [cell setTitle:[NSString stringWithFormat:@"当前索引%ld_%ld",indexPath.section,indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CGFLOAT_MIN)];
        header.backgroundColor = [UIColor clearColor];
        return header;
    }else{
        ZhiHuHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZhiHuHeaderView"];
        [header setTitle:[NSString stringWithFormat:@"分组索引%ld",section]];
        return header;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CGFLOAT_MIN)];
    foot.backgroundColor = [UIColor clearColor];
    return foot;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGFLOAT_MIN;
    }else{
        return [ZhiHuHeaderView headerHeight];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
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
     [self.navigationView setAttributesWithOffSet:offsetY + CAROUSELHEIGHT];

    //下拉时改变图片的高度和初始的Y值
    if (offsetY < -CAROUSELHEIGHT) {
        self.carouselView.frame = CGRectMake(0, offsetY, kScreenWidth, fabs(offsetY));
    }

    if (offsetY + CAROUSELHEIGHT < CAROUSELHEIGHT) {
        self.myTable.contentInset = UIEdgeInsetsMake(CAROUSELHEIGHT, 0, 0, 0);
    }else{
        self.myTable.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }

    //计算第一个sectionHeader的位置
    if (offsetY + kStatusBarHeight >= [NormalTableViewCell cellHeight] *10){
        [self.navigationView setTitle:@""];
        self.navigationView.navigationBarView.alpha = 0;
    }else{
        [self.navigationView setTitle:@"知乎日报"];
    }
}

#pragma mark - CarouselScrollViewDelegate
- (void)didSelectedIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个",index);
}

#pragma mark - Setter && Getter
- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight  - KTabbarSafeBottomMargin) style:UITableViewStylePlain];
        [_myTable registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"NormalTableViewCell"];
        [_myTable registerClass:[ZhiHuHeaderView class] forHeaderFooterViewReuseIdentifier:@"ZhiHuHeaderView"];
        _myTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _myTable.tableFooterView = [UIView new];
        _myTable.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CGFLOAT_MIN)];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

- (ZhiHuCustomNavigationView *)navigationView{
    if (!_navigationView) {
        @weakify(self);
        _navigationView = [ZhiHuCustomNavigationView new];
        _navigationView.backBlock = ^{
            [weak_self.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navigationView;
}

- (SDCycleScrollView *)carouselView{
    if (!_carouselView) {
        NSArray *imageArray = @[@"1",@"2",@"3"];
        _carouselView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -CAROUSELHEIGHT, kScreenWidth, CAROUSELHEIGHT) imageNamesGroup:imageArray];
        _carouselView.pageDotColor = [UIColor grayColor];
        _carouselView.currentPageDotColor = [UIColor orangeColor];
        _carouselView.titleLabelTextColor = [UIColor whiteColor];
        _carouselView.titleLabelTextFont = [UIFont systemFontOfSize:18];
        _carouselView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _carouselView;
}

@end
