//
//  CategorySwitchListViewController.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/26.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "CategorySwitchListViewController.h"
#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

@interface CategorySwitchListViewController ()

@end

@implementation CategorySwitchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
}

- (void)loadDataWithCurrentIndex:(NSInteger)currentIndex{
    NSLog(@"第%@页",@(currentIndex));
}

#pragma mark - JXCategoryListContentViewDelegate
- (UIView *)listView {
    return self.view;
}

@end
