//
//  BaseViewController.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/26.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)JCPushViewController:(NSString *)className withNavigationTitle:(NSString *)title {
    UIViewController *controller = [[NSClassFromString(className) alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    controller.navigationItem.title = title;
    [self.navigationController pushViewController:controller animated:YES];
}



@end
