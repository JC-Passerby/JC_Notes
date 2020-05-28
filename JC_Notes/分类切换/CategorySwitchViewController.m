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

@interface CategorySwitchViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *titleCategoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) CategorySwitchListViewController *cslvc;
@end

@implementation CategorySwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titlesArray = @[@"子鼠",@"丑牛",@"寅虎",@"卯兔",@"辰龙",@"巳蛇",@"午马",@"未羊",@"申猴",@"酉鸡",@"戌狗",@"亥猪"];
    self.titleCategoryView.titles = self.titlesArray;
    self.titleCategoryView.listContainer = self.listContainerView;
    self.titleCategoryView.delegate = self;
    self.titleCategoryView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleCategoryView];
    [self.view addSubview:self.listContainerView];
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    lineView.indicatorColor = [UIColor redColor];
    self.titleCategoryView.indicators = @[lineView];
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

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.titleCategoryView.frame = CGRectMake(0, 88, self.view.bounds.size.width, [self preferredCategoryViewHeight]);
    self.listContainerView.frame = CGRectMake(0, 88 + [self preferredCategoryViewHeight], self.view.bounds.size.width, self.view.bounds.size.height - 88 -[self preferredCategoryViewHeight] );
}


#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    [self.cslvc loadDataWithCurrentIndex:index];
}


#pragma mark - JXCategoryListContainerViewDelegate
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    
    self.cslvc = [[CategorySwitchListViewController alloc] init];
    if (index == 0) {
         [self.cslvc loadDataWithCurrentIndex:index];
    }
    return self.cslvc;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titlesArray.count;
}

- (CGFloat)preferredCategoryViewHeight {
    return 50;
}

-(JXCategoryTitleView *)titleCategoryView{
    if (!_titleCategoryView) {
        _titleCategoryView = [[JXCategoryTitleView alloc] init];
    }
    return _titleCategoryView;
}

- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView ) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}
@end
