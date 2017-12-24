//
//  ZhiHuSearchFootView.m
//  NavigationControllerAnalyse
//
//  Created by 曹学亮 on 2017/12/24.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuSearchFootView.h"
#import "ZhiHuNormalTableViewCell.h"
#import "ZHiHuSeaarchHeaderView.h"

@interface ZhiHuSearchFootView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@end

@implementation ZhiHuSearchFootView
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.myTable];
    ZHiHuSeaarchHeaderView *header = [[ZHiHuSeaarchHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    [header setTip:@"搜索历史"];
    self.myTable.tableHeaderView = header;
}

#pragma mark - Public Menthod
- (void)setHistoryArray:(NSMutableArray *)historyArray{
    if (_historyArray == historyArray) {
        return;
    }
    _historyArray = historyArray;
    [self.myTable reloadData];
}

+ (CGSize)footSizeWithArray:(NSMutableArray *)array{
    return CGSizeMake(kScreenWidth, [ZhiHuNormalTableViewCell cellHeight] *array.count + 50);
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.historyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhiHuNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZhiHuNormalTableViewCell" forIndexPath:indexPath];
    [cell setTitle:self.historyArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ZhiHuNormalTableViewCell cellHeight];
}

#pragma mark - Setter && Getter
- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        [_myTable registerClass:[ZhiHuNormalTableViewCell class] forCellReuseIdentifier:@"ZhiHuNormalTableViewCell"];
        _myTable.tableFooterView = [UIView new];
        _myTable.bounces = NO;
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}
@end
