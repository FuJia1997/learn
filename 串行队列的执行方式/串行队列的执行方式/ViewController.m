//
//  ViewController.m
//  串行队列的执行方式
//
//  Created by yons on 2019/12/12.
//  Copyright © 2019年 yons. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo2];
}

// 串行队列的同步执行 不开新线程,任务按顺序执行
- (void)demo1{
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++){
        //同步
        dispatch_sync(queue, ^{
            NSLog(@"%d hello %@",i, [NSThread currentThread]);;
        });
    }
}
// 串行队列的异步执行 开启新线程(1个) 有序执行
- (void)demo2{
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++){
        //同步
        dispatch_async(queue, ^{
            NSLog(@"%d hello %@",i, [NSThread currentThread]);;
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
