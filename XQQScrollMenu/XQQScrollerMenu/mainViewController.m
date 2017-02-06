//
//  mainViewController.m
//  XQQScrollerMenu
//
//  Created by XQQ on 16/10/13.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "mainViewController.h"
#import "XQQScrollerMenuView.h"
#import "XQQScrollBtn.h"
#import "XQQOneViewController.h"
#import "XQQTwoViewController.h"
#import "XQQThreeViewController.h"
#import "XQQFourViewController.h"
#import "XQQFiveViewController.h"
#import "XQQSixViewController.h"
#import "XQQSevenViewController.h"
#import "XQQEightViewController.h"
#import "XQQNineViewController.h"
#import "XQQTenViewController.h"

#define iphoneWidth  [UIScreen mainScreen].bounds.size.width
#define iphoneHeight [UIScreen mainScreen].bounds.size.height
@interface mainViewController ()<UIScrollViewDelegate,scrollMenuDelegate>

/**下方的scrollView*/
@property(nonatomic, strong)  UIScrollView * scrollView;
/**菜单的View*/
@property(nonatomic, strong)  XQQScrollerMenuView * menuView;
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
- (void)createUI{
    self.navigationItem.title = @"滚动菜单";
    NSArray * titleArr = @[@"新闻",@"热点",@"北京",@"国际",@"地区",@"全球",@"城市",@"体育",@"娱乐",@"八卦"];
    NSArray * controllerNameArr = @[@"XQQOneViewController",@"XQQTwoViewController",@"XQQThreeViewController",@"XQQFourViewController",@"XQQFiveViewController",@"XQQSixViewController",@"XQQSevenViewController",@"XQQEightViewController",@"XQQNineViewController",@"XQQTenViewController"];
   _menuView  = [[XQQScrollerMenuView alloc]initWithFrame:CGRectMake(0, 64, iphoneWidth, 44)];
    _menuView.titleArr = titleArr;
    _menuView.scrollDelegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_menuView];
    
    //控制器的滚动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_menuView.frame), iphoneWidth, iphoneHeight - CGRectGetMaxY(_menuView.frame))];
    _scrollView.pagingEnabled = YES;
   // _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    //添加controllers
    NSArray * chelidControlls = [_menuView addChildrenControllersWithArr:controllerNameArr AndSuperController:self];
    //给底部的滚动视图添加View  这个方法 会一次性把所有的控制器都初始化了
//    [_menuView addSubViewToScrollView:_scrollView controllerArr:chelidControlls];
    
    /**根据下标添加控制器的View    刚开始为第一项*/
    [_menuView addSubViewToScrollViewWithIndex:0 superView:_scrollView];
}
#pragma mark - scrollMenuDelegate
- (void)scrollMenuDidPressBtn:(XQQScrollBtn*)button index:(NSInteger)index{
    //切换当前控制器滚动视图的偏移量
    [_menuView changeScrollViewContentOffsetWithIndex:index scrollView:_scrollView];
    //一个一个添加控制器的View 只有切换到这个页面才添加这个控制器的View
    [_menuView addSubViewToScrollViewWithIndex:index superView:_scrollView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //计算偏移量
    NSInteger x = scrollView.contentOffset.x / iphoneWidth;
    
    //一个一个添加控制器的View 只有切换到这个页面才添加这个控制器的View
    [_menuView addSubViewToScrollViewWithIndex:x superView:_scrollView];
    //上方按钮的偏移量
    _menuView.index = x;
    //改变顶部按钮的颜色
    [_menuView changeBtnStatesWithBtnIndex:x];
}

@end
