//
//  LFLifeCycleViewController.m
//  MyExampleProject
//
//  Created by jk on 2017/12/14.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFLifeCycleViewController.h"
#import "LFLifeCycleView.h"
@interface LFLifeCycleViewController ()
@property(nonatomic,strong)LFLifeCycleView *myView,*myOtherView;

@end

@implementation LFLifeCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"第一个VC viewDidLoad");
    self.view.backgroundColor=[UIColor blueColor];
    
    if (!self.myView) {
        self.myView=[[LFLifeCycleView alloc]init];
        self.myView.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.myView];
        [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(120, 200));
        }];
    }
    
    if (!self.myOtherView) {
        self.myOtherView=[[LFLifeCycleView alloc]init];
        self.myOtherView.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:self.myOtherView];
    }
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"第一个VC viewWillAppear");
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"第一个VC didReceiveMemoryWarning");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    NSLog(@"第一个VC viewWillDisappear");
}

-(void)loadView
{
    [super loadView];
    NSLog(@"第一个VC loadView");
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"第一个VC viewWillLayoutSubviews");
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"第一个VC viewDidLayoutSubviews");
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
    
    NSLog(@"---------------");
    NSLog(@"坐标值，要到viewDidLayoutSubviews 才正确。根视图的大小改变了，子视图必须相应做出调整才可以正确显示，这就是为什么要在 viewDidLayoutSubviews 中调整动态视图的frame");
    NSLog(@"---------------");
    
    CGRect myViewFrame=self.myView.frame;
    
    CGFloat myOtherViewY=CGRectGetMaxY(myViewFrame)+20;
    myViewFrame.origin.y=myOtherViewY;
    
    self.myOtherView.frame=myViewFrame;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"第一个VC viewDidAppear");
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    NSLog(@"第一个VC viewDidDisappear");
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"第一个VC awakeFromNib");
}

- (void)dealloc {
    NSLog(@"LFLifeCycleViewController被销毁了");
}

@end

#pragma mark -  单纯控制器的生命周期打印log
/*
 打印顺序
 2017-12-14 17:32:47.129063+0800 MyExampleProject[98455:903002] 第一个VC loadView
 2017-12-14 17:32:47.129402+0800 MyExampleProject[98455:903002] 第一个VC viewDidLoad
 2017-12-14 17:32:47.130542+0800 MyExampleProject[98455:903002] myView当前的坐标：: {{0, 0}, {0, 0}}
 2017-12-14 17:32:47.130933+0800 MyExampleProject[98455:903002] 第一个VC viewWillAppear
 2017-12-14 17:32:47.131095+0800 MyExampleProject[98455:903002] myView当前的坐标：: {{0, 0}, {0, 0}}
 2017-12-14 17:32:47.138279+0800 MyExampleProject[98455:903002] 第一个VC viewWillLayoutSubviews
 2017-12-14 17:32:47.138456+0800 MyExampleProject[98455:903002] myView当前的坐标：: {{0, 0}, {0, 0}}
 2017-12-14 17:32:47.138619+0800 MyExampleProject[98455:903002] 第一个VC viewDidLayoutSubviews
 2017-12-14 17:32:47.138757+0800 MyExampleProject[98455:903002] myView当前的坐标：: {{147, 236}, {120, 200}}
 2017-12-14 17:32:47.138976+0800 MyExampleProject[98455:903002] ---------------
 2017-12-14 17:32:47.139167+0800 MyExampleProject[98455:903002] 坐标值，要到viewDidLayoutSubviews 才正确。根视图的大小改变了，子视图必须相应做出调整才可以正确显示，这就是为什么要在 viewDidLayoutSubviews 中调整动态视图的frame
 2017-12-14 17:32:47.139406+0800 MyExampleProject[98455:903002] ---------------
 2017-12-14 17:32:47.648255+0800 MyExampleProject[98455:903002] 第一个VC viewDidAppear

 返回上个页面执行顺序
 
 2017-12-14 17:37:28.305172+0800 MyExampleProject[98455:903002] 这里面存放着我其它操作
 2017-12-14 17:37:28.306535+0800 MyExampleProject[98455:903002] 第一个VC viewWillDisappear
 2017-12-14 17:37:28.817109+0800 MyExampleProject[98455:903002] 第一个VC viewDidDisappear
 2017-12-14 17:42:56.773027+0800 MyExampleProject[98512:906892] LFLifeCycleViewController被销毁了
 
 **/

#pragma mark - 添加了lifeCycleView的生命周期打印log
//点击进入
/*
 2017-12-14 18:25:55.831640+0800 MyExampleProject[98794:924778] 第一个VC loadView
 2017-12-14 18:25:55.832266+0800 MyExampleProject[98794:924778] 第一个VC viewDidLoad
 2017-12-14 18:25:55.832691+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------init方法-------0
 2017-12-14 18:25:55.833228+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToSuperview:方法-------1------<UIView: 0x7fdd31d3ca60; frame = (0 0; 414 736); autoresize = W+H; layer = <CALayer: 0x60000023c3a0>>
 2017-12-14 18:25:55.833404+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToSuperview方法-------2
 2017-12-14 18:25:55.834761+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------init方法-------0
 2017-12-14 18:25:55.834981+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToSuperview:方法-------1------<UIView: 0x7fdd31d3ca60; frame = (0 0; 414 736); autoresize = W+H; layer = <CALayer: 0x60000023c3a0>>
 2017-12-14 18:25:55.835170+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToSuperview方法-------2
 2017-12-14 18:25:55.918967+0800 MyExampleProject[98794:924778] myView当前的坐标：: {{0, 0}, {0, 0}}
 2017-12-14 18:25:55.919559+0800 MyExampleProject[98794:924778] 第一个VC viewWillAppear
 2017-12-14 18:25:55.920059+0800 MyExampleProject[98794:924778] myView当前的坐标：: {{0, 0}, {0, 0}}
 2017-12-14 18:25:55.928836+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToWindow:方法-------3------<UIWindow: 0x7fdd31e08800; frame = (0 0; 414 736); autoresize = W+H; gestureRecognizers = <NSArray: 0x6040002598c0>; layer = <UIWindowLayer: 0x60400003de00>>
 2017-12-14 18:25:55.929361+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToWindow:方法-------3------<UIWindow: 0x7fdd31e08800; frame = (0 0; 414 736); autoresize = W+H; gestureRecognizers = <NSArray: 0x6040002598c0>; layer = <UIWindowLayer: 0x60400003de00>>
 2017-12-14 18:25:55.929861+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToWindow方法-------4
 2017-12-14 18:25:55.929999+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToWindow方法-------4
 2017-12-14 18:25:55.950357+0800 MyExampleProject[98794:924778] 第一个VC viewWillLayoutSubviews
 2017-12-14 18:25:55.950603+0800 MyExampleProject[98794:924778] myView当前的坐标：: {{0, 0}, {0, 0}}
 2017-12-14 18:25:55.950835+0800 MyExampleProject[98794:924778] 第一个VC viewDidLayoutSubviews
 2017-12-14 18:25:55.951196+0800 MyExampleProject[98794:924778] myView当前的坐标：: {{147, 236}, {120, 200}}
 2017-12-14 18:25:55.951623+0800 MyExampleProject[98794:924778] ---------------
 2017-12-14 18:25:55.967162+0800 MyExampleProject[98794:924778] 坐标值，要到viewDidLayoutSubviews 才正确。根视图的大小改变了，子视图必须相应做出调整才可以正确显示，这就是为什么要在 viewDidLayoutSubviews 中调整动态视图的frame
 2017-12-14 18:25:55.967330+0800 MyExampleProject[98794:924778] ---------------
 2017-12-14 18:25:55.967574+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------layoutSubviews方法-------5
 2017-12-14 18:25:55.967670+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------layoutSubviews方法-------5
 2017-12-14 18:25:56.477936+0800 MyExampleProject[98794:924778] 第一个VC viewDidAppear

 **/

//点击返回

/*
 2017-12-14 18:26:56.077773+0800 MyExampleProject[98794:924778] 第一个VC viewWillDisappear
 2017-12-14 18:26:56.589369+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToWindow:方法-------6------(null)
 2017-12-14 18:26:56.589609+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToWindow:方法-------6------(null)
 2017-12-14 18:26:56.590145+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToWindow方法-------7
 2017-12-14 18:26:56.590668+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToWindow方法-------7
 2017-12-14 18:26:56.591355+0800 MyExampleProject[98794:924778] 第一个VC viewDidDisappear
 2017-12-14 18:26:56.594471+0800 MyExampleProject[98794:924778] LFLifeCycleViewController被销毁了
 2017-12-14 18:26:56.595671+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToSuperview:方法-------8------(null)
 2017-12-14 18:26:56.596233+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToSuperview方法-------9
 2017-12-14 18:26:56.596570+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------removeFromSuperview方法-------10
 2017-12-14 18:26:56.596993+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------willMoveToSuperview:方法-------8------(null)
 2017-12-14 18:26:56.606575+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------didMoveToSuperview方法-------9
 2017-12-14 18:26:56.606951+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------removeFromSuperview方法-------10
 2017-12-14 18:26:56.607400+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------dealloc方法-------11
 2017-12-14 18:26:56.608326+0800 MyExampleProject[98794:924778] LFLifeCycleView执行了------dealloc方法-------11
 
 **/


/*
 关于：
 - (void)willMoveToSuperview:(nullable UIView *)newSuperview;
 - (void)willMoveToWindow:(nullable UIWindow *)newWindow;
 这俩个方法可以根据参数是否为nil判断是创建操作还是销毁操作，nil则为销毁，反之，则为创建；
 - (void)didMoveToSuperview;
 这个方法可以根据self.superview的值判定，nil则为销毁，反之，则为创建。
 - (void)didMoveToWindow;
 这个方法可以根据self.superview的值判定，nil则为创建，反之，则为销毁。(注意这个方法和上面的是相反的)
 
 didAddSubview
 willRemoveSubview
 这两个方法要添加或移除子视图才会调用
 
------drawRect:方法-------只会在layoutSubviews后调用

 链接：http://www.jianshu.com/p/9d98fad685c8
 來源：简书
 **/

