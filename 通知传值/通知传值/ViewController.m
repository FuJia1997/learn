//
//  ViewController.m
//  Block
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerTwo.h"

@interface ViewController ()

@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)UIButton *button;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //第三步：监听通知
    //addObserver:添加一个观察者
    //selector:接收到通知要干什么
    //name:接受的通知名字
    //object:通知的发布者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setLabelText:) name:@"send" object:nil];
}
//第四步:实现通知的方法并取出数值
- (void)setLabelText:(NSNotification *)noti{
    NSDictionary *dic = noti.userInfo;
    self.label.text = dic[@"input"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.frame = CGRectMake(100, 300, 200, 50);
    self.label.backgroundColor = [UIColor grayColor];
    self.label.text = @"默认文字";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    
    self.button.frame = CGRectMake(130, 400, 150, 50);
    [self.button setTitle:@"点击跳转" forState:UIControlStateNormal];[self.button addTarget:self action:@selector(changeController) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
}

- (void) changeController{
    ViewControllerTwo *viewController = [ViewControllerTwo new];
    [self presentViewController:viewController animated:YES completion:^{
        NSLog(@"切换完成");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UILabel *)label{
    if (!_label){
        _label = [UILabel new];
    }
    return _label;
}

- (UIButton *)button{
    if (!_button){
        _button = [UIButton new];
    }
    return _button;
}

@end

