//
//  ViewController.m
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "StatusesFrame.h"
#import "StatusesCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSArray *)dataArray{
    if (!_dataArray){
        _dataArray = [NSArray new];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Quotes.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *mArray = [NSMutableArray new];
        for (NSDictionary *dic in array){
            Model *model = [Model ModelWithDic:dic];
            StatusesFrame *statusesFrame = [[StatusesFrame alloc] init];
            statusesFrame.model = model;
            [mArray addObject:statusesFrame];
        }
        _dataArray = mArray;
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusesCell *cell = [StatusesCell cellWithTableView:self.tableView];
    cell.statusesFrame = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusesFrame *statusFrame = self.dataArray[indexPath.row];
    return statusFrame.cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
