//
//  JCBannerView.h
//  RotationChart
//
//  Created by 刘某某 on 2020/3/19.
//  Copyright © 2020 rotationchart. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreentW [UIScreen mainScreen].bounds.size.width
#define ScreentH [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@class JCBannerView;

@protocol JCBannerViewDelegate <NSObject>

@optional
- (void)selectImage:(JCBannerView *)bannerView currentImage:(NSInteger)currentImage;

@end

@interface JCBannerView : UIView

- (id)initWithFrame:(CGRect)frame withImageArray:(NSArray *)imageArray withTimeInterval:(NSTimeInterval)timeInterval;

@property (nonatomic , weak) id <JCBannerViewDelegate> delegate;

///  normal颜色 [UIColor grayColor]
@property(nullable,nonatomic,strong) UIColor * pageIndicatorTintColor;

///  selected颜色 [UIColor whiteColor]
@property(nullable,nonatomic,strong) UIColor * currentPageIndicatorTintColor;

@end

NS_ASSUME_NONNULL_END
