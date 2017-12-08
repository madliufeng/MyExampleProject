//
//  LFProtocol.h
//  MyExampleProject
//
//  Created by Pro on 2017/12/7.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 网络数据请求协议
@protocol LFDataHanderProtocol <NSObject>

@optional

/**
请求数据成功
 @param responseObject 返回的数据
 */
- (void)netWorkCodeSuccessBackWithResponseObject:(id)responseObject;

/**
 网络请求成功
 @param responseObject 返回的数据
 */
- (void)netWorkRequestSuccessBackWithResponseObject:(id)responseObject;

@end
