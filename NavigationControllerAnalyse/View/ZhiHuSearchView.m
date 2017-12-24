//
//  ZhiHuSearchView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuSearchView.h"
#import "ZhiHuCollectionViewCell.h"
#import "ZhiHuHotModel.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "ZHiHuSeaarchHeaderView.h"
#import "ZhiHuSearchFootView.h"

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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.hotArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZhiHuHotModel *model = self.hotArray[indexPath.item];
    ZhiHuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZhiHuCollectionViewCell" forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        ZHiHuSeaarchHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZHiHuSeaarchHeaderView" forIndexPath:indexPath];
        [header setTip:@"知乎热搜"];
        return header;
    }else if ([kind isEqual:UICollectionElementKindSectionFooter]){
        ZhiHuSearchFootView *foot = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ZhiHuSearchFootView" forIndexPath:indexPath];
        foot.historyArray = self.historyArray;
        return foot;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZhiHuHotModel *model = self.hotArray[indexPath.item];
    return [ZhiHuCollectionViewCell cellSizeWithModel:model];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return [ZHiHuSeaarchHeaderView headerSize];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return [ZhiHuSearchFootView footSizeWithArray:self.historyArray];
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
        [_myCollection registerClass:[ZHiHuSeaarchHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZHiHuSeaarchHeaderView"];
        [_myCollection registerClass:[ZhiHuSearchFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ZhiHuSearchFootView"];
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
