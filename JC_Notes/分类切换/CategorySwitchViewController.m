//
//  CategorySwitchViewController.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/26.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "CategorySwitchViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryListContainerView.h"
#import "CategorySwitchListViewController.h"
#import "JXCategoryIndicatorLineView.h"

@interface CategorySwitchViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *titleCategoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) CategorySwitchListViewController *cslvc;
@end

@implementation CategorySwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.listContainerView];
    
    self.titlesArray = @[@"全部",@"审核中",@"审核通过",@"审核驳回"];
    self.titleCategoryView.titles = self.titlesArray;
    self.titleCategoryView.listContainer = self.listContainerView;
    self.titleCategoryView.delegate = self;
    self.titleCategoryView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleCategoryView];
    
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
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    [self.cslvc loadDataWithCurrentIndex:index];
}


#pragma mark - JXCategoryListContainerViewDelegate

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    self.cslvc = [[CategorySwitchListViewController alloc] init];
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
