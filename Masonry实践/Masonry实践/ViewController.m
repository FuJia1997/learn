//
//  ViewController.m
//  Masonry实践
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import "ViewControllerTwo.h"
#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property(nonatomic, strong)UIView *backGroundView;
@property(nonatomic, strong)UIView *greenView;
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)UILabel *label2;
@property(nonatomic, strong)UIView *redView;
@property(nonatomic, strong)UIView *grayView;
@property(nonatomic, strong)UIView *bottomView1;
@property(nonatomic, strong)UIView *bottomView2;
@property(nonatomic, strong)UIView *bottomView3;
@property(nonatomic, strong)UIView *fatherView;
@property(nonatomic, strong)UIView *sonView1;
@property(nonatomic, strong)UIView *sonView2;
@property(nonatomic, strong)UIButton *nextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置backGroundView的内边距都为10
    [self.view addSubview:self.backGroundView];
    self.backGroundView.backgroundColor = [UIColor yellowColor];
//    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(10);
//        make.top.equalTo(self.view).offset(10);
//        make.right.equalTo(self.view).offset(-10);
//        make.bottom.equalTo(self.view).offset(-10);
//    }];
    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [self.view addSubview:self.greenView];
    self.greenView.backgroundColor = [UIColor greenColor];
    //设置约束
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    //在显示两秒之后更新约束
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view).offset(100);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    });
    
    [self.view addSubview:self.label];
    self.label.backgroundColor = [UIColor blackColor];
    self.label.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
    self.label. numberOfLines = 0;
    self.label.textColor = [UIColor whiteColor];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        //设置宽度小于等于200
        make.width.lessThanOrEqualTo(@200);
        //设置高度大于等于10
        make.height.greaterThanOrEqualTo(@10);
    }];
    
    [self.view addSubview:self.label2];
    self.label2.backgroundColor = [UIColor purpleColor];
    /**
     如果想使用基础数据类型当做参数，Masonry为我们提供了"mas_xx"格式的宏定义。
     这些宏定义会将传入的基础数据类型转换为NSNumber类型，这个过程叫做封箱(Auto Boxing)。
     
     "mas_xx"开头的宏定义，内部都是通过MASBoxValue()函数实现的。
     这样的宏定义主要有四个，分别是mas_equalTo()、mas_offset()和大于等于、小于等于四个。
     */
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.redView];
    self.redView.backgroundColor = [UIColor redColor];
    
    //设置约束优先级
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).priorityLow();
        make.width.mas_equalTo(20).priorityHigh();
        make.height.equalTo(self.view).priority(200);
        make.height.mas_equalTo(100).priority(1000);
    }];
    
    [self.view addSubview:self.grayView];
    self.grayView.backgroundColor = [UIColor grayColor];
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.width.equalTo(self.view).multipliedBy(0.2);
    }];
    
    [self.view addSubview:self.bottomView1];
    [self.view addSubview:self.bottomView2];
    [self.view addSubview:self.bottomView3];
    
    self.bottomView1.backgroundColor = [UIColor redColor];
    self.bottomView2.backgroundColor = [UIColor blueColor];
    self.bottomView3.backgroundColor = [UIColor purpleColor];
    
    [self.bottomView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(30);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
    
    [self.bottomView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView1.mas_right).offset(20);
        make.width.mas_offset(30);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.bottomView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView2.mas_right).offset(20);
        make.width.mas_equalTo(30);
        make.bottom.mas_equalTo(-20);
        make.height.equalTo(@[self.bottomView1, self.bottomView2]);
    }];
    
    [self.view addSubview:self.fatherView];
    [self.fatherView addSubview:self.sonView1];
    [self.fatherView addSubview:self.sonView2];
    
    self.fatherView.backgroundColor = [UIColor grayColor];
    self.sonView1.backgroundColor = [UIColor redColor];
    self.sonView2.backgroundColor = [UIColor blueColor];
    
    [self.fatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView3.mas_right).offset(30);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(150);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.sonView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.sonView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(self.sonView1.mas_bottom).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    [self.view addSubview:self.nextButton];
    [self.nextButton setTitle:@"链式编程" forState:UIControlEventTouchUpInside];
    self.nextButton.backgroundColor = [UIColor redColor];
    [self.nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-50);
        make.top.mas_equalTo(30);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(40);
    }];
    [self.nextButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{
    ViewControllerTwo *viewController = [[ViewControllerTwo alloc]init];
    [self presentViewController:viewController animated:YES completion:^{
        NSLog(@"跳转成功");
    }];
}

- (UIView *)bottomView1{
    if (!_bottomView1){
        _bottomView1 = [UIView new];
    }
    return _bottomView1;
}

- (UIView *)bottomView2{
    if (!_bottomView2){
        _bottomView2 = [UIView new];
    }
    return _bottomView2;
}

- (UIView *)bottomView3{
    if (!_bottomView3){
        _bottomView3 = [UIView new];
    }
    return _bottomView3;
}

- (UIView *)backGroundView{
    if (!_backGroundView){
        _backGroundView = [UIView new];
    }
    return _backGroundView;
}

- (UIView *)greenView{
    if (!_greenView){
        _greenView = [UIView new];
    }
    return _greenView;
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

- (UILabel *)label2{
    if (!_label2){
        _label2 = [UILabel new];
    }
    return _label2;
}

- (UIView *)redView{
    if (!_redView){
        _redView = [UIView new];
    }
    return _redView;
}

- (UIView *)grayView{
    if (!_grayView){
        _grayView = [UIView new];
    }
    return _grayView;
}

- (UIView *)fatherView{
    if (!_fatherView){
        _fatherView = [UIView new];
    }
    return _fatherView;
}

- (UIView *)sonView1{
    if (!_sonView1){
        _sonView1 = [UIView new];
    }
    return _sonView1;
}

- (UIView *)sonView2{
    if (!_sonView2){
        _sonView2 = [UIView new];
    }
    return _sonView2;
}

- (UIButton *)nextButton{
    if (!_nextButton){
        _nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _nextButton;
}

@end
