//
//  CategorySwitchViewController.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/28.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "CategorySwitchViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryListContainerView.h"
#import "JXCategoryIndicatorLineView.h"
#import "CategorySwitchListViewController.h"

@interface CategorySwitchViewController ()<JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *titleCategoryView;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) NSMutableArray <CategorySwitchListViewController *> *listVCArray;
@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation CategorySwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listVCArray = [NSMutableArray array];
    self.titlesArray = @[@"子鼠",@"丑牛",@"寅虎",@"卯兔",@"辰龙",@"巳蛇",@"午马",@"未羊",@"申猴",@"酉鸡",@"戌狗",@"亥猪"];
    
    self.titleCategoryView.titles = self.titlesArray;
    self.titleCategoryView.delegate = self;
    self.titleCategoryView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleCategoryView];
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    lineView.indicatorColor = [UIColor redColor];
    self.titleCategoryView.indicators = @[lineView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleCategoryView.frame), JCScreenWidth, JCScreenHeight - CGRectGetMaxY(self.titleCategoryView.frame))];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];

    self.automaticallyAdjustsScrollViewInsets = NO;
    if (iOS11Later) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    //FIXME:如果和自定义UIScrollView联动，删除纯UIScrollView示例
    self.titleCategoryView.contentScrollView = self.scrollView;

    [self reloadData];
}

- (void)reloadData {
    //先把之前的listView移除掉
    for (UIViewController *vc in self.listVCArray) {
        [vc.view removeFromSuperview];
    }
    [self.listVCArray removeAllObjects];

    for (int i = 0; i < self.titlesArray.count; i ++) {
        CategorySwitchListViewController *listVC = [[CategorySwitchListViewController alloc] init];
        listVC.view.frame = CGRectMake(i*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
        //如果列表是UIViewController包裹的，需要添加addChildViewController代码，这样子在iPhoneX系列手机就不会有底部安全距离错误的问题！！！
        [self addChildViewController:listVC];
        [self.listVCArray addObject:listVC];
    }

    //根据新的数据源重新添加listView
    for (int i = 0; i < self.titlesArray.count; i ++) {
        CategorySwitchListViewController *listVC = self.listVCArray[i];
        [self.scrollView addSubview:listVC.view];
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width*self.titlesArray.count, self.scrollView.bounds.size.height);

    //触发首次加载
    [self.listVCArray.firstObject loadDataWithCurrentIndex:0];

    //重载之后默认回到0，你也可以指定一个index
    self.titleCategoryView.defaultSelectedIndex = 0;
    self.titleCategoryView.titles = self.titlesArray;
    [self.titleCategoryView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.titleCategoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
     [self.listVCArray[index] loadDataWithCurrentIndex:index];
}


- (CGFloat)preferredCategoryViewHeight {
    return 50;
}

-(JXCategoryTitleView *)titleCategoryView{
    if (!_titleCategoryView) {
        _titleCategoryView = [[JXCategoryTitleView alloc] init];
        _titleCategoryView.frame = CGRectMake(0, JCTopBarHeight, JCScreenWidth, [self preferredCategoryViewHeight]);
    }
    return _titleCategoryView;
}


@end
