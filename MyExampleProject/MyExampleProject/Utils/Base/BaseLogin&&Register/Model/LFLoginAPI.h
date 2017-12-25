//
//  LFLoginAPI.h
//  MyExampleProject
//
//  Created by Pro on 2017/12/6.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseAPI.h"
#import "LFBaseModel.h"
@class LFUserInfoModel;
@class LFXueKeListModel;
@class LFXueDuanNianJiListModel;

@interface LFLoginAPI : LFBaseAPI

@property (nonatomic, strong) NSArray <LFXueKeListModel *>*xueKeList;
@property (nonatomic, strong) NSArray <LFXueDuanNianJiListModel *>*xueDuanNianJiList;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray <LFUserInfoModel *>*list;

@end


@interface LFUserInfoModel : LFBaseModel

@property (nonatomic, strong) NSString *leiXing;
@property (nonatomic, strong) NSString *yongHuId;
@property (nonatomic, strong) NSString *dianHua;
@property (nonatomic, strong) NSString *zhenShiXingMin;
@property (nonatomic, strong) NSString *niCheng;
@property (nonatomic, strong) NSString *yongHuMing;
@property (nonatomic, strong) NSString *yongHuBianHao;
@property (nonatomic, strong) NSString *jiFen;
@property (nonatomic, strong) NSString *huanXinZhangHao;

@end

@interface LFXueKeListModel : LFBaseModel

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;

@end

@interface LFXueDuanNianJiListModel : LFBaseModel

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray <LFXueKeListModel *>*xueKeList;
@property (nonatomic, strong) NSArray <LFXueKeListModel *>*nianJiList;

@end
