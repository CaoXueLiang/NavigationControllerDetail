//
//  ZhiHuSearchView.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuSearchView.h"

@interface ZhiHuSearchView()
@property (nonatomic,strong) UITableView *myTable;
@end

@implementation ZhiHuSearchView
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
    self.myTable.frame = self.bounds;
    
    
}

#pragma mark - Setter && Getter

@end
