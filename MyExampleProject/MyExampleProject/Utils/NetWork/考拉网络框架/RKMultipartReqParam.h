//
//  RKMultipartReqParam.h
//  Kuke
//
//  Created by 成才 向 on 15/11/2.
//  Copyright © 2015年 RK. All rights reserved.
//

#import "KLBaseReqParam.h"

@interface RKMultipartFile : NSObject

@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSData *fileData;
+ (instancetype)fileWithName:(NSString *)name data:(NSData *)data;

@end

@protocol RKMultipartFile
@end

@interface RKMultipartReqParam : KLBaseReqParam

@property (nonatomic, strong) id<RKMultipartFile> file;  //文件

- (NSArray<RKMultipartFile *> *)files;

@end


//这个类的子类必须保证files 方法返回一个RKMultiparFile的数组
//或者将image对象加为子类属性, 在基类中自动处理,
//或者子类重写files方法,手动返回数组
