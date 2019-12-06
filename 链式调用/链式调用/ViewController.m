//
//  ViewController.m
//  链式调用
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "LearnManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LearnManager *make = [LearnManager new];
    make.learnChinese(@"语文").learnChinese(@"数学");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
