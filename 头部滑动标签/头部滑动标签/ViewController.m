//
//  ViewController.m
//  头部滑动标签
//
//  Created by 汪林林 on 2018/5/4.
//  Copyright © 2018年 汪林林. All rights reserved.
//

#import "ViewController.h"
#import "nextViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UIScrollView *headerScroll;

@property (nonatomic,assign) CGFloat LayoutTopH;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.LayoutTopH = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    [self setUpHeaderLabel];
    [self setUpContentView];
    
}

//头部标签   https://blog.csdn.net/wdjzf/article/details/52629294
- (void)setUpHeaderLabel {
    self.headerScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.LayoutTopH, CGRectGetWidth([UIScreen mainScreen].bounds), 64)];
    self.headerScroll.backgroundColor = [UIColor lightGrayColor];
    self.headerScroll.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) * 2, 64);
//    self.headerScroll.
    self.headerScroll.pagingEnabled = YES;
//    self.headerScroll.
    
    self.headerScroll.alwaysBounceHorizontal = YES;
    [self.view addSubview:self.headerScroll];
}

//底部内容页面
- (void)setUpContentView {
    UIButton *clickBtn = [[UIButton alloc]initWithFrame: CGRectMake(200, 200, 100, 100)];
    clickBtn.backgroundColor = [UIColor redColor];
    [clickBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
}

- (void)btnClick {
    nextViewController *vc = [[nextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
