//
//  ViewController.m
//  多线程-pthread
//
//  Created by yons on 2019/12/10.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     * 创建线程
     * 第一个参数：线程编号的地址
     * 第二个参数：线程的属性
     * 第三个参数：线程要执行的函数
     * 第四个参数：要执行函数的参数
     * 返回值：int 线程创建的成功还是失败 0是成功 非0是失败
     */
    
    NSString *str = @"fj";
    pthread_t pthread;//线程编号
    int result = pthread_create(&pthread, NULL, demo, (__bridge void *)(str));
    NSLog(@"%@", [NSThread currentThread]);
    if (result == 0){
        NSLog(@"成功");
    }else {
        NSLog(@"失败");
    }
}

void *demo(void *param){
    NSString *str = (__bridge NSString *)(param);
    NSLog(@"hello! %@ %@", str, [NSThread currentThread]);
    
    return NULL;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
