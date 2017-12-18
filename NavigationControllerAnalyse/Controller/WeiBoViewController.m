//
//  WeiBoViewController.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/17.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "WeiBoViewController.h"
#import "NormalTableViewCell.h"

@interface WeiBoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@end

@implementation WeiBoViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.myTable];
    [self setNavigation];
    if (@available(iOS 11.0, *)){
        self.myTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)setNavigation{
    UIBarButtonItem *rightIterm = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(moreClicked)];
    self.navigationItem.rightBarButtonItem = rightIterm;
}

#pragma mark - Event Response
- (void)moreClicked{
    
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

@end
