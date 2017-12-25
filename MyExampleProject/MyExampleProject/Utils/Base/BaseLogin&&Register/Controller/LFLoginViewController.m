//
//  LFLoginViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFTabBarController.h"
//登录
#import "LFLoginAPI.h"
#import "LFWDLoginAPI.h"
#import "LFBKLoginAPI.h"
#import "LFKLLoginAPI.h"

#import "AppDelegate.h"
@interface LFLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *QQLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *WXLoginBtn;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //登录逻辑
    //一家教后台登录
    //微店登录
    //备课登录
    //环信登录
    //中心库登录
    //第三方登录 QQ 微信
    //自动登录
}

#pragma mark - Action
/// 登录
- (IBAction)loginBtn:(id)sender
{
    //同时登录多个接口
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self loginAPPServe];
        NSLog(@"子线程上的第一个请求");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"子线程上的第二个请求");
        [self loginWD];
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"子线程上的第三个请求");
        [self loginBK];
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"子线程上的第四个请求");
        [self loginKocla];
    });
    
    // 执行完毕之后的通知
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"需要在这里回到主线程刷新UI");
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate setupHomeViewController];
    });
 
}

///登自动录
- (IBAction)autoLoginBtn:(id)sender {
}

///QQ登录
- (IBAction)QQLoginBtn:(id)sender {
    
}

///微信登录
- (IBAction)WXLoginBtn:(id)sender {
    
}

#pragma mark - Method

#pragma mark - NetWork
- (void)loginAPPServe {
    // 一家教服务器登录
    LFLoginAPI *api = [[LFLoginAPI alloc]initWithSubUrl:@"dengLu"];
    NSString *jindu = [NSString stringWithFormat:@"%.3f",BBUserDefault.longitude];
    NSString *weidu = [NSString stringWithFormat:@"%.3f",BBUserDefault.latitude];
    LFUserInfoModel *userModel  = [LFUserInfoModel read];
    if (userModel) {
        [api.parameters setObject:userModel.dianHua forKey:@"yongHuMin"];
        [api.parameters setObject:@"liufeng123456" forKey:@"miMa"];
    }else {
        [api.parameters setObject:self.userNameTF.text forKey:@"yongHuMin"];
        [api.parameters setObject:self.passwordTF.text forKey:@"miMa"];
    }
    [api.parameters setObject:jindu forKey:@"jingDu"];
    [api.parameters setObject:weidu forKey:@"weiDu"];
    [api.parameters setObject:@1 forKey:@"leiXing"];
    [api.parameters setObject:@"kocla" forKey:@"fromApp"];
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [api startRequestWithType:RequestTypePOST success:^(id  _Nullable responseObject) {
        dispatch_semaphore_signal(sema);
    } failure:^(NSError * _Nonnull error) {
        dispatch_semaphore_signal(sema);
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
}

- (void)loginWD {
     // 微店登录
    
    LFWDLoginAPI *wdApi = [[LFWDLoginAPI alloc]initWithSubUrl:@"/user2_1_0/login" baseUrl:WDSeverHost];
    [wdApi.parameters setObject:@"13710741681" forKey:@"phone"];
    [wdApi.parameters setObject:@"liufeng123456" forKey:@"pwd"];
    [wdApi.parameters setObject:@"0" forKey:@"from"];
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [wdApi startRequestWithType:RequestTypeGET success:^(id  _Nullable responseObject) {
        dispatch_semaphore_signal(sema);
        
    } failure:^(NSError * _Nonnull error) {
        dispatch_semaphore_signal(sema);
        
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
}

- (void)loginBK {
    //备课登录
    
    LFBKLoginAPI *bkAPI = [[LFBKLoginAPI alloc]initWithSubUrl:@"dengLu" baseUrl:BKSeverHost];
    NSString *jindu = [NSString stringWithFormat:@"%.3f",BBUserDefault.longitude];
    NSString *weidu = [NSString stringWithFormat:@"%.3f",BBUserDefault.latitude];
    [bkAPI.parameters setObject:@"13710741681" forKey:@"yongHuMing"];
    [bkAPI.parameters setObject:@"liufeng123456" forKey:@"miMa"];
    [bkAPI.parameters setObject:jindu forKey:@"jingDu"];
    [bkAPI.parameters setObject:weidu  forKey:@"weiDu"];
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [bkAPI startRequestWithType:RequestTypePOST success:^(id  _Nullable responseObject) {
        dispatch_semaphore_signal(sema);
        
    } failure:^(NSError * _Nonnull error) {
        dispatch_semaphore_signal(sema);
        
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
}

- (void)loginKocla {
    //中心库登录
    
    LFKLLoginAPI *klAPI = [[LFKLLoginAPI alloc]initWithSubUrl:@"user/v1/wduseraccount/login" baseUrl:KLSeverHost];
    [klAPI.parameters setValue:@"13710741681" forKey:@"phone"];
    [klAPI.parameters setValue:@"liufeng123456" forKey:@"pwd"];
    [klAPI.parameters setValue:@"0" forKey:@"from"];
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [klAPI startRequestWithType:RequestTypePOST success:^(id  _Nullable responseObject) {
        dispatch_semaphore_signal(sema);
        
    } failure:^(NSError * _Nonnull error) {
        dispatch_semaphore_signal(sema);
        
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
}


@end
