//
//  KLCheckIsLoginReq.m
//  MicroShopForParents
//
//  Created by Charse on 16/4/29.
//  Copyright © 2016年 Charse. All rights reserved.
//

#import "KLCheckIsLoginReq.h"


@implementation KLCheckIsLoginReq

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.interfaceURL = @"/user/isLogin";
        self.httpMethod = POST;
    }
    
    return self;
}

- (NSDictionary *)getDictionaryWithParam
{
    NSDictionary *dict = [super getDictionaryWithParam];
    if (self.phone)
    {
        [dict setValue:self.phone forKey:@"phone"];
    }
    
    
    return dict;
}

- (KLBaseRespParam *)getResponseWithInfo:(id)info
{
    KLCheckIsLoginResp *respon = [[KLCheckIsLoginResp alloc] initWithResponse:info];
    return respon;
}

@end

@implementation KLCheckIsLoginResp

- (id)initWithResponse:(id)reponse
{
    if (self = [super initWithResponse:reponse])
    {
        NSString *code = GETOBJECTFORKEY(reponse, @"code", [NSString class]);
        self.status = code.integerValue;
        self.msg = GETOBJECTFORKEY(reponse, @"msg", [NSString class]);
        NSDictionary *data = GETOBJECTFORKEY(reponse, @"data", [NSDictionary class]);
        NSString *isLogin = data[@"isLogin"];
        self.isLogin = isLogin.integerValue;
    }
    return self;
}


@end
