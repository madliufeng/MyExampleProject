//
//  RKHttpSessionManager.h
//  Kuke
//
//  Created by HYZB on 15/10/19.
//  Copyright © 2015年 RK. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "KLBaseReqParam.h"


@interface KLHttpSessionManager : AFHTTPSessionManager

+ (instancetype)sharedClient;

/**
 *  发送请求
 *
 *  @param requestParam 请求的参数的对象
 */
- (void)sendRequestWithParam:(KLBaseReqParam *)param;

/**
 *	@brief	根据请求参数的tag，取消掉某一个请求
 *
 *	@param 	requestParam 	请求的参数
 */
- (void)cancelRequestWithParam:(KLBaseReqParam *)param;

- (void)cancelAll;
- (void)cleanCache;
@end
