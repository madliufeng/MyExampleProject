//
//  KLProgressHUD.h
//  MicroShopForParents
//
//  Created by lei on 16/5/5.
//  Copyright © 2016年 Charse. All rights reserved.
//

/*
 //展示
 
 [[CLProgressHUD shareInstance] shows];
 
 //隐藏
 
 [[CLProgressHUD shareInstance] dismiss];
 
 //文字提示
 
 CLProgressLabel *progressLabel = [CLProgressLabel progressLabel];
 */

#import <UIKit/UIKit.h>

@interface KLProgressHUD : UIView

+ (id)shareInstance;

/**
 * 展示进度条
 */
- (void)shows;


/**
 * 隐藏进度条
 */
- (void)dismiss;

@end
