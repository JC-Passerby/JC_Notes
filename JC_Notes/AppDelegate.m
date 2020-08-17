//
//  AppDelegate.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/26.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "BaseNavigationViewController.h"
@interface AppDelegate ()
@property (nonatomic,strong)UIVisualEffectView *visualEffectView;//毛玻璃效果
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    BaseNavigationViewController *baseNavVC = [[BaseNavigationViewController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
    self.window.rootViewController = baseNavVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
     UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
     _visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
     _visualEffectView.alpha = 0.97f;
     _visualEffectView.frame =self.window.bounds;
     [[UIApplication sharedApplication].keyWindow addSubview:_visualEffectView];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
     [_visualEffectView removeFromSuperview];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
      [_visualEffectView removeFromSuperview];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
