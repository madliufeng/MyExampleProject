//
//  LFNetworkTools.m
//  MyProject
//
//  Created by Pro on 2017/11/14.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFNetworkTools.h"

#define kTimeoutInterval 8

@implementation LFNetworkTools

+ (instancetype)sharedTool {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithBaseURL:nil];
    });
    
    return instance;
}

//MARK: 一次封装的网络工具类
- (void)requestWithType:(RequestType)type
              URLString:(NSString *)URLString
             parameters:(nullable id)parameters
               progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置请求头
//    [self.requestSerializer setValue:APP_key forHTTPHeaderField:@"APP_key"];
//    [self.requestSerializer setValue:[[APP_key stringByAppendingString:API_APP_BASE_URL] md5String]forHTTPHeaderField:@"APP_scode"];
    //设置超时时间
    self.requestSerializer.timeoutInterval = kTimeoutInterval;

    if (type == RequestTypeGET) {
        [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
    } else if (type == RequestTypePOST) {
        [self POST:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
    }
}

//MARK: 二次封装的网络工具类
- (void)requestWithType:(RequestType)type
              URLString:(nonnull NSString *)URLString
             parameters:(nullable id)parameters
                success:(nullable void (^)(id _Nullable responseObject))success
                failure:(nullable void (^)(NSError *_Nonnull error))failure
{
    void (^orginalSuccess)(NSURLSessionDataTask * _Nullable, id  _Nullable) = ^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        success(responseObject);
    };
    void (^orginalFailure)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    };
    
    [self requestWithType:type URLString:URLString parameters:parameters progress:nil success:orginalSuccess failure:orginalFailure];
}

//MARK: 三次封装的网络工具类
+ (void)requestWithType:(RequestType)type
              URLString:(nonnull NSString *)URLString
             parameters:(nullable id)parameters
                success:(nullable void (^)(id _Nullable responseObject))success
                failure:(nullable void (^)(NSError *_Nonnull error))failure
{
    [[LFNetworkTools sharedTool] requestWithType:type URLString:URLString parameters:parameters success:success failure:failure];
}

@end
