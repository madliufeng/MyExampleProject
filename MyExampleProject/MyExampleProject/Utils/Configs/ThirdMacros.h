//
//  ThirdMacros.h
//  MobileProject 第三方SDK的Key及配置
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#ifndef ThirdMacros_h
#define ThirdMacros_h

#pragma mark - 壹家教
//微信
// 针对app微信支付的唯一标识
#define WXAPPID @"wxfde2374628ee85c5"
// 秘钥
#define WXAPPSECRET @"1a7c2ed81ab689fb02d01a479c5844cf"
//商户API密钥，填写相应参数
#define WXPARTNER_ID  @"onKocla20160429xiachangweishezhi"
//商户号，填写商户对应参数
#define MCH_ID @"1462767002"


//支付宝
//应用ID，调用API时用来识别开发者
#define PARTNER @"2088801274903365"
//收款账号
#define SELLER @"account@ruanko.com"
// 应用私钥，pkcs8格式
#define PRIVATEKEY  @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBANiCOoiDEQTJziNyeIGdd4RxUQQU/ySYUs8E9zGWQIVM1AumP2MFSxsW/QnnHZ/vOHrfkeTLZxHjsfN4o/WZvf3XhXc7ydAwOTGqKt5Khkmi8LCs1RzdAcLPvyf3D1uOk6f7F1sXKfAkbVgmRan5ubhp1ZWTakm1xIWBgG3ZGbtRAgMBAAECgYAWjBFecA/QqNd/14b3MJfmwgpG24zqmbZd+s1na5dSinq2r9yACmgU7SLy6g+qvTXrjebapdgZA9ZfXZvtktI3MRbOW5u3PqtMBQCFBvzMP+tNVpBxe9XOm0Z/NIPjgfmae5wRd0WUfrHgqxZM7sjPE2fCVqoLUlY/tOClXbE0RQJBAPzHeAP5SNN42iV4R7yErMQTFMMzVmAvfE70KZb04A2PdcEY9N/rmV3hiQi4qT16/HSR4a+90ilaXGKGZFDwdN8CQQDbRHNUsaBxBgIPr7Lkgkw8ivd6POlSuacfo+24i+jF9DzVaTj3jR3wWtiRrikEWOu8mCU55JTKlV6atMlEGSXPAkBbCqybIcmtALXxEOUlbNOcuxKbS34snm2zMhVYnVGlEKpkpcxsabqPKY/laDzsO8N5aKFUXpW29yiXA7hVvoUZAkAsq/1zO90cKcUxvPINbB5sF0PkO5StrfVGlPdRqe96pQ/fytg4Vx/KYDfPNlRU9mjQu46aBN/rhhMIIdz/asAxAkB3yHfJNaL1h/RSDbxRctr7tK2kAc1tdjeHMDxO1B6x1wHIXNHrMqL3UXt8T1tfgC17CzCFt4kdYu5LdVip7zS0"

#define APPSCHEME @"onehourstudent"
#define Bundle identifier @"com.kocla.onehourstudent"
#define PRODUCTNAME @"一家教充值"



//QQ
#define QQAPPID  @"1104915930"
#define QQAPPSECRET @"6PKllJjceDKVcHxn"

//微博
#define App_Key @"3532828732"
#define WBAPP_SECRET @"cf729eabc705cf19f7285d7ca666dee0"
#define kRedirectURI @"https://api.weibo.com/oauth2/default.html"

//百度
#define BAIDUAPPKEY @"BaUlZMXkHGbwVjGLwyERv5nl3mgPBWPQ"

//友盟
#define UMengAPPKey @"5677ae4de0f55adb870023cf"
//#import "MobClick.h"
//#import "UMCheckUpdate.h"








/////////////////////////////////////////////////////////////////////////////////////////
//百度地图SDK的Key
#define  kBaiduMapKey @"20TTpXTnnp8TodtDXWjZBOvP"

//友盟统计SDK的key
#define kUmengKey @"53290df956240b6b4a0084b3"

//友盟分享
//--微信
#define kSocial_WX_ID @"wxdc1e388c3822c80b"
#define kSocial_WX_Secret @"a393c1527aaccb95f3a4c88d6d1455f6"
#define kSocial_WX_Url @"http://www.umeng.com/social"
//--QQ
#define kSocial_QQ_ID  @"100424468"
#define kSocial_QQ_Secret @"c7394704798a158208a74ab60104f0ba"
#define kSocial_QQ_Url @"http://www.umeng.com/social"
//--新浪微博
#define kSocial_Sina_Account @"3921700954"
#define kSocial_Sina_RedirectURL @"http://sns.whalecloud.com/sina2/callback"

// 科大讯飞
#define USER_APPID           @"56ce54a5"

//个推开发者网站中申请App时，注册的AppId、AppKey、AppSecret
#define kGtAppId           @"0uuwznWonIANoK07JeRWgA"
#define kGtAppKey          @"6LeO4stbrA7TeyMUJdXlx3"
#define kGtAppSecret       @"282vl0IwZd9KL3ZpDyoUL7"



//JSPatch中JS的路径  路径可以增加一个版本的文件夹用来区分不同的版本 （这个文件夹可以APP版本号为区分http://test.qshmall.net:9090/v111/demo.js  版本号(去掉中间的点)宏appMPVersion）
#define kJSPatchServerPath @"http://test.qshmall.net:9090/demo.js"


#endif /* ThirdMacros_h */
