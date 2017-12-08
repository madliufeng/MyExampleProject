//
//  LFBaseModel.h
//  MyProject
//
//  Created by Pro on 2017/11/9.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseModelReadWriteProtocol <NSCoding,NSCopying>

/**
 *  本地文件路径
 *
 *  @return 本地文件路径
 */
+ (NSString *)filePath;

/**
 *  读取本地
 *
 *  @return model
 */
+ (instancetype)read;

/**
 *  写入本地
 */
- (void)write;

@end


@interface LFBaseModel : NSObject <BaseModelReadWriteProtocol>

@end
