//
//  ViewController.m
//  属性修饰符
//
//  Created by yons on 2019/12/11.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/*
 * retain MRC下使用
 * strong ARC下使用
 * assign ARC MRC下都可以使用（不会引用计数加一）
 * 字符串用copy
 * block用copy
 * ARC下才可以用weak
 * delegate用weak（防止循环引用）
 * weak和assign的异同：
 *  相同：都是弱引用
 *  不同：weak引用的对象释放之后，指针会指向nil；assign引用
 *        的对象释放之后，指针地址不变，再次访问会崩溃。
 *
 */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
