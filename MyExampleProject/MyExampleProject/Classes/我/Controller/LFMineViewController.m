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

#import "YYFPSLabel.h"
@interface LFMineViewController ()

@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation LFMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"功能导航";

    [self setTableViewHeader];
    [self setupGroup];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)setTableViewHeader
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth *9/16)];
    headView.backgroundColor = kRedColor;
    self.tableView.tableHeaderView = headView;
    //必须设置这里 才能调用代理方法且以代理方法为准，能不用代理方法就不要用
    self.tableView.sectionHeaderHeight = .1;
    self.tableView.sectionFooterHeight = .1;
}

- (void)setupGroup
{
    NSArray *itemArr = @[@{@"LKDB数据库运用":@""},
                         @{@"百度地图":@""},
                         @{@"二维码":@""},
                         @{@"照片上传":@""},
                         @{@"照片上传附带进度":@""},
                         @{@"字体适配机型":@""},
                         @{@"日志记录":@""},
                         @{@"列表倒计时":@""},
                         @{@"H5交互WebViewJavascriptBridge":@""},
                         @{@"继承BaseViewController运用":@""},
                         @{@"列表空白页展现":@""},
                         @{@"省市区三级联动":@""},
                         @{@"自定义弹出窗":@""},
                         @{@"YYText富文本实例":@""},
                         @{@"列表行展开跟回收隐藏":@""},
                         @{@"常见表单行类型":@"" },
                         @{@"人脸识别注册及验证":@""},
                         @{@"JavaScriptCore运用":@""},
                         @{@"Masonry布局实例":@"MPMasonryViewController"},
                         @{@"键盘处理操作":@""},
                         @{@"自定义导航栏动态显现效果":@""},
                         @{@"列表只加载显示时Cell的SDWebImage图":@""},
                         @{@"长按列表行拖动效果":@""},
                         @{@"关于FDFullscreenPopGesture的运用":@""},
                         @{@"可复用的滚动子视图":@""},
                         @{@"音视频功能集合":@""},
                         @{@"自定义日期选择控件":@""},];
    //弹出提示
    [self showNewStatusesCount:itemArr.count];
    
    for (NSDictionary *dict in itemArr) {
        NSString *key = [[dict allKeys]firstObject];
        NSString *value = [[dict allValues]firstObject];
        LFSettingItem *item = [LFSettingItem itemWithTitle:key];
        WEAK_SELF();
        item.operation = ^(NSIndexPath *indexPath) {
            if ([value lf_isNotEmpty]) {
                UIViewController *vc = [[NSClassFromString(value) alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
        };
        LFSettingGroup *group = [LFSettingGroup groupWithItems:@[item]];
        [self.groups addObject:group];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//这两句话调用必须先设置    self.tableView.sectionHeaderHeight = 10.0f;self.tableView.sectionFooterHeight否则不会调用
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}


#pragma mark 自定义代码

- (void)showNewStatusesCount:(NSInteger)count
{
    // 1.创建一个UILabel
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    
    // 2.显示文字
    if (count) {
        label.text = [NSString stringWithFormat:@"共有%ld条实例数据", count];
    } else {
        label.text = @"没有最新的数据";
    }
    
    // 3.设置背景
    label.backgroundColor = [UIColor colorWithRed:254/255.0  green:129/255.0 blue:0 alpha:1.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    // 4.设置frame
    label.width = self.view.frame.size.width;
    label.height = 35;
    label.mj_x= 0;
    label.mj_y = CGRectGetMaxY([self.navigationController navigationBar].frame) - label.frame.size.height;
    
    // 5.添加到导航控制器的view
    //[self.navigationController.view addSubview:label];
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    // 6.动画
    CGFloat duration = 0.75;
    //label.alpha = 0.0;
    [UIView animateWithDuration:duration animations:^{
        // 往下移动一个label的高度
        label.transform = CGAffineTransformMakeTranslation(0, label.frame.size.height);
        //label.alpha = 1.0;
    } completion:^(BOOL finished) { // 向下移动完毕
        
        // 延迟delay秒后，再执行动画
        CGFloat delay = 1.0;
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            // 恢复到原来的位置
            label.transform = CGAffineTransformIdentity;
            //label.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
            // 删除控件
            [label removeFromSuperview];
        }];
    }];
}
@end
