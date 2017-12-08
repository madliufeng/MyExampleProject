//
//  UserInfoModel.m
//  MyProject
//
//  Created by Pro on 2017/11/29.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "UserInfoModel.h"

static UserInfoModel *userInfo = nil;

@implementation UserInfoModel

+ (instancetype)defaultUserInfo {
    
    static id _userInfo = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _userInfo = [[self alloc]init];
    });
    return _userInfo;
}

@end
