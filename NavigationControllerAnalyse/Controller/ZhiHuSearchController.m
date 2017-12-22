//
//  ZhiHuSearchController.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "ZhiHuSearchController.h"
#import "UIButton+Aliment.h"
#import "ZhiHuSearchResultViewController.h"

@interface ZhiHuSearchController ()
@property (nonatomic,strong) UILabel *tipLabel;
@end

@implementation ZhiHuSearchController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self setNavigation];
    [self addTipLabel];
}

- (void)addTipLabel{
    [self.view addSubview:self.tipLabel];
    self.tipLabel.frame = CGRectMake(0, 0, 200, 50);
    self.tipLabel.top = 200;
    self.tipLabel.centerX = self.view.centerX;
}

- (void)setNavigation{
    //隐藏左侧按钮
    [self.navigationItem setHidesBackButton:YES];
    
    //右侧按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"button_newpost_blue"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"button_newpost_highlight"] forState:UIControlStateHighlighted];
    [rightButton setTitle:@"提问" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithRed:12/255.0 green:107/255.0 blue:254/255.0 alpha:1] forState:UIControlStateNormal];
    [rightButton layoutImageTitleHorizontalOffSet:12];
    [rightButton addTarget:self action:@selector(askQuestion) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    //中间搜索按钮
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"search_select"] forState:UIControlStateHighlighted];
    [titleButton setTitle:@"知乎搜索" forState:UIControlStateNormal];
    [titleButton setTitle:@"知乎搜索" forState:UIControlStateHighlighted];
    [titleButton setTitleColor:[UIColor colorWithHexString:@"8a8a8a"] forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor colorWithHexString:@"bfbfbf"] forState:UIControlStateHighlighted];
    [titleButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"f6f7f8"]] forState:UIControlStateNormal];
    [titleButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"f6f7f8"]] forState:UIControlStateHighlighted];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [titleButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [titleButton layoutImageTitleHorizontalOffSet:5];
    titleButton.layer.cornerRadius = 5;
    titleButton.layer.masksToBounds = YES;
    titleButton.frame = CGRectMake(0, 0, kScreenWidth - 90, 30);
    self.navigationItem.titleView = titleButton;
}

#pragma mark - Event Response
- (void)askQuestion{
    NSLog(@"点击了提问");
}

- (void)search{
    ZhiHuSearchResultViewController *controller = [[ZhiHuSearchResultViewController alloc]init];
    [self.navigationController pushViewController:controller animated:NO];
}

#pragma mark - Setter && Getter
- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.font = [UIFont boldSystemFontOfSize:40];
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.text = @"主页";
    }
    return _tipLabel;
}

@end

