//
//  ViewController.m
//  测试
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
    
    CGFloat f = 4.8;
    int i = f;
    CGFloat f1 = f - i;
    NSLog(@"%d", i);
    NSLog(@"%.1f", f1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
