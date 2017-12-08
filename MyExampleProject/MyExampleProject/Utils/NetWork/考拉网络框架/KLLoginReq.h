//
//  KLLoginReq.h
//  MicroShopForParents
//
//  Created by Charse on 16/4/29.
//  Copyright © 2016年 Charse. All rights reserved.
//

/*
 登陆
 1. 请求格式
 /user/login
 Method:POST
 2. 请求参数
 名称	Key	类型	必须	备注
 手机号码	phone	String	○
 密码	pwd	String	○
 登录来源	from	String	是	(1:机构,2:教师,0(默认):家长)
 3. 返回值
 {
 “code”:0
 “msg”:”登陆成功”,
 “data”:
 huanxinID:		环信登录ID
 phone		联系方式
 registerPhone	注册手机号码
 name		姓名
 avatar		头像
 }
 */

#import "KLBaseReqParam.h"

@interface KLLoginRespModel : JSONModel

@property (nonatomic, copy) NSString *huanxinID;
@property (nonatomic, copy) NSString *pId;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *registerPhone;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *userPsd;
@property (nonatomic, copy) NSString *WDJiaoXueDianId;
@property (nonatomic, copy) NSString *WDModeType;
@property (nonatomic, copy) NSString *JiaoXueDianId;
@property (nonatomic, copy) NSArray  *data;
@property (nonatomic, copy) NSString *ruankoUserId;
@property (nonatomic, copy) NSString *ruankoUserName;

- (void)saveDataToDiskCache;
+ (KLLoginRespModel *)getLoginInfoForCache;

@end

@interface KLLoginReq : KLBaseReqParam

@property (nonatomic, copy) NSString *orgId;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *pwd;
@property (nonatomic, assign)KLUserType from;

@end

@interface KLLoginResp : KLBaseRespParam

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) KLLoginRespModel *model;

@end
