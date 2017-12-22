//
//  CustomSearchBar.m
//  NavigationControllerAnalyse
//
//  Created by bjovov on 2017/12/22.
//  Copyright © 2017年 caoxueliang.cn. All rights reserved.
//

#import "CustomSearchBar.h"

@interface CustomSearchBar()
@property (nonatomic,strong) UIImageView *leftImageView;
@end

@implementation CustomSearchBar
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton tintColor:(UIColor *)tintColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        //设置光标颜色
        self.tintColor = tintColor;
        self.barTintColor = [UIColor whiteColor];
        self.placeholder = placeholder;
        self.showsCancelButton = showCancelButton;
        
        //用来代替左侧的放大镜
        self.leftImageView = leftView;
        
        //替换输入过程中右侧的claerIcon
        [self setImage:[UIImage imageNamed:@"clear"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        
        if ([[UIDevice currentDevice] systemVersion].doubleValue >= 11.0) {
            [[self.heightAnchor constraintEqualToConstant:44.0] setActive:YES];
        } else {
            [self setLeftPlaceholder];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置TextField
    UITextField *searchField = [self valueForKey:@"searchField"];
    searchField.backgroundColor = [UIColor colorWithHexString:@"f6f7f8"];
    searchField.textColor = [UIColor colorWithHexString:@"8a8a8a"];
    searchField.font = [UIFont systemFontOfSize:15];
    searchField.leftView = self.leftImageView;
    
    if (@available(iOS 11.0, *)) {
        // 查看视图层级，在iOS 11之前searchbar的起点，x的默认坐标是12
        searchField.frame = CGRectMake(12, (44 - 30)/2.0, CGRectGetWidth(searchField.bounds), 30);
    } else {
        searchField.frame = CGRectMake(0, (44 - 30)/2.0, CGRectGetWidth(searchField.bounds), 30);
    }
    searchField.borderStyle = UITextBorderStyleNone;
    searchField.layer.cornerRadius = 5;
    searchField.layer.masksToBounds = YES;
    
    [searchField setValue:[UIColor colorWithHexString:@"8a8a8a"] forKeyPath:@"placeholderLabel.textColor"];
    [self setValue:searchField forKey:@"searchField"];
    
    //设置光标偏移量
    self.searchTextPositionAdjustment = (UIOffset){10, 0};
}

#pragma mark - Public Menthod
- (void)setLeftPlaceholder{
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        BOOL centeredPlaceholder = NO;
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&centeredPlaceholder atIndex:2];
        [invocation invoke];
    }
}

@end
