//
//  ViewController.m
//  NSLayoutConstraint
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/*
 * 子view上下左右各距父view 40
 */
@property(nonatomic, strong)UIView *fatherView1;
@property(nonatomic, strong)UIView *sonView1;
/*
 * 子view在父view中间，且子view长30，高20
 */
@property(nonatomic, strong)UIView *fatherView2;
@property(nonatomic, strong)UIView *sonView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubView];
    [self setConstraint];
    [self setViewAttribute];
}

- (void)setViewAttribute{
    self.fatherView1.backgroundColor = [UIColor redColor];
    self.sonView1.backgroundColor = [UIColor blueColor];
    
    self.fatherView2.backgroundColor = [UIColor redColor];
    self.sonView2.backgroundColor = [UIColor blueColor];
}

- (void)addSubView{
    [self.view addSubview:self.fatherView1];
    [self.fatherView1 addSubview:self.sonView1];
    
    [self.view addSubview:self.fatherView2];
    [self.fatherView2 addSubview:self.sonView2];
}
- (void)setConstraint{
    [self.sonView1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.sonView2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.fatherView1.frame = CGRectMake(30, 30, 100, 100);
    NSLayoutConstraint *consraint1 = [NSLayoutConstraint constraintWithItem:self.sonView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.fatherView1 attribute:NSLayoutAttributeTop multiplier:1.0 constant:40];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.sonView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.fatherView1 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:40];
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.sonView1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.fatherView1 attribute:NSLayoutAttributeRight multiplier:1.0 constant:-40];
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.sonView1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.fatherView1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-40];
    //把约束添加在父视图上
    NSArray *array = [NSArray arrayWithObjects:consraint1, constraint2, constraint3, constraint4, nil];
    [self.fatherView1 addConstraints:array];
    
    self.fatherView2.frame = CGRectMake(200, 30, 100, 100);
    NSLayoutConstraint *constraint2_1 = [NSLayoutConstraint constraintWithItem:self.sonView2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.fatherView2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint2_2 = [NSLayoutConstraint constraintWithItem:self.sonView2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.fatherView2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint2_3 = [NSLayoutConstraint constraintWithItem:self.sonView2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
    NSLayoutConstraint *constraint2_4 = [NSLayoutConstraint constraintWithItem:self.sonView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20];
    NSArray *array2 = [NSArray arrayWithObjects:constraint2_1, constraint2_2, constraint2_3, constraint2_4, nil];
    [self.fatherView2 addConstraints:array2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)fatherView1{
    if (!_fatherView1){
        _fatherView1 = [UIView new];
    }
    return _fatherView1;
}

- (UIView *)sonView1{
    if (!_sonView1){
        _sonView1 = [UIView new];
    }
    return _sonView1;
}

- (UIView *)fatherView2{
    if (!_fatherView2){
        _fatherView2 = [UIView new];
    }
    return _fatherView2;
}

- (UIView *)sonView2{
    if (!_sonView2){
        _sonView2 = [UIView new];
    }
    return _sonView2;
}

@end
