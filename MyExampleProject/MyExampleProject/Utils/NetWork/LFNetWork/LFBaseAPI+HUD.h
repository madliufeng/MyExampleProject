//
//  LFBaseAPI+HUD.h
//  MyProject
//
//  Created by Pro on 2017/11/14.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseAPI.h"

@interface LFBaseAPI (HUD)

@property (nonatomic, strong) MBProgressHUD *HUD;

@property (nonatomic, strong) UIView *containerView;

/**
 *  Default YES...
 */
@property (nonatomic, assign, getter=isShowErrorMsg) BOOL showErrorMsg;

/**
 *  Default YES...
 */
@property (nonatomic, assign, getter=isShowFailureMsg) BOOL showFailureMsg;

/**
 *  Default YES...
 */
@property (nonatomic, assign, getter=isParametersAddToken) BOOL parametersAddToken;


- (void)showHUDWhileRequest:(UIView *)containerView;

- (void)hideHUDWhileFinish;

- (void)showMsgWhileJSONError;

/**
 *  @author hejing
 *
 *  请求成功，但返回code不是成功状态提示错误信息
 *
 *  @param msg 错误信息
 */
- (void)showMsgWhileRequestFailure:(NSString *)msg;

- (void)showMsgWhileTokenExpire:(NSString *)msg;

/**
 *  @author hejing
 *
 *  请求错误，提示失败信息
 *
 *  @param msg 请求错误信息
 */
- (void)showMsgWhileRequestError:(NSString *)msg;


#pragma mark - LocalResponse

- (NSString *)localResponseDataPath;

- (NSDictionary *)localResponseJSON;

- (void)retrunCodeEqualToSuccessDoNextStep:(voidBlock)nextStep;

- (void)retrunMsgEqualTo:(NSString *)msg doNextStep:(voidBlock)nextStep;

@end
