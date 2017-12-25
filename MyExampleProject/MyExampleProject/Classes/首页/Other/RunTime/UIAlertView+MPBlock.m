//
//  UIAlertView+MPBlock.m
//  MobileProject
//
//  Created by wujunyang on 2017/2/10.
//  Copyright © 2017年 wujunyang. All rights reserved.
//

#import "UIAlertView+MPBlock.h"

static const char alertKey;

@implementation UIAlertView (MPBlock)

- (void)showWithBlock:(clickBlock)block{
    
    if(block)    {
        objc_setAssociatedObject(self, &alertKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        self.delegate=self;
    }
    
    [self show];
    
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    clickBlock block = objc_getAssociatedObject(self, &alertKey);
    
    block(buttonIndex);
}

@end
