//
//  HomeViewController.m
//  JC_Notes
//
//  Created by 刘某某 on 2020/5/28.
//  Copyright © 2020 刘某某. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"JC随手记";
    self.dataArray = @[@"分类切换",@"轮播图"];
    [self.view addSubview:self.tableview];
    self.tableview.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource , UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = self.dataArray[indexPath.row];
    if ([title isEqualToString:@"分类切换"]) {
        [self JCPushViewController:@"CategorySwitchViewController" withNavigationTitle:title];
    }else if ([title isEqualToString:@"轮播图"]){
        [self JCPushViewController:@"JCBannerViewController" withNavigationTitle:title];
    }
}

- (UITableView *)tableview {
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

@end
