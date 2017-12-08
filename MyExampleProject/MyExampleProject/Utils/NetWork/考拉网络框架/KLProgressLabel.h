//
//  KLProgressLabel.h
//  MicroShopForParents
//
//  Created by lei on 16/5/5.
//  Copyright © 2016年 Charse. All rights reserved.
//


/*
 //文字提示
 
 CLProgressLabel *progressLabel = [CLProgressLabel progressLabel];
 
 //输入提醒文本
 
 progressLabel.remindLabel = @"请重新输入";
 
 //提醒文本距离底部的高度不设置默认为80
 
 progressLabel.remindLabelHight = 100;
 */

#import <UIKit/UIKit.h>

@interface KLProgressLabel : UIView

/**
 * 输入提醒文本
 */
@property (strong,nonatomic) NSString *remindLabel;

/**
 *  距离底部的高默认为80
 */
@property (assign,nonatomic)CGFloat remindLabelHight;
+ (id)progressLabel;

@end
