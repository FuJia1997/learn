//
//  ViewController.m
//  异步下载网络图片
//
//  Created by yons on 2019/12/10.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIScrollView *scView;
@property(nonatomic, strong)UIImageView *imView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadImage) object:nil];
    [thread start];
}

//下载网络图片
- (void)downLoadImage{
    //图片的地址
    NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4244366028,3583613236&fm=26&gp=0.jpg"];
    //下载图片
    NSData *data = [NSData dataWithContentsOfURL:url];
    //把NSD阿塔转换为UIImage
    UIImage *img = [UIImage imageWithData:data];
    //在主线程上更新UI控件
    //waitUntilDone：值是yes会等待方法执行完毕，才会执行后续代码
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:img waitUntilDone:YES];
}

- (void) updateUI:(UIImage *)img{
    self.imView.image = img;
    //让imageView的大小和图片的大小一致
    [self.imView sizeToFit];
    self.scView.contentSize = img.size;
}

- (UIScrollView *)scView{
    if (!_scView){
        _scView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scView.backgroundColor = [UIColor whiteColor];
        
        [_scView addSubview:self.imView];
        self.view = _scView;
    }
    return _scView;
}

- (UIImageView *)imView{
    if (!_imView){
        _imView = [UIImageView new];
    }
    return _imView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
