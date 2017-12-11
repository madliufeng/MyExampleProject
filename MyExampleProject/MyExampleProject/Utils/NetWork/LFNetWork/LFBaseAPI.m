//
//  LFBaseAPI.m
//  MyProject
//
//  Created by Pro on 2017/11/9.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseAPI.h"
static NSString * const kParametersAddTokenKeyPath = @"parametersAddToken";

@implementation LFBaseAPI

- (NSString *)debugDescription {
    NSArray *keys = @[
                      @"code",
                      @"msg",
                      @"data",
                      ];
    
    return [NSString stringWithFormat:@"%@\n%@", [super debugDescription], [self mj_keyValuesWithKeys:keys]];
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if (oldValue == nil || oldValue == [NSNull null]) {
        return @"";
    }
    return oldValue;
}

- (NSString *)appendedUrlString {
    NSString *url = [NSString stringWithFormat:@"%@%@",self.baseUrl,self.subUrl];
    return  [NSString lf_subUrlString:url appendingParameters:self.parameters];
}

- (BOOL)isKindOfAPIClass:(Class)apiClass {
    
    if ([self isKindOfClass:apiClass]) {
        
        return YES;
    }
    
    return NO;
}

- (NSMutableDictionary *)parameters {
    
    if (!_parameters) {
        
        _parameters = [NSMutableDictionary dictionary];
    }
    
    return _parameters;
}

- (void)startRequestWithType:(RequestType)type
                                success:(nullable void (^)(id _Nullable responseObject))success
                                failure:(nullable void (^)(NSError *_Nonnull error))failure {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",self.baseUrl,self.subUrl];
    [LFNetworkTools requestWithType:type URLString:url parameters:self.parameters success:^(id  _Nullable responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
      
#ifdef DEBUG
        [self logFinished:dict error:nil];
#endif
        //block 传值
        if (success) {
            success(dict);
        }
        
    } failure:^(NSError * _Nonnull error) {
#ifdef DEBUG
        [self logFinished:nil error:error];
#endif
        if (failure) {
            failure(error);
        }
    }];
    
}

- (void)startRequestWithType:(RequestType)type backWithDelegate:(id<LFDataHanderProtocol>)delegate {
    NSString *url = [NSString stringWithFormat:@"%@%@",self.baseUrl,self.subUrl];
    [LFNetworkTools requestWithType:type URLString:url parameters:self.parameters success:^(id  _Nullable responseObject) {
        //请求成功
        if (delegate && [delegate respondsToSelector:@selector(netWorkRequestSuccessBackWithResponseObject:)]) {
            [delegate netWorkRequestSuccessBackWithResponseObject:responseObject];
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

#ifdef DEBUG
        [self logFinished:dict error:nil];
#endif

        LFBaseAPI *bAPIModel = [[self class] mj_objectWithKeyValues:dict];

        if (!bAPIModel || bAPIModel.code != NetworkCodeTypeSuccess) {
            return;
        }

        //代理传值
        if (delegate && [delegate respondsToSelector:@selector(netWorkCodeSuccessBackWithResponseObject:)]) {
            [delegate netWorkCodeSuccessBackWithResponseObject:bAPIModel];
        }


    } failure:^(NSError * _Nonnull error) {
#ifdef DEBUG
        [self logFinished:nil error:error];
#endif
    }];
    
}

//服务器地址
- (NSString *)baseUrl {
    return SeverHost;
}
//- (LFBaseAPI *)dealWhileSuccess:(id)responseObject {
// 请求完成后block
//    APIFinishedBlock reqFinishedBlock = [self requestFinishedBlock];
//    reqFinishedBlock(responseObject, nil);

//    LFBaseAPI *bAPIModel = [[self class] mj_objectWithKeyValues:responseObject];
//    NSInteger code = bAPIModel.code;
//    NSString *msg = bAPIModel.msg;

//返回数据不存在，显示服务器错误
//    if (!responseObject) {
//        [self.baseAPI showMsgWhileJSONError];
//    }
//
//    else if (code == NetworkCodeTypeTokenInvalid) {
//        // token过期，直接退出
//        [self.baseAPI showMsgWhileTokenExpire:msg];
//
//        return nil;
//    }
//    else if (code != NetworkCodeTypeSuccess) {
//
//        //返回code不为成功是否显示返回msg信息
//        [self.baseAPI showMsgWhileRequestFailure:msg];
//    }
//    else {
//        // 成功获取数据后，去掉HUD
//        [self.baseAPI hideHUDWhileFinish];
//    }

//    return bAPIModel;
//}

#pragma mark - log
- (void)logFinished:(NSDictionary*)response error:(NSError*)error {
        // 字典格式
    NSString *paramStr = [NSString stringWithFormat:@"\n%@", self.parameters];
    DDLogVerbose(@"*************start**************\n-------------------- 接口请求开始 ----------------------URL=%@",[self appendedUrlString]);
    DDLogInfo(@"接口地址：%@\n请求参数：%@\n拼接url：%@", [self appendedUrlString], paramStr,    [NSString lf_subUrlString:[self appendedUrlString] appendingParameters:self.parameters]);
    
    if (!error) {
        DDLogInfo(@"请求成功：\n%@\n  msg=%@", response ,[response objectForKey:@"msg"]);
    }
    else {
        DDLogError(@"请求失败：\n%@", error);
    }
    DDLogVerbose(@"-------------------- 接口请求结束 ----------------------URL=%@\n************end**************",[self appendedUrlString]);
    
}

@end

