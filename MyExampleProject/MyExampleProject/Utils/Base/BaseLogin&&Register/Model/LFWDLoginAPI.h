//
//  LFWDLoginAPI.h
//  MyExampleProject
//
//  Created by jk on 2017/12/12.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseAPI.h"
@class LFWDLoginModel;
@interface LFWDLoginAPI : LFBaseAPI

@property (nonatomic, strong) LFWDLoginModel *data;

@end

@interface LFWDLoginModel : NSObject

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *registerPhone;
@property (nonatomic, strong) NSString *modeType;
@property (nonatomic, strong) NSString *ruankoUserName;
@property (nonatomic, strong) NSString *pId;
@property (nonatomic, strong) NSString *ruankoUserId;
@property (nonatomic, strong) NSString *huanxinID;
@property (nonatomic, strong) NSString *name;

@end
