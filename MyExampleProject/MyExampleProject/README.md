
## 项目知识点总结
### application启动过程
-  打开程序
- 执行main函数
- 监听系统事件

### [应用程序的状态][1]
IOS的应用程序一共有5种状态。
Not running（未运行）：程序未启动
Inactive（未激活）
Backgroud（后台）：
Suspended（挂起)
Active（激活）

### 登录逻辑
引导页只加载一次，有版本更新的时候加载

广告页加载

第三方登录，其实只是拿到第三方的登录信息，拿到授权access\_token
壹家教登录逻辑
1.登录壹家教服务器
2.登录环信服务器


3.登录微店服务器
4.登录备课服务器
5.登录考拉中心库


### 集成SDK
1.微信直接用cocoapods很简单
2.支付宝需要导入依赖库
3. 友盟精简版不需要导入其他系统库，而且比完整版要小很多
4. 在iOS9以上系统需要增加一个可跳转App的白名单，即LSApplicationQueriesSchemes，具体看文档
5.环信只需要导入HyphenateLite这个库就可以，很简单 UI如果是用环信的话可以导入EaseUI, 不需要用就自己写


copy 和Strong哪个好，修饰字符串


### MJExtention使用
    主要参考  MJKeyValue协议
数组包含字典模型

+ (NSDictionary *)mj_objectClassInArray {
return @{@"chengYuan":[LFGroupDetailChatModel class]};
}

替换id
+(NSDictionary *)mj_replacedKeyFromPropertyName {
return @{@"Id":@"id"};
