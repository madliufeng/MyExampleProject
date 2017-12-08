//
//  RKBaseJSONObjParam.h
//  Kuke
//
//  Created by HYZB on 15/10/29.
//  Copyright © 2015年 RK. All rights reserved.
//

/*
 *用来处理部分接口的参数为单个对象，接口需要按照json的格式传递。而服务端的非对象的接口又是按照key＝value的格式传递
 */

#import "KLBaseReqParam.h"

@interface RKBaseJSONObjParam : KLBaseReqParam

@end
