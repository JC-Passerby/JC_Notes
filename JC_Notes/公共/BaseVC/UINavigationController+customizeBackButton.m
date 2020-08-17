//
//  UINavigationController+customizeBackButton.m
//  visitor_develop
//
//  Created by 嘘。 on 2019/2/18.
//  Copyright © 2019 访客先生. All rights reserved.
//

#import "UINavigationController+customizeBackButton.h"
#import <objc/runtime.h>
#import "FluentDarkModeKit.h"

@implementation UINavigationController (customizeBackButton)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class navClass = [self class];
        
        SEL originalSelector = @selector(pushViewController:animated:);
        SEL swizzledSelector = @selector(replacePushViewController:animated:);
        
        Method originalMethod = class_getInstanceMethod(navClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(navClass, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)replacePushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIImage *backImage = [UIImage dm_imageWithLightImage:[UIImage imageNamed:@"jc_navbar_black_icon"] darkImage:[UIImage imageNamed:@"jc_navbar_black_darkmode_icon"]];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        backItem.imageInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        viewController.navigationItem.leftBarButtonItem = backItem;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self replacePushViewController:viewController animated:animated];
    self.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
