//
//  ViewController.m
//  多线程-操作共享资源
//
//  Created by yons on 2019/12/10.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign)int ticketsCount;
// 原子属性是线程安全的。
// 自旋锁:只可以单个线程写，但可以多个线程读。只可以做到只写或只读的操作线程安全。不适合锁住耗时的代码。
@property(nonatomic, copy)NSString *name;

@end

@implementation ViewController
//当同时重写属性的setter和getter方法，不会自动生成_name成员变量
@synthesize name = _name;//为属性生成对应的成员变量

//模拟原子属性
- (NSString *)name{
    return _name;
}

- (void)setName:(NSString *)name{
    @synchronized(self){
        _name = name;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketsCount = 10;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    [thread2 start];
}

- (void)sellTickets{
    while (1){
        [NSThread sleepForTimeInterval:1];
        
        
        /*
         * 任意一个对象都有一把锁
         * 加锁会影响程序的性能
         * 加锁的代码应尽可能的少
         * 既有读、又有写的操作只有互斥锁可以做到线程安全
         */
        //加锁（互斥锁）
        @synchronized(self){
            if (self.ticketsCount > 0){
                self.ticketsCount = self.ticketsCount - 1;
                NSLog(@"剩余%d张票", self.ticketsCount);
            }else{
                NSLog(@"来晚了，票没了！");
                break;
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
