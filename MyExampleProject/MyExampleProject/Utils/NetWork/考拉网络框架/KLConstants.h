//
//  KLConstants.h
//  MicroShopForParents
//
//  Created by Charse on 16/4/29.
//  Copyright © 2016年 Charse. All rights reserved.
//

/**
 *  《=============登录==========》
 机构
 http://testwd.kocla.com/app/user/login?from=4&phone=15013680855&pwd=a123456
 家长
 http://testwd.kocla.com/app/user/login?from=0&phone=15013680866&pwd=a123456
 教师
 http://testwd.kocla.com/app/user/login?from=2&phone=15013680844&pwd=a123456
 
 
 《=============测试环境帐号==========》
 机构
 15013680835 a123456
 15013680836 a123456
 15013680837 a123456
 
 教师
 15013680845 a123456
 15013680846 a123456
 15013680847 a123456
 
 18566257689 111aaa //预报名数据
 
 家长
 15013680867 a123456
 15013680868 a123456
 15013680869 a123456
 15013680866 a123456// 新测试账号
 */


#ifndef KLConstants_h
#define KLConstants_h

#define GETOBJECTFORKEY(dictonary, key , Class) [[dictonary objectForKey:key] isKindOfClass:[Class class]] ? [dictonary objectForKey:key] : nil

#ifndef __OPTIMIZE__
#define DebugNSLog(...) NSLog(__VA_ARGS__)
#else
#define DebugNSLog(...) {}
#endif

#define CheckIOS7  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define CheckIOS8  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define CheckIOS9  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;


#define kNetworkNotReachability ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus <= 0)  //无网
#define kScreen_Bounds   [[UIScreen mainScreen] bounds]
#define kScreen_Width    [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height   [[UIScreen mainScreen] bounds].size.height
#define HasError [[NSError alloc] init]

#define SixColor [UIColor colorWithHexString:@"666666"]
#define FONT(font) [UIFont fontWithName:@"Arial" size:font]
#define BGColor RGB(245,245,245)
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 \
green:g/255.0 \
blue:b/255.0 \
alpha:1.0]

#define ZeroColor [UIColor colorWithHexString:@"000000"] // 密码输入的色值
#define ThreeColor [UIColor colorWithHexString:@"333333"]
#define SixColor [UIColor colorWithHexString:@"666666"]
#define NineColor [UIColor colorWithHexString:@"999999"]
#define importantColor [UIColor colorWithRed:52/255.0 green:53/255.0 blue:57/255.0 alpha:1.0]

#define ignoreColor [UIColor colorWithRed:195/255.0 green:198/255.0 blue:205/255.0 alpha:1.0]


#define HUD(showsORdismiss) [[KLProgressHUD shareInstance] showsORdismiss];
#define HUDLABEL(string) KLProgressLabel *label = [KLProgressLabel progressLabel];\
label.remindLabel = string;
#define USERDEFAULTSOBJFORKEY(key) [[NSUserDefaults standardUserDefaults] objectForKey:key];
#define USERDEFAULTSBOOLFORKEY(key) [[NSUserDefaults standardUserDefaults] boolForKey:key];
#define USERDEFAULTSSETOBJ(obj,key) [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize];
#define USERDEFAULTSSETBOOL(b,key) [[NSUserDefaults standardUserDefaults] setBool:b forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize];


#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 \
green:g/255.0 \
blue:b/255.0 \
alpha:1.0]

#define kHaveUnreadAtMessage    @"kHaveAtMessage"
#define kAtYouMessage           1
#define kAtAllMessage           2
#define TitleColor 0xFF8400
#define  Viewcolor 0xf8f8f8  //视图背景色
#define  Navcolor 0x73BF00     //导航栏背景色
#define  YellowButton 0xEBB223 //黄色按钮
#define OrganizationType 0

#define BOLDFONT(font) [UIFont boldSystemFontOfSize:font]
#define IMAGE(name) [UIImage imageNamed:name]
#define FONT(font) [UIFont fontWithName:@"Arial" size:font]
#define importantColor [UIColor colorWithRed:52/255.0 green:53/255.0 blue:57/255.0 alpha:1.0]
#define kGrayColor [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f]
#define SupportSystemVersion(v)  ([[[UIDevice currentDevice] systemVersion] floatValue] >= v)


UIKIT_EXTERN CGFloat const kTabBarHeight;
/**
 * 请求基地址
 */
UIKIT_EXTERN NSString *const kBaseUrl;
UIKIT_EXTERN NSString *const kImageURL;
UIKIT_EXTERN NSString *const KTestImageUrl;

//环信
UIKIT_EXTERN NSString *const kBaseUrl;
UIKIT_EXTERN NSString *const kBaseUrl;

//支付宝
UIKIT_EXTERN NSString *const kNotifyURL;
UIKIT_EXTERN NSString *const kSellerID;

//微信
UIKIT_EXTERN NSString *const kWeixinPay;

//友盟Appkey
UIKIT_EXTERN NSString *const UMAppkey;
UIKIT_EXTERN NSString *const WXAppID;
UIKIT_EXTERN NSString *const WXAppSecret;
UIKIT_EXTERN NSString *const QQAppID;
UIKIT_EXTERN NSString *const QQAppkey;
UIKIT_EXTERN NSString *const WBAppkey;
UIKIT_EXTERN NSString *const WXUrl;
UIKIT_EXTERN NSString *const QQUrl;

/**
 * 用户电话
 */
UIKIT_EXTERN NSString *const KLoginInfo;
UIKIT_EXTERN NSString *const kUserTel;
UIKIT_EXTERN NSString *const kUserClass;
UIKIT_EXTERN NSString *const kUserId;
UIKIT_EXTERN NSString *const kUserPsd;
UIKIT_EXTERN NSString *const kUserLoginStatus;
UIKIT_EXTERN NSString *const kUserIcon;
UIKIT_EXTERN NSString *const kUserName;


typedef NS_ENUM(NSInteger, KLUserType)
{
    UserParents = 0,  //家长
    UserOrganization,  //机构
    UserForTeacher,  //老师＝
};

typedef NS_ENUM(NSInteger, KLAttentionType)
{
    AttParents = 0,  //家长
    AttOrganization,  //机构
    AttCourse,  //课程
};

typedef NS_ENUM(NSInteger, kPhotoType)
{
    kPhotoTypeIconHeader = 1, // 头像
    kPhotoTypeTeachingPhoto,// 教师风采
};

typedef NS_ENUM(NSInteger, kOrderStatus)
{
    kOrderStatusAlreayCancel = 1,// 已取消
    kOrderStatusWaitingCheck = 2,// 待验证
    kOrderStatusAlreadyCheck = 3,// 已验证
    kOrderStatusAlreayplane = 4,// 已排课
    kOrderStatusAlreayCompletion = 5,// 已结课
};

typedef NS_ENUM(NSInteger, kNearbyType)
{
    kNearbyTypeOrgenization = 1,
    kNearbyTypeteacher,
};


//http://testwd.kocla.com/app/



#endif /* KLConstants_h */
