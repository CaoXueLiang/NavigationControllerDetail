//
//  ZhiHuSearchView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuSearchView.h"
#import "ZhiHuCollectionViewCell.h"
#import "ZhiHuNormalTableViewCell.h"
#import "ZhiHuHotModel.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "ZHiHuSeaarchHeaderView.h"

@interface ZhiHuSearchView()<UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateLeftAlignedLayout>
@property (nonatomic,strong) UICollectionView *myCollection;
@property (nonatomic,strong) UICollectionViewLeftAlignedLayout *layout;
@property (nonatomic,strong) NSMutableArray *hotArray;
@property (nonatomic,strong) NSMutableArray *historyArray;
@end

@implementation ZhiHuSearchView
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.myCollection.frame = self.bounds;
        [self addSubview:self.myCollection];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
       return self.hotArray.count;
    }else{
       return self.historyArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ZhiHuHotModel *model = self.hotArray[indexPath.item];
        ZhiHuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZhiHuCollectionViewCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }else{
        ZhiHuNormalTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZhiHuNormalTableViewCell" forIndexPath:indexPath];
        [cell setTitle:self.historyArray[indexPath.row]];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        ZHiHuSeaarchHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZHiHuSeaarchHeaderView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
           [header setTip:@"知乎热搜"];
        }else{
           [header setTip:@"搜索历史"];
        }
        return header;
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll)]) {
        [self.delegate scrollViewDidScroll];
    }
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ZhiHuHotModel *model = self.hotArray[indexPath.item];
        return [ZhiHuCollectionViewCell cellSizeWithModel:model];
    }else{
        return [ZhiHuNormalTableViewCell cellSize];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return [ZHiHuSeaarchHeaderView headerSize];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 12;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 12;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ZhiHuHotModel *model = self.hotArray[indexPath.item];
        NSLog(@"%@",model.tip);
    }else{
        NSLog(@"%@",self.historyArray[indexPath.row]);
    }
}

#pragma mark - Setter && Getter
- (UICollectionView *)myCollection{
    if (!_myCollection) {
        _layout = [[UICollectionViewLeftAlignedLayout alloc] init];
        _myCollection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_layout];
        _myCollection.backgroundColor = [UIColor whiteColor];
        _myCollection.showsVerticalScrollIndicator = NO;
        _myCollection.dataSource = self;
        _myCollection.delegate = self;
        [_myCollection registerClass:[ZhiHuCollectionViewCell class] forCellWithReuseIdentifier:@"ZhiHuCollectionViewCell"];
        [_myCollection registerClass:[ZhiHuNormalTableViewCell class] forCellWithReuseIdentifier:@"ZhiHuNormalTableViewCell"];
        [_myCollection registerClass:[ZHiHuSeaarchHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZHiHuSeaarchHeaderView"];
    }
    return _myCollection;
}

- (NSMutableArray *)hotArray{
    if (!_hotArray) {
        _hotArray = [[NSMutableArray alloc]init];
        NSArray *textArray = @[@"琅琊榜之风起长林",@"妖猫传",@"演员的诞生第九期",@"琅琊榜2",@"2017年度盘点",@"微信圣诞帽",@"KPL QGHAPPY"];
        [textArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *str = obj;
            ZhiHuHotModel *model = [[ZhiHuHotModel alloc]init];
            model.tip = str;
            if (idx == 0) {
                model.type = CellTypeSearch;
            }else if (idx > 0 && idx < 4){
                model.type = CellTypeHot;
            }else{
                model.type = CellTypeNormal;
            }
            [_hotArray addObject:model];
        }];
    }
    return _hotArray;
}

- (NSMutableArray *)historyArray{
    if (!_historyArray) {
        _historyArray = [[NSMutableArray alloc]init];
        NSArray *textArray = @[@"中兴 坠亡",@"柒个我",@"经常熬夜给女生买什么",@"卢本伟",@"美国税改",@"秦时明月"];
        [textArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *str = obj;
            [_historyArray addObject:str];
        }];
    }
    return _historyArray;
}

@end
