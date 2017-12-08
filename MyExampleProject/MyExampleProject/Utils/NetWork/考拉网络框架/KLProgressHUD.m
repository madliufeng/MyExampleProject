//
//  KLProgressHUD.m
//  MicroShopForParents
//
//  Created by lei on 16/5/5.
//  Copyright © 2016年 Charse. All rights reserved.
//


#define KLScreenWidth [UIScreen mainScreen].bounds.size.width
#define KLScreenHeight [UIScreen mainScreen].bounds.size.height
#define KLScreenBounds [UIScreen mainScreen].bounds
#import "KLProgressHUD.h"

@interface KLProgressHUD()

@property (weak,nonatomic)CAShapeLayer *shapLayer;
@property (weak,nonatomic)UILabel *refreshLabel;
@property (weak,nonatomic)UIWindow * currentWindow;
@property (strong,nonatomic)UIView *backView;
@property (weak,nonatomic)NSTimer * timer;

@end

@implementation KLProgressHUD
+ (id)shareInstance{
    static KLProgressHUD *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (instancetype)init{
    if (self = [super init]) {
        //        self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [[UIColor colorWithWhite:0.292 alpha:1.000] colorWithAlphaComponent:0.5];
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        [self addBGview];
    }
    return self;
}
- (void)addBGview{
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * effe = [[UIVisualEffectView alloc]initWithEffect:blur];
    effe.frame = CGRectMake(50, 90, self.frame.size.width, 400);
    // 添加毛玻璃
    [self addSubview:effe];
    
}
/**
 *  创建动画
 */
- (void)creatShplayer{
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(M_PI/4.0), @(M_PI * 2/4.0), @( M_PI * 3/4.0), @(4 * M_PI /4.0),@(5 *M_PI/4.0), @(6 *M_PI/4.0), @(7 *M_PI/4.0), @(8 * M_PI /4.0),@(8 * M_PI /4.0 + M_PI/4.0)];
    anim.repeatCount = MAXFLOAT;
    anim.duration = 1;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.shapLayer addAnimation:anim forKey:@"CLAnimation"];
    [self refreshLabel];
    
}
- (NSTimer *)timer{
    if (_timer == nil) {
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(textMove:) userInfo:nil repeats:YES];
        _timer = timer;
    }
    return _timer;
}
- (void)textMove:(NSTimer *)sender{
    
    if ([self.refreshLabel.text isEqualToString:@"加载中..."]) {
        self.refreshLabel.text = @"加载中";
        
    }else{
        
        self.refreshLabel.text = [NSString stringWithFormat:@"%@.",self.refreshLabel.text];
        
    }
    
}
- (CAShapeLayer *)shapLayer{
    if (_shapLayer == nil) {
        
        CAShapeLayer *shapLayer = [CAShapeLayer layer];
        shapLayer.frame = CGRectMake(35*KLScreenWidth/375, 15*KLScreenWidth/375, 80.0*KLScreenWidth/375, 80.0*KLScreenWidth/375);
        shapLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapLayer.lineWidth = 1.0f;
        shapLayer.strokeColor = [UIColor blackColor].CGColor;//线条颜色
        
        UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80.0*KLScreenWidth/375, 80.0*KLScreenWidth/375)];//画个圆
        shapLayer.path = bezier.CGPath;
        [self.layer addSublayer:shapLayer];
        shapLayer.strokeStart = 0;
        shapLayer.strokeEnd = 0.85;
        _shapLayer = shapLayer;
    }
    return _shapLayer;
}
- (UILabel *)refreshLabel{
    if (_refreshLabel == nil) {
        UILabel *refreshLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 65, 40*KLScreenWidth/375)];
        refreshLabel.center = CGPointMake(80*KLScreenWidth/375, 130*KLScreenWidth/375);
        //        refreshLabel.textAlignment = NSTextAlignmentCenter;
        refreshLabel.text = @"加载中...";
        [self addSubview:refreshLabel];
        _refreshLabel = refreshLabel;
        
    }
    return _refreshLabel;
}
- (UIWindow *)currentWindow{
    if (_currentWindow == nil) {
        
        UIWindow * currentWindow = [UIApplication sharedApplication].keyWindow;
        _backView = [[UIView alloc]initWithFrame:currentWindow.bounds];
        _backView.backgroundColor = [UIColor colorWithWhite:0.412 alpha:0.500];
        [currentWindow addSubview:_backView];
        _currentWindow = currentWindow;
    }
    return _currentWindow;
}
- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.frame = CGRectMake(0, 0, 150*KLScreenWidth/375, 150*KLScreenWidth/375);
    self.center = CGPointMake(KLScreenWidth/2, KLScreenHeight/2 - 20*KLScreenWidth/375);
}
- (void)shows{
    [self timer];
    self.timer.fireDate=[NSDate distantPast];//恢复定时器
    self.hidden = NO;
    self.backView.hidden = NO;
    
    [self.currentWindow addSubview:self];
    [self creatShplayer];
}
- (void)dismiss{
    self.hidden = YES;
    self.backView.hidden = YES;
    [self.shapLayer removeAnimationForKey:@"CLAnimation"];
    self.timer.fireDate=[NSDate distantFuture];
}
@end
