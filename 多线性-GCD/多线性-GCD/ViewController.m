//
//  ViewController.m
//  多线性-GCD
//
//  Created by yons on 2019/12/12.
//  Copyright © 2019年 yons. All rights reserved.
//



/*
 * GCD的两个核心：（1）任务：执行什么操作 （2）队列：用来存放任务
 * GCD使用的步骤
 *   1、创建任务:确定要做得事情
 *   2、将任务添加到队列中：GCD会自动将队列中的任务取出，放到对应的线程中执行，任务的取出遵循队列的FIFO原则：先进先出，后进后出
 *
 * GCD中有两个用来执行任务的函数
 * 同步的方式执行任务
 * dispatch_sync(dispatch_queue_t queue,dispatch_block_t block);
 * queue:队列
 * block：任务
 * 异步的方式执行任务
 * dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
 *
 * GCD的队列可以分为量大类型
 * 并发队列：可以让多各任务同时执行，并发只有在异步函数下有效
 * 串行队列：让任务一个接着一个地执行
 *
 * 同步和异步决定了要不要开启新的线程。只有异步具备开启新的线程的能力
 * 并发和串行决定了任务的执行方式：并发还是串行
 */
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIScrollView *scView;
@property(nonatomic, strong)UIImageView *imView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //1、创建队列
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    //2、创建任务
//    dispatch_block_t task = ^{
//        NSLog(@"hello！");
//    };
//    //3、异步执行
//    dispatch_async(queue, task);
    //简化用法
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"hello %@", [NSThread currentThread]);
    });
    
    //异步下载网络图片
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576145919059&di=fd55f17b4b7fb8a73b1bafe4d3ca14a6&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0903%2F7512230abc4724321254dcac513c6ec8.jpg"];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *img = [UIImage imageWithData:data];
        
        //回主线程更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imView.image = img;
            [self.imView sizeToFit];
            
            self.scView.contentSize = img.size;
        });
    });
    
    //同步执行不会开新的线程
}

- (UIScrollView *)scView{
    if (!_scView){
        _scView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.view = _scView;
        _scView.backgroundColor = [UIColor whiteColor];
        [_scView addSubview:self.imView];
    }
    return _scView;
}

- (UIImageView *)imView{
    if (!_imView){
        _imView = [[UIImageView alloc]init];
    }
    return _imView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
