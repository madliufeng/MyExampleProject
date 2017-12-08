//
//  RKHttpSessionManager.m
//  Kuke
//
//  Created by HYZB on 15/10/19.
//  Copyright © 2015年 RK. All rights reserved.
//

#import "KLHttpSessionManager.h"
#import "RKBaseJSONObjParam.h"
#import "RKMultipartReqParam.h"

static KLHttpSessionManager *_sharedClient = nil;

@interface KLHttpSessionManager ()
{
    NSInteger _requestTag;  //自增长的请求tag；
    NSMutableDictionary *_requestDic;  //带tag的请求，用来出来cancel
}

@end

@implementation KLHttpSessionManager

+ (instancetype)sharedClient {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[KLHttpSessionManager alloc] init];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        NSMutableSet *set = [NSMutableSet setWithSet:_sharedClient.responseSerializer.acceptableContentTypes];
        [set addObject:@"application/json"];
        [set addObject:@"application/octet-stream"];
        _sharedClient.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
        _sharedClient.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
        _sharedClient.requestSerializer.timeoutInterval = 30.f;
        _sharedClient.responseSerializer.acceptableContentTypes = set;
        
        [_sharedClient reset];
    });
    
    return _sharedClient;
}

- (void)reset
{
    _requestTag = 1000;
    _requestDic = [[NSMutableDictionary alloc] init];
}

#pragma mark setter/getter
- (NSInteger)getRequestTag
{
    return ++_requestTag;
}

#pragma mark private methods
- (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

#pragma mark pulice methods
- (void)sendRequestWithParam:(KLBaseReqParam *)param
{
    param.taskTag = [self getRequestTag];
    
    if ([param isKindOfClass:[RKBaseJSONObjParam class]])
    {
        _sharedClient.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    }
    else
    {
        _sharedClient.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    }
    
    NSDictionary *paramDic = [param getDictionaryWithParam];
    NSString *interfaceUrl = [param getRequstURL];
    DebugNSLog(@"interfaceURL %@ \n paramDic %@",interfaceUrl, paramDic);
    
    NSURLSessionDataTask *task = nil;
    if ([param isKindOfClass:[RKMultipartReqParam class]])
    {
        task = [self POST:interfaceUrl
               parameters:paramDic
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
                {
                    for (RKMultipartFile*file in [(RKMultipartReqParam *)param files])
                    {
                        NSString *contentType = [self contentTypeForImageData:file.fileData];
                        if (!contentType) {
                            contentType = @"audio/amr";
                        }
                        if (contentType)
                        {
                            [formData appendPartWithFileData:file.fileData
                                                        name:@"file"
                                                    fileName:file.fileName
                                                    mimeType:contentType];
                        }
                        else
                        {
                            [formData appendPartWithFormData:file.fileData
                                                        name:@"file" ];
                        }
                    }
                }
                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject)
                {
                    [param requestCompletionCallback:responseObject];
                    
                }
                  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                      [param requestFailedCallback:error];
                  }];
    }
    else if ([param isKindOfClass:[RKBaseJSONObjParam class]])
    {
        task = [self POST:interfaceUrl
               parameters:paramDic
                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                      [param requestCompletionCallback:responseObject];
                  }
                  failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                      [param requestFailedCallback:error];
                  }];
        
    }
    else
    {
        if (POST == param.httpMethod)
        {
            task = [self POST:interfaceUrl
                   parameters:paramDic
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                          [param requestCompletionCallback:responseObject];
                      }
                      failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                          [param requestFailedCallback:error];
                      }];
        }
        else    //get
        {
            task = [self GET:interfaceUrl
                  parameters:paramDic
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                         [param requestCompletionCallback:responseObject];
                     } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                         [param requestFailedCallback:error];
                     }];
        }
    }
    
    
    if (task && [param taskTag])
    {
        NSNumber *key = [NSNumber numberWithInteger:[param taskTag]];
        
        [_requestDic setObject:task
                        forKey:key];
    }
}

- (void)cancelRequestWithParam:(KLBaseReqParam *)param
{
    if (_requestDic && param.taskTag)
    {
        NSNumber *key = [NSNumber numberWithInteger:param.taskTag];
        NSURLSessionDataTask *task = [_requestDic objectForKey:key];
        if (task)
        {
            [task cancel];
            [_requestDic removeObjectForKey:key];
        }
    }
}

- (void)cancelAll
{
    for (id obj in [_requestDic allValues])
    {
        if ([obj isKindOfClass:[NSURLSessionDataTask class]])
        {
            NSURLSessionDataTask *task = (NSURLSessionDataTask *)obj;
            [task cancel];
        }
    }
    
    [self reset];
}

- (void)cleanCache
{
}

@end
