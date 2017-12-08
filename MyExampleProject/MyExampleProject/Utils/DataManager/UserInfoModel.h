//
//  UserInfoModel.h
//  MyProject
//  单例类 将数据存在内存中
//  Created by Pro on 2017/11/29.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseModel.h"

@interface UserInfoModel : LFBaseModel

@property (nonatomic, assign, getter=isFirst) BOOL isFirst;

+ (instancetype)defaultUserInfo;

@end
