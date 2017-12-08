//
//  LFHomeViewController.m
//  MyProject
//
//  Created by Pro on 17/11/7.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFHomeViewController.h"
#import "LFBaseAPI.h"
@interface LFHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSArray *mDataSource;

@end

@implementation LFHomeViewController
#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mDataSource = @[@{@"iOS多个网络请求完成后执行下一步":@"LFMultithreadingVC"},
                         @{@"iOS多个网络请求完成后执行下一步":@""},
                         @{@"iOS多个网络请求完成后执行下一步":@""},
                         @{@"iOS多个网络请求完成后执行下一步":@""},
                         @{@"iOS多个网络请求完成后执行下一步":@""},
                         @{@"iOS多个网络请求完成后执行下一步":@""},
                         @{@"iOS多个网络请求完成后执行下一步":@""},
                         @{@"iOS多个网络请求完成后执行下一步":@""}];
    
    [self.view addSubview:self.mTableView];
}

#pragma mark - Method

#pragma mark - Action

#pragma mark - Network

#pragma mark - UITableViewDelegate&& UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSDictionary *dict = self.mDataSource[indexPath.row];
    cell.textLabel.text = [[dict allKeys]firstObject];;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.mDataSource[indexPath.row];
    NSString *classStr = [[dict allValues]firstObject];
    if (classStr.length == 0) {
        return;
    }
    UIViewController *vc = [[NSClassFromString(classStr) alloc]init];
    vc.title = [[dict allKeys]firstObject];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Setter && Getter
- (UITableView *)mTableView {
    if (!_mTableView) {
        _mTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
    }
    return _mTableView;
}

- (NSArray *)mData {
    if (!_mDataSource) {
        _mDataSource = [NSArray array];
    }
    return _mDataSource;
}

@end
