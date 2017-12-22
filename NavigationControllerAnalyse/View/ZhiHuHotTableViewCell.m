//
//  ZhiHuHotTableViewCell.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuHotTableViewCell.h"
#import <UICollectionViewLeftAlignedLayout/UICollectionViewLeftAlignedLayout.h>

@interface ZhiHuHotTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateLeftAlignedLayout>
@property (nonatomic,strong) UICollectionView *myCollection;
@end

@implementation ZhiHuHotTableViewCell
#pragma mark - Init Menthod
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)addSubViews{
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itermArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(100, 20);
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
        UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
        _myCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, kScreenWidth, 100) collectionViewLayout:layout];
        _myCollection.backgroundColor = [UIColor whiteColor];
        _myCollection.showsVerticalScrollIndicator = NO;
        _myCollection.bounces = NO;
        _myCollection.dataSource = self;
        _myCollection.delegate = self;
        [_myCollection registerClass:[MLGoodColorCollectionViewCell class] forCellWithReuseIdentifier:@"MLGoodColorCollectionViewCell"];
        [_myCollection registerClass:[MLChoseStandardSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MLChoseStandardSectionHeader"];
        [_myCollection registerClass:[MLChoseStandardSectionFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MLChoseStandardSectionFootView"];
        [_myCollection registerClass:[MLChoseGoodTmpView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MLChoseGoodTmpView"];
    }
    return _myCollection;
}
@end
