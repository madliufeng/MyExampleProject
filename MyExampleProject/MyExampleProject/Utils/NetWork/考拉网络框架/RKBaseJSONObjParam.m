//
//  RKBaseJSONObjParam.m
//  Kuke
//
//  Created by HYZB on 15/10/29.
//  Copyright © 2015年 RK. All rights reserved.
//

#import <objc/runtime.h>
#import "RKBaseJSONObjParam.h"

@implementation RKBaseJSONObjParam

- (instancetype)init
{
    if (self = [super init]) {
        self.httpMethod = POST;
    }
    return self;
}

- (NSDictionary *)getDictionaryWithParam
{
    Class subclass = [self class];
    
    while (subclass != [NSObject class])
    {
        u_int count = 0;
        
        objc_property_t* properties = class_copyPropertyList(subclass, &count);
        
        for (int i = 0; i < count ; i++)
        {
            objc_property_t prop=properties[i];
            const char* propertyName = property_getName(prop);
            NSString *property = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            
            id value = [self valueForKey:property];// [self performSelector:sel];
            
            if (value != nil)
            {
                if (property)
                {
                    if ([value isKindOfClass:[JSONModel class]])
                    {
                        return [(JSONModel *)value toDictionary];
                    }
                }
            }
        }
        free(properties);
        
        subclass = class_getSuperclass(subclass);
    }
    
    return [super getDictionaryWithParam];
}
@end
