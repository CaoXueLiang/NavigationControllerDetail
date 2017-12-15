//
//  MainListViewController.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/15.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "MainListViewController.h"
#import "NormalTableViewCell.h"

@interface MainListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *myTable;
@end

@implementation MainListViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"首页";
    [self.view addSubview:self.myTable];
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalTableViewCell" forIndexPath:indexPath];
    [cell setTitle:self.dataArray[indexPath.row]];
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

#pragma mark - Setter && Getter
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"导航栏渐变"];
    }
    return _dataArray;
}

- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavBarHeight - KTabbarSafeBottomMargin) style:UITableViewStylePlain];
        [_myTable registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"NormalTableViewCell"];
        _myTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _myTable.tableFooterView = [UIView new];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

@end
