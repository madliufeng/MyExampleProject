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
    Singleton *sing = [Singleton sharedInstance];

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
    [api startRequestWithType:RequestTypePOST backWithDelegate:self];

     // 微店登录
    
    LFWDLoginAPI *wdApi = [[LFWDLoginAPI alloc]initWithSubUrl:@"/user2_1_0/login" baseUrl:WDSeverHost];
    [wdApi.parameters setObject:@"13710741681" forKey:@"phone"];
    [wdApi.parameters setObject:@"liufeng123456" forKey:@"pwd"];
    [wdApi.parameters setObject:@"0" forKey:@"from"];
    [wdApi startRequestWithType:RequestTypeGET backWithDelegate:self];
    
    //备课登录
    
    LFBKLoginAPI *bkAPI = [[LFBKLoginAPI alloc]initWithSubUrl:@"dengLu" baseUrl:BKSeverHost];
    [bkAPI.parameters setObject:@"13710741681" forKey:@"yongHuMing"];
    [bkAPI.parameters setObject:@"liufeng123456" forKey:@"miMa"];
    [bkAPI.parameters setObject:jindu forKey:@"jingDu"];
    [bkAPI.parameters setObject:weidu  forKey:@"weiDu"];
    [bkAPI startRequestWithType:RequestTypePOST backWithDelegate:self];
    
    //中心库登录
    
    LFKLLoginAPI *klAPI = [[LFKLLoginAPI alloc]initWithSubUrl:@"user/v1/wduseraccount/login" baseUrl:KLSeverHost];
    [klAPI.parameters setValue:@"13710741681" forKey:@"phone"];
    [klAPI.parameters setValue:@"liufeng123456" forKey:@"pwd"];
    [klAPI.parameters setValue:@"0" forKey:@"from"];
    [klAPI startRequestWithType:RequestTypePOST backWithDelegate:self];
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


#pragma mark - NetWork
- (void)netWorkCodeSuccessBackWithResponseObject:(id)responseObject
{
    //登录
    if ([responseObject isKindOfClass:[LFLoginAPI class]])
    {
        LFLoginAPI *api = responseObject;
        LFUserInfoModel *userModel = [api.list firstObject];
        [userModel write];
        NSLog(@"%@",userModel.yongHuMing);
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate setupHomeViewController];
    }
    
    // 备课登录
    if ([responseObject isKindOfClass:[LFBKLoginAPI class]])
    {
        LFBKLoginAPI *api = responseObject;
        NSLog(@"LFBKLoginAPI--%@",api.msg);
    }
    
    //考拉中心库登录
    if ([responseObject isKindOfClass:[LFKLLoginAPI class]]) {
        LFKLLoginAPI *api = responseObject;
        NSLog(@"LFKLLoginAPI--%@",api.msg);
    }
    
}

- (void)netWorkRequestSuccessBackWithResponseObject:(id)responseObject {
//    LFWDLoginAPI *api = [LFWDLoginAPI mj_objectWithKeyValues:responseObject];
//    NSLog(@"LFWDLoginAPI--%@",api.data);
    
    LFKLLoginAPI *api = [LFKLLoginAPI mj_objectWithKeyValues:responseObject];
    NSLog(@"LFWDLoginAPI--%@",api.msg);

}
@end
