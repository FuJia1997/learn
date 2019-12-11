//
//  ViewController.m
//  多线程-NSThread
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
    
    //方式1
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
//    [thread start];
    
    //方式2
//    [NSThread detachNewThreadSelector:@selector(demo) toTarget:self withObject:nil];
    
    //方式3
//    [self performSelectorInBackground:@selector(demo) withObject:nil];
    
    //方式4 参数
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo1:) object:@"付佳"];
    [thread1 start];
}

- (void)demo{
    NSLog(@"hello! %@", [NSThread currentThread]);
}

- (void)demo1:(NSString *)str{
    NSLog(@"hello %@！%@", str, [NSThread currentThread]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
