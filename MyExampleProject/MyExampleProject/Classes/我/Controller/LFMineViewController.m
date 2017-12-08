//
//  LFMineViewController.m
//  MyProject
//
//  Created by Pro on 2017/11/9.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFMineViewController.h"
#import "LFSettingItem.h"
#import "LFSettingGroup.h"
@interface LFMineViewController ()

@end

@implementation LFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup];
}


- (void)setupGroup {
    LFSettingItem *item = [LFSettingItem itemWithTitle:@"网络封装"];
    LFSettingGroup *group = [LFSettingGroup groupWithItems:@[item]];
    [self.groups addObject:group];
}


@end
