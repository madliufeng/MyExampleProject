//
//  LFLoginViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFTabBarController.h"
#import "LFLoginAPI.h"
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
- (IBAction)loginBtn:(id)sender {
    
    LFLoginAPI *api = [[LFLoginAPI alloc]init];
    api.subUrl = @"dengLu";
    NSString *jindu = [NSString stringWithFormat:@"%.3f",BBUserDefault.longitude];
    NSString *weidu = [NSString stringWithFormat:@"%.3f",BBUserDefault.latitude];
    [api.parameters setObject:self.userNameTF.text forKey:@"yongHuMin"];
    [api.parameters setObject:self.passwordTF.text forKey:@"miMa"];
    [api.parameters setObject:jindu forKey:@"jingDu"];
    [api.parameters setObject:weidu forKey:@"weiDu"];
    [api.parameters setObject:@1 forKey:@"leiXing"];
    [api.parameters setObject:@"kocla" forKey:@"fromApp"];
    [api startRequestWithType:RequestTypePOST backWithDelegate:self];
    
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
- (void)netWorkCodeSuccessBackWithResponseObject:(id)responseObject {
    if ([responseObject isKindOfClass:[LFLoginAPI class]]) {
        
    }
}


@end
