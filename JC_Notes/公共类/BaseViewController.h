//
//  BaseViewController.h
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/26.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
- (void)JCPushViewController:(NSString *)className withNavigationTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
