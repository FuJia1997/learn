//
//  ViewControllerTwo.m
//  Block
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()<UITextFieldDelegate>

@property(nonatomic, strong)UITextField *textField;
@property(nonatomic, strong)UIButton *button;

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField.frame = CGRectMake(40, 200, 240, 40);
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入文字";
    self.textField.delegate = self;
    
    self.button.frame = CGRectMake(110, 260, 100, 30);
    [self.button setTitle:@"点击返回" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(backController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
}

- (void) backController{
    //第一步：创建通知
    //object：通知的发布者
//    NSNotification *noti = [NSNotification notificationWithName:@"send" object:self];
    NSNotification *noti = [NSNotification notificationWithName:@"send" object:self userInfo:@{@"input" : self.textField.text}];
    //第二步：通知中心发布通知
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回成功");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

- (UITextField *)textField{
    if(!_textField){
        _textField = [UITextField new];
    }
    return _textField;
}

- (UIButton *)button{
    if (!_button){
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _button;
}

@end

