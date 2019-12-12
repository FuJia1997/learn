//
//  ViewController.m
//  消息循环
//
//  Created by yons on 2019/12/11.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(demo) userInfo:nil repeats:YES];
    //把定时器添加到当前消息循环中
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //消息循环是在一个指定的模式下运行的，设置的输入事件也需要指定一个模式，消息循环的模式和输入事件的模式必须匹配才会执行
    //消息循环的默认模式是：NSDefaultRunLoopMode
    //UITrackingRunLoopMode 当滚动scrollView的时候，消息循环的模式自动改变。
}

- (void)demo{
    //输出当前消息循环的模式
    NSLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
