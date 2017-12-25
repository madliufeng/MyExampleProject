//
//  LFLifeCycleView.m
//  MyExampleProject
//
//  Created by jk on 2017/12/14.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFLifeCycleView.h"

@implementation LFLifeCycleView
{
    NSInteger count;
}

- (void)drawRect:(CGRect)rect {
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);

}


- (instancetype)init{
    self = [super init];
    if (self) {
        count = 0;
        NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);

    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
}

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
}

- (void)willRemoveSubview:(UIView *)subview {
    [super willRemoveSubview:subview];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld------%@",NSStringFromSelector(_cmd),count,newSuperview);
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld------%@",NSStringFromSelector(_cmd),count,newWindow);

}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
    
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
}

- (void)dealloc {
    count++;
    NSLog(@"LFLifeCycleView执行了------%@方法-------%ld",NSStringFromSelector(_cmd),count);
}


@end
