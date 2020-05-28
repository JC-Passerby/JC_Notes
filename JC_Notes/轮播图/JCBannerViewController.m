//
//  JCBannerViewController.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/28.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "JCBannerViewController.h"
#import "JCBannerView.h"

@interface JCBannerViewController ()
@property (nonatomic, strong) JCBannerView *bannerview;
@end

@implementation JCBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bannerview];
}

-(JCBannerView *)bannerview {
    if (!_bannerview) {
        NSArray* newarray =@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590664529296&di=f95e31914cbcdddb33e827bbf2c6ba12&imgtype=0&src=http%3A%2F%2Fwww.51pptmoban.com%2Fd%2Ffile%2F2013%2F03%2F07%2Fsmall19c24286d0c801153449fe62c560482e1362664618.jpg",
            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590664509117&di=edfdf9f71c93d17d4e40d8636eb4c436&imgtype=0&src=http%3A%2F%2Fimg.xinxic.com%2Fimg%2F18e3cf436802010e.jpg"];
        _bannerview = [[JCBannerView alloc]initWithFrame:CGRectMake(0, JCTopBarHeight, JCScreenWidth, 220) withImageArray:newarray withTimeInterval:1.5];
        _bannerview.pageIndicatorTintColor =JCColorFromRGB(0xFFFFFF);
        _bannerview.currentPageIndicatorTintColor = JCColorFromRGB(0xD33B2F);
    }
    return _bannerview;
}

@end
