//
//  Singleton.h
//  PPLessons
//
//  Created by admin on 2015/3/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

//定制版字段
@property(nonatomic, copy) NSString *channel;
@property(nonatomic, copy) NSString *aboutName;
@property(nonatomic, copy) NSString *shareTitle;
@property(nonatomic, copy) NSString *ruanJianXiYi;
@property(nonatomic, copy) NSString *mianShouKeTuiJian;// 面授课推荐or兴趣班推荐
@property(nonatomic, copy) NSString *mianShouKe;// 面授课or兴趣班
@property(nonatomic, copy) NSString *jiGou;// 机构or教学点
@property(nonatomic, copy) NSString *yingKe;// 影课or在线课程
@property(nonatomic, copy) NSString *duanLeiXing;//壹家教1、贝贝9、酷客10
@property(nonatomic, copy) NSString *keTangBiji;// 课堂笔记or成长档案
@property(nonatomic, assign) BOOL isMyTask;//是否点击我的任务


@property(nonatomic, copy) NSString *tokenId;
@property(nonatomic, copy) NSString *haiZiId;

@property(nonatomic, copy) NSString *appIcon;
@property(nonatomic, copy) NSString *appJianJie;
@property(nonatomic, copy) NSString *aboutOurURL;//关于我们URL
@property(nonatomic, copy) NSString *keTangQuan;//发现--课堂笔记
@property(nonatomic, copy) NSString *xueduan;//发现--课堂笔记
@property(nonatomic, copy) NSString *subject;
@property(nonatomic, copy) NSString *section;
@property(nonatomic, copy) NSString *yinDaoYe;
@property(nonatomic, copy) NSString *qiDongYe;
@property(nonatomic, strong)NSArray *minItem1;
@property (nonatomic,strong)NSArray *minItem2;
@property (nonatomic,strong)NSArray *searItem;
@property(nonatomic, copy) NSString *fromApp;
@property(nonatomic, copy) NSString *fromProject;

@property(nonatomic, copy) NSString *appType;
@property(nonatomic, copy) NSString *appTypeNum;


//支付宝
//@property(nonatomic, copy) NSString *PARTNER;
//@property(nonatomic, copy) NSString *SELLER;
//@property(nonatomic, copy) NSString *PRIVATEKEY;
//@property(nonatomic, copy) NSString *PRODUCTNAME;
//@property(nonatomic, copy) NSString *APPSCHEME;
//@property(nonatomic, copy) NSString *APPNAME;


//微信第三方登陆及支付
@property(nonatomic, copy) NSString *wxAppId;
@property(nonatomic, copy) NSString *wxAppSecret;
@property(nonatomic, copy) NSString *wxMCH_ID;
@property(nonatomic, copy) NSString *wxPARTNER_ID;

@property(nonatomic, copy) NSString *qqAppId;
@property(nonatomic, copy) NSString *qqAppSecret;
@property(nonatomic, copy) NSString *baiDuAppkey;

/**
 *  家长用户信息单例
 */
@property(assign, nonatomic) double jidu;
@property(assign, nonatomic) double weidu;
@property(retain, nonatomic) NSString *yonghuid;
//@property (assign, nonatomic)NSInteger ziYuanCount;

@property(retain, nonatomic) NSString *huanXinZhangHao;

@property(nonatomic, retain) NSString *realName;
@property (nonatomic) BOOL  ISSOAhe;
@property (retain ,nonatomic) NSString  *is_chongzhi;
@property(retain ,nonatomic)NSString *Zhanghao;
@property(retain ,nonatomic)NSString *UserPass;
@property(nonatomic)BOOL isLogin;
@property (strong, nonatomic) NSString *userName;
@property (retain ,nonatomic)NSString *niCheng;
@property (retain ,nonatomic)NSString *dianHua;
@property (retain ,nonatomic)NSString *dianZiYouXiang;
@property (strong, nonatomic) NSString *userIdKocla;
@property (strong, nonatomic) NSString *tokenKocla;
@property (strong, nonatomic)NSString *autoLoginFail;
@property (strong, nonatomic)NSString *img_slogan;



//用户类型
@property (assign, nonatomic) NSNumber *yongHuLeiXing;
@property(nonatomic, retain) NSString *passWord;
@property(nonatomic, retain) NSString *phone;
@property(nonatomic, retain) NSString *pwQuestion;
@property(nonatomic, retain) NSString *pwAnswer;
@property(nonatomic, retain) NSString *hasCompany;
@property(nonatomic, retain) NSString *score;
@property(nonatomic, retain) NSString *oneHourYongHuMing;// 用来登陆微店接口
@property(nonatomic, retain) NSString *imgUrl; // 我的头像
@property(nonatomic, strong)NSString *otherImaUrl;
@property(nonatomic, strong)NSString *moRenHaiziTouxiang;
@property(nonatomic, strong)NSString *moRenHaiziXingMing;
@property(nonatomic, strong)NSString *moRenHaiziWdJiaoXueDianId;





@property(nonatomic, retain) NSString *yingSheId;
@property(nonatomic, retain) NSString *ProVe;
@property(nonatomic, retain) NSString *CityD;
@property(nonatomic, retain) NSString *TownD;
@property(nonatomic, retain) NSString *cityId;// 城市id

@property(nonatomic, assign) double lati;
@property(nonatomic, assign) double longi;

@property (nonatomic, strong) NSArray * tabBarViewControllers;

@property (nonatomic, strong) NSString * signString;

// 学科 学段 年级
@property (nonatomic, strong) NSDictionary * xueKeDict;
@property (nonatomic, strong) NSDictionary * xueDuanDict;
@property (nonatomic, strong) NSDictionary * nianJiDict;


/*
 * 备课神器的字段
 */
@property (strong, nonatomic) NSString *BKtoken;
@property (nonatomic) BOOL BKSHiFouYanZhengTongGuo;
@property (retain,nonatomic) NSString *BKBEIKEXIAOERXIAOXIU;
@property (nonatomic) BOOL BKshiforYanshi;
@property (nonatomic) BOOL  BKISSOAhe;
@property (nonatomic) BOOL  BKIs_huodongShare;
@property (retain ,nonatomic) NSString  *BKis_chongzhi;
//付款
@property (nonatomic) BOOL  BKIs_tixiangJing;
@property(retain ,nonatomic)NSString *BKzhifuresultstates;
@property(nonatomic)BOOL BKIS_YingHao;
@property(retain ,nonatomic)NSString *BKZhanghao;
@property(retain ,nonatomic)NSString *BKUserPass;
@property(nonatomic)BOOL BKIS_XuexidanBiaoqian;//学习单标签
@property(nonatomic)BOOL BKis_shaixuan;  //筛选
@property(nonatomic)BOOL BKis_biaoqian;  //筛选
@property(retain ,nonatomic)NSString *BKpricesel;
@property(retain ,nonatomic)NSString *BKsectionsel;
@property(retain ,nonatomic)NSString *BKgreatsel;
@property(retain ,nonatomic)NSString *BKsubjectsel;
@property(retain ,nonatomic)NSString *BKresourcesel;
//来源
@property(retain ,nonatomic)NSString *BKziyuanlaiyuan;
@property(retain ,nonatomic)NSString *BKmiaoshu;
@property(retain ,nonatomic)NSString *BKbiaoti;
@property(retain ,nonatomic)NSString *BKjiage;
@property(retain ,nonatomic)NSString *BKleixing;
@property(retain ,nonatomic)NSMutableDictionary *BKDictionary;
@property(nonatomic)BOOL BKisLogin;
@property(retain,nonatomic)NSString  *BKyongHuId;
@property(retain,nonatomic)NSString  *BKUserid;
@property (strong, nonatomic) NSString *BKuserName;
@property(retain ,nonatomic)NSString *BKxueke;
@property(retain ,nonatomic)NSString *BKxueduan;
@property(retain ,nonatomic)NSString *BKnianji;
@property (assign ,nonatomic)NSInteger ziYuanCount;
@property(retain ,nonatomic)NSString *yongHuMing;//软库用户名

//老师
@property(retain ,nonatomic)NSString *BKxingMing;
@property (retain ,nonatomic)NSString *BKniCheng;
@property (retain ,nonatomic)NSString *BKxingBie;
@property (retain ,nonatomic)NSString *BKxueLi;
@property(retain ,nonatomic)NSString *BKyuanXiao;
@property(retain ,nonatomic)NSString *BKxiaoQu;


@property(retain ,nonatomic)NSString *BKzhuanYe;
@property(retain ,nonatomic)NSString *BKjiaoLing;
@property(retain ,nonatomic)NSString *BKshenFen;
@property(retain ,nonatomic)NSString *BKdanWei;
@property(retain ,nonatomic)NSString *BKjieShao;
@property (retain ,nonatomic)NSString *BKdianHua;
@property (retain ,nonatomic)NSString *BKdianZiYouXiang;
@property (retain ,nonatomic)NSString *BKjiaoXueTeDian;
@property (retain ,nonatomic)NSString *BKchuShengRiQi;
@property (retain ,nonatomic)NSString *BKxianJuZhuDi ;
@property (strong, nonatomic)NSString *BKguoWangJingLi;
@property (strong, nonatomic) NSString *BKuserIdKocla;
@property (strong, nonatomic) NSString *BKtokenKocla;
@property (strong, nonatomic) NSString *BKuserId;
@property (strong, nonatomic) NSString *BKshouJiHaoMa;

@property (nonatomic) CGSize beikexiaoeS;

@property (nonatomic) CGSize beikeTuiSongShichangS;

@property (nonatomic) CGSize beikeTuiSongS;

@property (strong, nonatomic)NSString *BKautoLoginFail;
@property (strong,nonatomic)NSString *BKpinDaoId;

@property (strong, nonatomic)NSString *BKleiXing;
//会员详情
@property (strong,nonatomic) NSString *BKbanNianJiaGe;
@property (strong,nonatomic) NSString *BKgouMaiBiaoZhi;
@property (strong,nonatomic) NSString *BKhuiYuanMiaoShu;
@property (strong,nonatomic) NSString *BKhuiYuanMing;
@property (strong,nonatomic) NSString *BKid;
@property (strong,nonatomic) NSString *BKpinDaoIds;
@property (strong,nonatomic) NSDictionary *BKpinDaoList;
@property (strong,nonatomic) NSString *BKsanGeYueJiaGe;
@property (strong,nonatomic) NSString *BKyiGeYueJiaGe;
@property (strong,nonatomic) NSString *BKyiNianJiaGe;
@property (strong,nonatomic) NSString *BKhuiYuanTuPian;

@property (strong,nonatomic) NSString *BKpinDaoMingCheng;
@property (strong,nonatomic) NSString *BKpinDaoTuPian;
//用户类型
@property (assign, nonatomic) NSNumber *BKyongHuLeiXing;

/*
 * 微店的字段
 */
@property(assign, nonatomic) double WDjidu;
@property(assign, nonatomic) double WDweidu;
@property(retain, nonatomic) NSString *WDis_chongzhi;
@property(retain, nonatomic) NSString *WDZhanghao;
@property(retain, nonatomic) NSString *WDUserPass;
@property(nonatomic) BOOL WDISSOAhe;
@property(nonatomic) BOOL WDisLogin;
@property(nonatomic, strong) NSString *WDhuanXinId;
@property(retain, nonatomic) NSString *WDdianHua;
@property(retain, nonatomic) NSString *WDyonghuid;
@property(retain, nonatomic) NSString *pId;
@property(nonatomic, retain) NSString *WDpassWord;
@property(nonatomic, retain) NSString *WDphone;
@property(nonatomic, retain) NSString *WDpwQuestion;
@property(nonatomic, retain) NSString *WDpwAnswer;
@property(nonatomic, retain) NSString *WDhasCompany;
@property(nonatomic, retain) NSString *WDscore;
@property(nonatomic, retain) NSString *WDModeType;//0-存在全日制幼儿园课次 -1-不存在全日制幼儿园课次
@property(nonatomic, retain) NSString *WDJiaoXueDianId;//微店教学点id，只有modeType为0时返回

@property(nonatomic, retain) NSString *WDimgUrl;
@property (strong, nonatomic)NSString *WDotherImaUrl;

@property(nonatomic, retain) NSString *WDyingSheId;
@property(nonatomic, retain) NSString *WDniCheng;
@property(nonatomic, retain) NSString *WDProVe;
@property(nonatomic, retain) NSString *WDCityD;// 城市名
@property(nonatomic, retain) NSString *WDcityId;// 城市id
@property(nonatomic, retain) NSString *WDTownD;
@property(nonatomic, assign) double WDlati;
@property(nonatomic, assign) double WDlongi;


@property (nonatomic, strong) NSArray * WDtabBarViewControllers;

@property (nonatomic, strong) NSString * WDsignString;
@property (strong, nonatomic) NSString *WDautoLoginFail;


@property (nonatomic, strong) NSString *ruankoUserId;
@property (nonatomic, strong) NSString *WDtoken;
@property (nonatomic, strong) NSString *ruankoUserName;

// 学科 学段 年级
@property (nonatomic, strong) NSDictionary * WDxueKeDict;
@property (nonatomic, strong) NSDictionary * WDxueDuanDict;
@property (nonatomic, strong) NSDictionary * WDnianJiDict;
@property (nonatomic, strong) NSArray *subjectModelArray;

@property (nonatomic, strong) NSArray *tag_dataSource;

//班级群聊
@property (nonatomic, strong) NSDictionary *qunDict;
//特殊照顾群
@property (nonatomic, strong) NSDictionary *specialQunDict;

//直播非WiFi下继续观看
@property (nonatomic, assign)BOOL palyNoWifi;
//LFChatTextImageTuiSongView.h 中的图片大小
@property (nonatomic, assign) CGFloat imgSize;
+ (id)sharedInstance;

+ (NSString *)acquireDocumentsPath;
@end
