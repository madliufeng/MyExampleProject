//
//  AppDelegate.h
//  MyExampleProject
//
//  Created by Pro on 2017/12/4.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//登录页面
-(void)setupLoginViewController;
//跳转到首页
-(void)setupHomeViewController;

@end
