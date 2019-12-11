//
//  ViewController.m
//  多线程-线程状态
//
//  Created by yons on 2019/12/10.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //当线程结束之后不能再次使用
    //新建态
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    thread1.name = @"t1";
    thread1.threadPriority = 1;
    //就绪态
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    thread2.name = @"t2";
    thread2.threadPriority = 0;
    [thread2 start];
}

- (void)demo{
    for (int i = 0; i < 20; i++){
        NSLog(@"%d, %@", i, [NSThread currentThread]);
        if ([NSThread isMainThread]){
            NSLog(@"mainThread");
        }
        if (i == 5){
            //阻塞态
            [NSThread sleepForTimeInterval:3];
        }
        if (i == 10){
            //死亡态
            [NSThread exit];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
