
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface JCPageControlView : UIView

@property (nonatomic,assign) NSInteger numberOfPage;
@property (nonatomic,assign) NSInteger currentPage;
@property(nullable,nonatomic,strong) UIColor * pageIndicatorTintColor;
@property(nullable,nonatomic,strong) UIColor * currentPageIndicatorTintColor;

@end

NS_ASSUME_NONNULL_END
