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

@interface GradualChangeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@property (nonatomic,strong) UIImageView *headerImageView;
@end

@implementation GradualChangeController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"导航栏渐变";
    [self.view addSubview:self.myTable];
    [self.myTable addParallaxWithView:self.headerImageView andHeight:CGRectGetHeight(self.headerImageView.frame)];
    if (@available(iOS 11.0, *)){
        self.myTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [[self.navigationController.navigationBar subviews] objectAtIndex:1].alpha = 0;
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
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
    
}

#pragma mark - Setter && Getter
- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - KTopHeight - KTabbarSafeBottomMargin) style:UITableViewStylePlain];
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
        _headerImageView.frame = CGRectMake(0, 0, kScreenWidth, 200);
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

@end
