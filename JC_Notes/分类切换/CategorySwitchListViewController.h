//
//  CategorySwitchListViewController.h
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/28.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "BaseViewController.h"
#import "JXCategoryListContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CategorySwitchListViewController : BaseViewController<JXCategoryListContentViewDelegate>
- (void)loadDataWithCurrentIndex:(NSInteger)currentIndex;
@end

NS_ASSUME_NONNULL_END
