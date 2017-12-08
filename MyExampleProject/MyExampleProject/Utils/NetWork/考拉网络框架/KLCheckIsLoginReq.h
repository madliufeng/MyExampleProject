//
//  KLCheckIsLoginReq.h
//  MicroShopForParents
//
//  Created by Charse on 16/4/29.
//  Copyright © 2016年 Charse. All rights reserved.
//

/*
 判断登录状态
 1. 请求格式
 /user/isLogin
 Method:POST
 2. 请求参数
 名称	Key	类型	必须	备注
 3. 返回值
 {
 “code”:0,
 “data”:
 isLogin	登录状态	(0:未登录；1:已登录)
 “msg”:”mgs”,
 }
 */
#import "KLBaseReqParam.h"

@interface KLCheckIsLoginReq : KLBaseReqParam

@property (nonatomic, copy) NSString *phone;

@end

@interface KLCheckIsLoginResp : KLBaseRespParam

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger isLogin;


@end
