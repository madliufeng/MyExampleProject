//
//  NSObject+LF.h
//  MyExampleProject
//
//  Created by jk on 2017/12/18.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^KVOBlock)(NSDictionary *change, void *context);

@interface NSObject (LF)
+ (NSString *)version;

+ (NSInteger)build;

+ (NSString *)identifier;

+ (NSString *)currentLanguage;

+ (NSString *)deviceModel;

- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
          withBlock:(KVOBlock)block;

-(void)removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath;

-(void)addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(KVOBlock)block;

-(void)removeBlockObserverForKeyPath:(NSString *)keyPath;

//类名
- (NSString *)className;
+ (NSString *)className;

//父类名称
- (NSString *)superClassName;
+ (NSString *)superClassName;

//实例属性字典
-(NSDictionary *)propertyDictionary;

//属性名称列表
- (NSArray *)propertyKeys;
+ (NSArray *)propertyKeys;

//方法列表
-(NSArray *)methodList;
+(NSArray *)methodList;

-(NSArray *)methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)registedClassList;
//实例变量
+ (NSArray *)instanceVariable;


- (BOOL)hasPropertyForKey:(NSString*)key;
- (BOOL)hasIvarForKey:(NSString*)key;

/**
 * 字典给模型赋值
 * 用字典给一个类里的属性赋值,如有值是类中不存在的,常规情况下程序会崩溃
 * 根据本类的属性有选择的拿字典中的key value，如果本类的属性包含字典的key,则把key的value赋值给这个属性
 */
-(void)modelWithDictionary:(NSDictionary *)dict;
@end


@interface NSObject (WHRuntime)

/** 属性列表 */
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;
/** 格式化之后的属性列表 */
+ (NSArray *)propertiesWithCodeFormat;


/** 成员变量列表 */
- (NSArray *)ivarInfo;
+ (NSArray *)ivarInfo;


/** 对象方法列表 */
-(NSArray*)instanceMethodList;
+(NSArray*)instanceMethodList;
/** 类方法列表 */
+(NSArray*)classMethodList;


/** 协议列表 */
-(NSDictionary *)protocolList;
+(NSDictionary *)protocolList;


/** 交换实例方法 */
+ (void)SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
/** 交换类方法 */
+ (void)SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;


/** 添加方法 */
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

@end


