//
//  AppDelegate.m
//  MyExampleProject
//
//  Created by Pro on 2017/12/4.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "AppDelegate.h"

#import <WXApi.h>
#import <AlipaySDK/AlipaySDK.h>
#import <UMSocialCore/UMSocialCore.h>
//#import <HyphenateLite/HyphenateLite.h>//没有导入实时语音包

#import "introductoryPagesHelper.h"
#import "AdvertiseHelper.h"
#import "LFTabBarController.h"
#import "GVUserDefaults+BBProperties.h"
#import "MPLocationManager.h"

#import "LFLoginViewController.h"
@interface AppDelegate ()<WXApiDelegate>

@end


@implementation AppDelegate

#pragma mark - 程序加载完毕
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //定位地图初始化
    [MPLocationManager installMapSDK];
    //百度地图定位
    [self location];
    
    //加载页面
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupHomeViewController];
//    [self setupLoginViewController];
  
//    [self setupIntroductoryPage];
    //启动广告（记得放最后，才可以盖在页面上面）这个看具体需求，
//    [self setupAdveriseView];
 
    return YES;
}

#pragma mark - 程序失去焦点

- (void)applicationWillResignActive:(UIApplication *)application {
}

#pragma mark - 程序进入后台

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

#pragma mark - 程序从后台回到前台

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

#pragma mark - 程序获取焦点

- (void)applicationDidBecomeActive:(UIApplication *)application {
 
}

#pragma mark - 程序即将退出

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark - 登录

- (void)setupLoginViewController {
    LFLoginViewController *tabBar = [LFLoginViewController lf_createFromStoryboardName:@"Login"];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
}
#pragma mark - 首页

-(void)setupHomeViewController
{
    LFTabBarController *tabBarController = [LFTabBarController new];
    [self.window setRootViewController:tabBarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}



#pragma mark - 加载引导页

- (void)setupIntroductoryPage {
    if (!BBUserDefault.isFirstLaunch) {
        return;
    }
    BBUserDefault.isFirstLaunch = NO;
    NSArray *images=@[@"yindaoye1",@"yindaoye2",@"yindaoye3",@"yindaoye4"];
    [introductoryPagesHelper showIntroductoryPageView:images];
}
#pragma mark - 广告页加载

- (void)setupAdveriseView {
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];

}

- (void)location {
    //百度地图定位
    [[MPLocationManager shareInstance] startBMKLocationWithReg:^(BMKUserLocation *loction, NSError *error) {
        if (error) {
            DDLogError(@"定位失败,失败原因：%@",error);
        }
        else
        {
            DDLogError(@"定位信息：%f,%f",loction.location.coordinate.latitude,loction.location.coordinate.longitude);
        
            BBUserDefault.latitude = loction.location.coordinate.latitude;
            BBUserDefault.longitude = loction.location.coordinate.longitude;
            
            CLGeocoder *geocoder=[[CLGeocoder alloc]init];
            [geocoder reverseGeocodeLocation:loction.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                
                //处理手机语言 获得城市的名称（中文）
                NSMutableArray *userDefaultLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
                NSString *currentLanguage = [userDefaultLanguages objectAtIndex:0];
                //如果不是中文 则强制先转成中文 获得后再转成默认语言
                if (![currentLanguage isEqualToString:@"zh-Hans"]&&![currentLanguage isEqualToString:@"zh-Hans-CN"]) {
                    //IOS9前后区分
                    if (isIOS9) {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-Hans-CN", nil] forKey:@"AppleLanguages"];
                    }
                    else
                    {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-Hans", nil] forKey:@"AppleLanguages"];
                    }
                }
                
                //转换地理信息
                if (placemarks.count>0) {
                    CLPlacemark *placemark=[placemarks objectAtIndex:0];
                    //获取城市
                    NSString *city = placemark.locality;
                    if (!city) {
                        //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                        city = placemark.administrativeArea;
                    }
                    
                    NSLog(@"百度当前城市：[%@]",city);
                    
                    // 城市名传出去后,立即 Device 语言 还原为默认的语言
                    [[NSUserDefaults standardUserDefaults] setObject:userDefaultLanguages forKey:@"AppleLanguages"];
                }
            }];
        }
    }];
    

}
@end
