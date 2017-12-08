//
//  LFNetworkTools.h
//  MyProject
//
//  Created by Pro on 2017/11/14.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef enum : NSUInteger {
    RequestTypeGET, //get
    RequestTypePOST,//post
} RequestType;

@interface LFNetworkTools : AFHTTPSessionManager

/**
 创建网络请求工具类的单例
 */
+ (instancetype _Nullable )sharedTool;

//第一次封装参数比较多,比较长
- (void)requestWithType:(RequestType)type
              URLString:(nonnull NSString *)URLString
             parameters:(nullable id)parameters
               progress:(nullable void (^)(NSProgress *_Nonnull downloadProgress))downloadProgress success:(nullable void (^)(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject))success
                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *_Nonnull error))failure;

//第二次封装,简化参数,把没有用的progress参数去掉
- (void)requestWithType:(RequestType)type
              URLString:(nonnull NSString *)URLString
             parameters:(nullable id)parameters
                success:(nullable void (^)(id _Nullable responseObject))success
                failure:(nullable void (^)(NSError *_Nonnull error))failure;

//第三次封装,直接使用类方法,外部调用单例都不用创建
+ (void)requestWithType:(RequestType)type
              URLString:(nonnull NSString *)URLString
             parameters:(nullable id)parameters
                success:(nullable void (^)(id _Nullable responseObject))success
                failure:(nullable void (^)(NSError *_Nonnull error))failure;
@end
