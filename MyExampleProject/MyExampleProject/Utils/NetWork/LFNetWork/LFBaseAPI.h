//
//  LFBaseAPI.h
//  MyProject
//
//  Created by Pro on 2017/11/9.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 网络配置信息

typedef NS_ENUM(NSInteger, NetworkCodeType) {
    /// 失败
    NetworkCodeTypeFail = 0,
    /// 成功
    NetworkCodeTypeSuccess = 1,
    /// 服务繁忙
    NetworkCodeTypeServiceBusy = -1,
    /// Token无效
    NetworkCodeTypeTokenInvalid = 40000,
};

@interface LFBaseAPI : NSObject<LFDataHanderProtocol>

@property (nonatomic, assign) NetworkCodeType code;

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSMutableDictionary *parameters;

@property (nonatomic, strong) NSArray *uploadFile;
///需要拼接的url
@property (nonatomic, copy) NSString *subUrl;
 ///服务器地址
@property (nonatomic, copy) NSString *baseUrl;


//拼接Url字符串
- (NSString *)appendedUrlString;

- (BOOL)isKindOfAPIClass:(Class)apiClass;

/**
 block 回调请求方法

 @param type type 请求方式
 @param success 请求服务器成功的数据回调
 @param failure 请求服务器失败的数据回调
 */
- (void)startRequestWithType:(RequestType)type
                                success:(nullable void (^)(id _Nullable responseObject))success
                                failure:(nullable void (^)(NSError *_Nonnull error))failure;


/**
 代理回调请求     有两种回调方式，一种是回调请求服务器成功、一种是回调请求数据成功 code == 1的数据

 @param type 请求方式
 @param delegate 代理
 */
- (void)startRequestWithType:(RequestType)type backWithDelegate:(id <LFDataHanderProtocol>)delegate;
@end

