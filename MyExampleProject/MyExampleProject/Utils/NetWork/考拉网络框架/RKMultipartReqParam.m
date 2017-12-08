//
//  RKMultipartReqParam.m
//  Kuke
//
//  Created by 成才 向 on 15/11/2.
//  Copyright © 2015年 RK. All rights reserved.
//

#import "RKMultipartReqParam.h"
#import "NSObject+cc_introspect.h"
#import <UIKit/UIKit.h>

@implementation RKMultipartReqParam

- (id)init
{
    self = [super init];
    if (self)
    {
        self.httpMethod = POST;
    }
    return self;
}

- (NSArray<RKMultipartFile *> *)files
{
    NSMutableArray *files = [NSMutableArray array];
    NSArray *propertys = [self cc_propertys];
    
    for (cc_Property *property in propertys)
    {
        if ([property.protocol isEqualToString:@"RKMultipartFile"])
        {
            id value = [self valueForKey:property.name];
            if ([value isKindOfClass:[UIImage class]])
            {
                RKMultipartFile *file = [[RKMultipartFile alloc] init];
                UIImage *img = [self valueForKey:property.name];
                file.fileData = UIImageJPEGRepresentation(img, .2);
                file.fileName =  [NSString stringWithFormat:@"%ld.jpg", (long)[[NSDate date] timeIntervalSince1970]];
                [files addObject:file];
            }
            else if ([value isKindOfClass:[NSArray class]])
            {
                NSArray *imgs = [self valueForKey:property.name];
                for (id element in imgs)
                {
                    if ([element isKindOfClass:[UIImage class]])
                    {
                        RKMultipartFile *file = [[RKMultipartFile alloc] init];
                        UIImage *img = element;
                        file.fileData = UIImageJPEGRepresentation(img, .5);
                        file.fileName =  [NSString stringWithFormat:@"%ld.jpg", (long)([[NSDate date] timeIntervalSince1970] * 1000)];
                        [files addObject:file];
                    }
                }
            }
            else if ([value isKindOfClass:[NSData class]])
            {
                RKMultipartFile *file = [[RKMultipartFile alloc] init];
                file.fileData = value;
                file.fileName =  [NSString stringWithFormat:@"%ld.jpg", (long)[[NSDate date] timeIntervalSince1970]];
                [files addObject:file];
            }
            else if ([value isKindOfClass:[RKMultipartFile class]])
            {
                [files addObject:value];
            }
            else if ([value isKindOfClass:[NSString class]])
            {
                NSString *filePath = (NSString *)value;
                NSFileManager  *manager = [NSFileManager defaultManager];
                if ([manager fileExistsAtPath:filePath])
                {
                    RKMultipartFile *file = [[RKMultipartFile alloc] init];
                    file.fileData = [NSData dataWithContentsOfFile:filePath];
                    file.fileName =  [NSString stringWithFormat:@"%ld.%@", (long)[[NSDate date] timeIntervalSince1970], filePath.pathExtension];
                    [files addObject:file];
                }
            }
        }
    }
    return files;
}

- (NSDictionary *)getDictionaryWithParam
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSArray *propertys = [self cc_propertys];
    
    for (cc_Property *property in propertys)
    {
        if (![property.protocol isEqualToString:@"RKMultipartFile"])
        {
            id value = [self valueForKey:property.name];
            if (value)
            {
                [params setObject:value forKey:property.name];
            }
        }
    }
    [params removeObjectForKey:@"httpMethod"];
    [params removeObjectForKey:@"taskTag"];
    [params removeObjectForKey:@"requestResult"];
    [params removeObjectForKey:@"interfaceURL"];
    return params;
}

@end

@implementation RKMultipartFile

+ (instancetype)fileWithName:(NSString *)name data:(NSData *)data
{
    RKMultipartFile *file = [[RKMultipartFile alloc] init];
    file.fileName = name;
    file.fileData = data;
    return file;
}

@end
