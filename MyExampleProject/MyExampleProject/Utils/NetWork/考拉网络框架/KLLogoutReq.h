//
//  KLLogoutReq.h
//  MicroShopForParents
//
//  Created by Charse on 16/4/29.
//  Copyright © 2016年 Charse. All rights reserved.
//

/*
 退出登录
 1. 请求格式
 /user/logOut
 Method:POST
 2. 请求参数
 名称	Key	类型	必须	备注
 3. 返回值
 {
 “code”:0,
 “data”:null,
 “msg”:”mgs”,
 
 }
 */
#import "KLBaseReqParam.h"

@interface KLLogoutReq : KLBaseReqParam

@property (nonatomic, copy) NSString *phone;

@end


@interface KLLogoutResp : KLBaseRespParam

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *msg;

@end
