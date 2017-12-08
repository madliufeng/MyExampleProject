//
//  RKBaseReqParam.m
//  Kuke
//
//  Created by HYZB on 15/10/15.
//  Copyright © 2015年 RK. All rights reserved.
//
#import <objc/runtime.h>
#import "KLBaseReqParam.h"
#import "KLHttpSessionManager.h"
#import "JSONModel.h"
//#import "RKMultipartReqParam.h"
#import "NSObject+cc_introspect.h"
#import "JSONKit.h"

@interface KLBaseRespParam ()

@property (nonatomic, assign) BOOL resultStatus;
@property (nonatomic, strong) id jsonData;
@property (nonatomic, copy) NSString *errMsg;

@end

@implementation KLBaseRespParam

- (id)initWithResponse:(id)reponse
{
    self = [super init];
    if (self)
    {
        if ([reponse isKindOfClass:[NSDictionary class]])
        {
            NSString *resultCode = GETOBJECTFORKEY(reponse, @"code", NSString);
            if (resultCode.length > 0)
            {
//                self.resultStatus = [resultCode isEqualToString:@"SUCCESS"];
                self.resultStatus = [resultCode isEqualToString:@"0"];
                self.jsonData = [reponse objectForKey: @"data"];
                self.errMsg = GETOBJECTFORKEY(reponse, @"msg", NSString);;
            }
            else
            {
                self.resultStatus = YES;
            }
        }
        else if ([reponse isKindOfClass:[NSArray class]])
        {
            self.resultStatus = YES;
        }
    }
    
    return self;
}

@end

@interface KLBaseReqParam ()
{
    BOOL _hasFile;
    BOOL _paramIsJson;
}

@property (nonatomic, strong) NSMutableDictionary *jsonDictionary;
@property (nonatomic, copy) RequestResult requestResult;
@property (nonatomic, copy) NSString *baseURL;

@end

@implementation KLBaseReqParam

- (void)dealloc
{
    self.requestResult = nil;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.httpMethod = GET;
//        WDIMageSeverHost
        self.baseURL = WDSeverHost;
    }
    return self;
}

#pragma mark pulice methods
- (NSMutableDictionary *)getDictionaryWithParam
{
    NSMutableArray* propertyArray = [[NSMutableArray alloc] init];
    NSMutableArray* valueArray = [[NSMutableArray alloc] init];
    
    Class subclass = [self class];
    
    while (subclass != [NSObject class])
    {
        u_int count = 0;
        
        objc_property_t* properties = class_copyPropertyList(subclass, &count);
        
        for (int i = 0; i < count ; i++)
        {
            objc_property_t prop=properties[i];
            const char* propertyName = property_getName(prop);
            NSString *property = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            
            id value = [self valueForKey:property];// [self performSelector:sel];
            
            if (value != nil)
            {
                if (property)
                {
                    
                    if ([value isKindOfClass:[JSONModel class]])
                    {
                        [propertyArray addObject:property];
                        NSString *jsonStr = [(JSONModel *)value toJSONString];
                        [valueArray addObject:jsonStr];
                    }
                    else if (![value isKindOfClass:[NSData class]])
                    {
                        [propertyArray addObject:property];
                        [valueArray addObject:value];
                    }
                }
            }
        }
        free(properties);
        
        subclass = class_getSuperclass(subclass);
    }
    
    NSMutableDictionary* returnDic = [NSMutableDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
    
    [returnDic removeObjectForKey:@"httpMethod"];
    [returnDic removeObjectForKey:@"taskTag"];
    [returnDic removeObjectForKey:@"baseURL"];
    [returnDic removeObjectForKey:@"requestResult"];
    [returnDic removeObjectForKey:@"interfaceURL"];
    
    
    return returnDic;
}

- (NSString *)getRequstURL
{
    return [NSString stringWithFormat:@"%@%@", self.baseURL, self.interfaceURL];
}

#pragma mark pulice methods

- (void)sendReuqest:(RequestResult)result
{
    self.requestResult = result;
    
    //在arc下，导致回调的时候 delegate有问题
    KLHttpSessionManager *manager = [KLHttpSessionManager sharedClient];
    [manager sendRequestWithParam:self];
}

- (void)cancel
{
    KLHttpSessionManager *manager = [KLHttpSessionManager sharedClient];
    [manager cancelRequestWithParam:self];
    
    self.requestResult = nil;
    self.jsonDictionary = nil;
}

//统一的返回数据
- (KLBaseRespParam *)getResponseWithInfo:(id)info
{
    NSString *clsName = NSStringFromClass([self class]);
    NSString *respName = [clsName stringByReplacingOccurrencesOfString:@"Req" withString:@"Resp"];
    Class respClass = NSClassFromString(respName);
    if (respClass && [respClass instancesRespondToSelector:@selector(initWithResponse:)])
    {
        return [[respClass alloc] initWithResponse:info];
    }
    else
    {
        KLBaseRespParam *response = [[KLBaseRespParam alloc] initWithResponse:info];
        return response;
    }
}

- (void)requestCompletionCallback:(id)result
{
    if (!self.requestResult) {
        return;
    }
    NSError *error = nil;
    if ([result isKindOfClass:[NSData class]])
    {
        NSError *jsonErr = nil;
        NSString *responseString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        DebugNSLog(@"服务器返回数据%@", responseString);
//        id jsonObj = [NSJSONSerialization JSONObjectWithData:result options:0 error:&jsonErr];
        id jsonObj = [responseString objectFromJSONStringWithParseOptionsHY:JKParseOptionIgnoreDatatypes error:&error];
        
        if (jsonObj)
        {
            KLBaseRespParam *response = [self getResponseWithInfo:jsonObj];
            self.requestResult(response, error);
        }
        else if (responseString)
        {
            KLBaseRespParam *response = [self getResponseWithInfo:responseString];
            self.requestResult(response, error);
        }
        else
        {
            KLBaseRespParam *response = [self getResponseWithInfo:result];
            self.requestResult(response, error);
        }
    }
    else
    {
        NSError *err = [NSError errorWithDomain:@"网络错误" code:0 userInfo:nil];
        self.requestResult(nil, err);
    }
}

- (void)requestFailedCallback:(NSError *)error
{
    DebugNSLog(@"request response error = %@", error);
    if (self.requestResult) {
        self.requestResult(nil, error);
    }
    self.requestResult = nil;
}
@end
