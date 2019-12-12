//
//  ViewController.m
//  并行队列
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
    
    [self demo2];
}

// 并行队列 同步执行：不开线程、顺序执行(和串行同步一样)
- (void)demo1{
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++){
        dispatch_sync(queue, ^{
            NSLog(@"%d %@", i, [NSThread currentThread]);
        });
    }
}
// 并行队列 异步执行：开启多个线程(会线程重用)、无序执行
- (void)demo2{
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++){
        dispatch_async(queue, ^{
            NSLog(@"%d %@", i, [NSThread currentThread]);
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
