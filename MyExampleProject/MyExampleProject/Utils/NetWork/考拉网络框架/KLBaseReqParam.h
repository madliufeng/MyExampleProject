//
//  RKBaseReqParam.h
//  Kuke
//
//  Created by HYZB on 15/10/15.
//  Copyright © 2015年 RK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

typedef NS_ENUM(NSInteger, RKHTTPMethod)
{
    POST,
    GET
};

typedef void(^RequestResult)(id result, NSError *error);

@interface KLBaseRespParam : NSObject
{
    @protected
    BOOL _resultStatus;
}
@property (nonatomic, assign, readonly) BOOL resultStatus;
@property (nonatomic, assign, readonly) NSInteger errCode;
@property (nonatomic, copy, readonly) NSString *errMsg;
@property (nonatomic, strong, readonly) id jsonData;

- (id)initWithResponse:(id)reponse;

@end


@interface KLBaseReqParam : NSObject

@property (nonatomic, assign) RKHTTPMethod httpMethod;  //http请求的方式：POST/GET
@property (nonatomic, copy) NSString *interfaceURL;  //接口地址
@property (nonatomic, copy, readonly) NSString *baseURL;  //接口基地址
@property (nonatomic, assign) NSInteger taskTag;

- (NSMutableDictionary *)getDictionaryWithParam;
- (NSString *)getRequstURL;

//统一的返回数据
- (KLBaseRespParam *)getResponseWithInfo:(id)info;

- (void)requestCompletionCallback:(NSString *)response;
- (void)requestFailedCallback:(NSError *)error;

//sendreuqset
- (void)sendReuqest:(RequestResult)result;

- (void)cancel;

@end

