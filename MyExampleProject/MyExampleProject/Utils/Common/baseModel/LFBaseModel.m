//
//  LFBaseModel.m
//  MyProject
//
//  Created by Pro on 2017/11/9.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseModel.h"

@implementation LFBaseModel
- (id)copyWithZone:(NSZone *)zone {
    
    return self;
}

- (NSString *)debugDescription {
    
    return [NSString stringWithFormat:@"%@\n%@", [super debugDescription], [self mj_keyValues]];
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if (oldValue == nil || oldValue == [NSNull null]) {
        if (property.type.typeClass == [NSArray class]) {
            return @[];
        }
        else if (property.type.typeClass == [NSDictionary class]) {
            return @{};
        }
        return @"";
    }
    return oldValue;
}

#pragma mark - <BaseModelReadWriteProtocol>

MJCodingImplementation

+ (NSString *)filePath {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    return [cachePath stringByAppendingPathComponent:NSStringFromClass(self.class)];
}

+ (instancetype)read {
    NSString *filePath = [self filePath];
    if (filePath && [[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    return nil;
}

- (void)write {
    NSString *filePath = [[self class] filePath];
    if (filePath) {
        BOOL isSuccess = [NSKeyedArchiver archiveRootObject:self toFile:filePath];
        if (isSuccess) {
            NSLog(@"归档 %@ 成功", self.class);
        }
    }
}

@end
