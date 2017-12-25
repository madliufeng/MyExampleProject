//
//  LFRunTimeViewController.h
//  MyExampleProject
//
//  Created by jk on 2017/12/14.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
//#import "BaseViewController.h"
#import "MPRunTimeTest.h"
#import "MPRunTimeTest+Other.h"
#import "UIAlertView+MPBlock.h"
#import "MPRunTimeTest+MPMehtod.h"
#import "UIButton+MPHock.h"

@interface LFRunTimeViewController : UIViewController
@property (nonatomic, strong) MPRunTimeTest *myRunTimeTest;

@property(nonatomic,strong)UIButton *myButton;
@end
