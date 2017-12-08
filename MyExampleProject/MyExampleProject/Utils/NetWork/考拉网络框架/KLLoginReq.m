//
//  KLLoginReq.m
//  MicroShopForParents
//
//  Created by Charse on 16/4/29.
//  Copyright © 2016年 Charse. All rights reserved.
//

#import "KLLoginReq.h"

@implementation KLLoginRespModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

//+(JSONKeyMapper*)keyMapper
//{
//    return [[JSONKeyMapper alloc]
//            initWithDictionary:@{@"id": @"kid"}];
//}

- (void)saveDataToDiskCache
{
    NSString *jsonStr = [self toJSONString];
    if (jsonStr)
    {
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setBool:YES forKey:kUserLoginStatus];
        [def setObject:self.userPsd forKey:kUserPsd];
        [def setObject:self.registerPhone
                forKey:kUserTel];
        [def setObject:self.name forKey:kUserName];
        [def setObject:self.avatar forKey:kUserIcon];
        if (self.huanxinID)
        {
            Singleton * single = [Singleton sharedInstance];
            single.WDdianHua = self.registerPhone;
            
            NSString *uid = [self.huanxinID substringWithRange:NSMakeRange(0, (self.huanxinID.length-1))];
            [def setObject:uid forKey:kUserId];
            single.WDyonghuid = uid;
            single.pId = self.pId;
            single.WDisLogin = YES;
            single.WDhuanXinId = self.huanxinID;
            single.WDniCheng = self.name;
            
        }
        
        [def setObject:jsonStr forKey:KLoginInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (KLLoginRespModel *)getLoginInfoForCache
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *jsonStr = [def objectForKey:KLoginInfo];
    
    if (jsonStr)
    {
        return [[KLLoginRespModel alloc] initWithString:jsonStr error:nil];
    }
    
    return nil;
}

@end

@implementation KLLoginReq

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.interfaceURL = @"/user2_1_0/login";
        self.httpMethod = GET;
    }
    
    return self;
}

- (NSDictionary *)getDictionaryWithParam
{
    NSDictionary *dict = [super getDictionaryWithParam];
    
    if (self.orgId) {
        [dict setValue:self.orgId forKey:@"orgId"];
    }
    if (self.phone)
    {
        [dict setValue:self.phone forKey:@"phone"];
    }
    if (self.pwd)
    {
        [[NSUserDefaults standardUserDefaults] setObject:self.pwd
                                                  forKey:kUserPsd];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [dict setValue:self.pwd forKey:@"pwd"];
    }
    if (self.from)
    {
        [dict setValue:@(self.from) forKey:@"from"];
    }
    
    return dict;
}

- (KLBaseRespParam *)getResponseWithInfo:(id)info
{
    KLLoginResp *respon = [[KLLoginResp alloc] initWithResponse:info];
    return respon;
}

@end


@implementation KLLoginResp

- (id)initWithResponse:(id)reponse
{
    if (self = [super initWithResponse:reponse])
    {
        NSString *code = GETOBJECTFORKEY(reponse, @"code", [NSString class]);
        self.status = code.integerValue;
        self.msg = GETOBJECTFORKEY(reponse, @"msg", [NSString class]);
        NSDictionary *data = GETOBJECTFORKEY(reponse, @"data", [NSDictionary class]);
        self.model = [[KLLoginRespModel alloc] initWithDictionary:data error:nil];
        Singleton * single = [Singleton sharedInstance];
        //WDModeType：0：(工具模式) -1：(渠道模式)
        single.WDModeType = [data valueForKey:@"modeType"];
        single.WDJiaoXueDianId = [data valueForKey:@"wdJiaoXueDianId"];
    }
    return self;
}

@end
