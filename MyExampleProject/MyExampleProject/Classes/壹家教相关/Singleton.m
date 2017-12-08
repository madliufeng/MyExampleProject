//
//  Singleton.m
//  PPLessons
//
//  Created by admin on 2015/3/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "Singleton.h"

__strong static Singleton *singleton=nil;

@implementation Singleton

+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
        _ruankoUserName = [userdefault objectForKey:@"ruankoUserName"];
        _ruankoUserId = [userdefault objectForKey:@"ruankoUserId"];
    }
    return self;
}

-(void)setRuankoUserName:(NSString *)ruankoUserName
{
    _ruankoUserName = ruankoUserName;
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:ruankoUserName forKey:@"ruankoUserName"];
    [userdefault synchronize];
}

-(void)setRuankoUserId:(NSString *)ruankoUserId
{
    _ruankoUserId = ruankoUserId;
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:ruankoUserId forKey:@"ruankoUserId"];
    [userdefault synchronize];
}

// 获取渠道版本
- (NSString *)channel {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * channel = [infoDictionary objectForKey:@"channel"];
    return channel;
}
- (NSString *)aboutName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * aboutName = [infoDictionary objectForKey:@"aboutName"];
    return aboutName;
}
- (NSString *)mianShouKeTuiJian {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * mianShouKeTuiJian = [infoDictionary objectForKey:@"mianShouKeTuiJian"];
    return mianShouKeTuiJian;
}
- (NSString *)mianShouKe {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * mianShouKe = [infoDictionary objectForKey:@"mianShouKe"];
    return mianShouKe;
}
- (NSString *)jiGou {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * jiGou = [infoDictionary objectForKey:@"jiGou"];
    return jiGou;
}
- (NSString *)yingKe {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * yingKe = [infoDictionary objectForKey:@"yingKe"];
    return yingKe;
}
- (NSString *)shareTitle {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * shareTitle = [infoDictionary objectForKey:@"shareTitle"];
    return shareTitle;
}
- (NSString *)ruanJianXiYi {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * ruanJianXiYi = [infoDictionary objectForKey:@"ruanJianXiYi"];
    return ruanJianXiYi;
}
- (NSString *)keTangBiji {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * keTangBiji = [infoDictionary objectForKey:@"keTangBiji"];
    return keTangBiji;
}
- (NSString *)appIcon {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * appIcon = [infoDictionary objectForKey:@"appIcon"];
    return appIcon;
}
- (NSString *)appJianJie {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * appJianJie = [infoDictionary objectForKey:@"appJianJie"];
    return appJianJie;
}
- (NSString *)aboutOurURL {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * aboutOurURL = [infoDictionary objectForKey:@"aboutOurURL"];
    return aboutOurURL;
}
- (NSString *)keTangQuan {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * keTangQuan = [infoDictionary objectForKey:@"keTangQuan"];
    return keTangQuan;
}
- (NSString *)xueduan {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * xueduan = [infoDictionary objectForKey:@"xueduan"];
    return xueduan;
}
- (NSString *)subject {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * subject = [infoDictionary objectForKey:@"subject"];
    return subject;
}
- (NSString *)section {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * section = [infoDictionary objectForKey:@"section"];
    return section;
}
- (NSString *)yinDaoYe {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * yinDaoYe = [infoDictionary objectForKey:@"yinDaoYe"];
    return yinDaoYe;
}
- (NSString *)qiDongYe {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * qiDongYe = [infoDictionary objectForKey:@"qiDongYe"];
    return qiDongYe;
}
- (NSArray *)minItem1 {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSArray * minItem1 = [infoDictionary objectForKey:@"minItem1"];
    return minItem1;
}

- (NSArray *)minItem2 {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSArray * minItem2 = [infoDictionary objectForKey:@"minItem2"];
    return minItem2;
}
- (NSArray *)searItem {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSArray * searItem = [infoDictionary objectForKey:@"searItem"];
    return searItem;
}

- (NSString *)wxAppId {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * wxAppId = [infoDictionary objectForKey:@"WXAPPID"];
    return wxAppId;
}

- (NSString *)wxAppSecret {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * wxAppSecret = [infoDictionary objectForKey:@"WXAPPSECRET"];
    return wxAppSecret;
}

- (NSString *)qqAppId {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * qqAppId = [infoDictionary objectForKey:@"QQAPPID"];
    return qqAppId;
}

- (NSString *)qqAppSecret {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * qqAppSecret = [infoDictionary objectForKey:@"QQAPPSECRET"];
    return qqAppSecret;
}

-(NSString *)baiDuAppkey {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * baiDuAppKey = [infoDictionary objectForKey:@"BAIDUAPPKEY"];
    return baiDuAppKey;
    
}

-(NSString *)fromApp {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * fromApp = [infoDictionary objectForKey:@"fromApp"];
    return fromApp;
}

-(NSString *)fromProject {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * fromProject = [infoDictionary objectForKey:@"fromProject"];
    return fromProject;
}

-(NSString *)img_slogan {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * img_slogan = [infoDictionary objectForKey:@"img_slogan"];
    return img_slogan;
    
}

-(NSString *)duanLeiXing {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * duanLeiXing = [infoDictionary objectForKey:@"duanLeiXing"];
    return duanLeiXing;
    
}

//-(NSString *)PARTNER {
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString * PARTNER = [infoDictionary objectForKey:@"PARTNER"];
//    return PARTNER;
//}
//
//-(NSString *)SELLER {
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString * SELLER = [infoDictionary objectForKey:@"SELLER"];
//    return SELLER;
//}
//
//-(NSString *)PRIVATEKEY {
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString * PRIVATEKEY = [infoDictionary objectForKey:@"PRIVATEKEY"];
//    return PRIVATEKEY;
//}
//
//-(NSString *)PRODUCTNAME
//{
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString * PRODUCTNAME = [infoDictionary objectForKey:@"PRODUCTNAME"];
//    return PRODUCTNAME;
//}
//
//-(NSString *)APPSCHEME
//{
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString * APPSCHEME = [infoDictionary objectForKey:@"APPSCHEME"];
//    return APPSCHEME;
//}

-(NSString *)APPNAME
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * APPNAME = [infoDictionary objectForKey:@"APPNAME"];
    return APPNAME;
}

-(NSString *)wxMCH_ID {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * wxMCH_ID = [infoDictionary objectForKey:@"WXMCH_ID"];
    return wxMCH_ID;
}

-(NSString *)wxPARTNER_ID {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * wxPARTNER_ID = [infoDictionary objectForKey:@"WXPARTNER_ID"];
    return wxPARTNER_ID;
}

-(NSString *)appType {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * appType = [infoDictionary objectForKey:@"appType"];
    return appType;
}
-(NSString *)appTypeNum {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * appTypeNum = [infoDictionary objectForKey:@"appTypeNum"];
    return appTypeNum;
}


+(NSString *)acquireDocumentsPath
{
    
    NSString *imageDir = [NSString stringWithFormat:@"%@/Documents/%@", NSHomeDirectory(), @"TianAn_file"];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:imageDir isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:imageDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return  imageDir;
}

@end



