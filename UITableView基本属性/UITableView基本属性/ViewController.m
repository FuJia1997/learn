//
//  ViewController.m
//  UITableView基本属性
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    
    //设置行高：默认是44
    self.tableView.rowHeight = 100;
    //设置分割线
    self.tableView.separatorColor = [UIColor redColor];
    
    [self.tableView setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行", indexPath.row ];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    cell.backgroundView = view;
    
//    UIView *view2 = [[UIView alloc] init];
//    view.backgroundColor = [UIColor blueColor];
//    cell.selectedBackgroundView = view2;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
