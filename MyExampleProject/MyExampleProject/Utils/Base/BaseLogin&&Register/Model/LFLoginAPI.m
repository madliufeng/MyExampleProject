//
//  LFLoginAPI.m
//  MyExampleProject
//
//  Created by Pro on 2017/12/6.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFLoginAPI.h"
@implementation LFLoginAPI
+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"xueDuanNianJiList" : [LFXueDuanNianJiListModel class],
             @"xueKeList" : [LFXueKeListModel class],
             @"list" : [LFUserInfoModel class],
             };
}


@end


@implementation LFUserInfoModel


@end

@implementation LFXueKeListModel

@end

@implementation LFXueDuanNianJiListModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"nianJiList" : [LFXueKeListModel class],
             @"xueKeList" : [LFXueKeListModel class],
             };
}
@end


