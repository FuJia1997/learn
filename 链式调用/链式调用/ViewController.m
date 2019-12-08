//
//  ViewController.m
//  链式调用
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "LearnManager.h"
#import "Function1.h"
#import "Function2.h"
#import "Function3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    LearnManager *make = [LearnManager new];
//    make.learnChinese(@"语文").learnChinese(@"数学");
    Function1 *fun1 = [Function1 new];
    fun1.function();
    Function2 *fun2 = [Function2 new];
    fun2.function(@"吃饭");
    Function3 *fun3 = [Function3 new];
    fun3.function(@"吃饭").function(@"喝水").function(@"睡觉");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
