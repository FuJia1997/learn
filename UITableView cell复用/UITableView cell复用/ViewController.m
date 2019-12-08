//
//  ViewController.m
//  UITableView cell复用
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "bookTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic ,copy)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 100;
    [self.view addSubview:self.tableView];
    [self setHeadView];
}

- (void)setHeadView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    self.tableView.tableHeaderView = headView;
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:headView.frame];
    sv.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 5, 200);
    sv.pagingEnabled = YES;
    
    for (int i = 0; i < 5; i++){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 200)];
                                  
        imageView.image =  [UIImage imageNamed:[NSString stringWithFormat:@"风景_%d.jpg", i + 1]];
        [sv addSubview:imageView];
    }
    [headView addSubview:sv];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
    //return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"book";
    
    Model *model = self.dataArray[indexPath.row];
    bookTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil){
        cell = [[bookTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.model = model;
    return cell;
}


- (NSMutableArray *)dataArray{
    if (!_dataArray){
        _dataArray = [NSMutableArray new];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"book_list.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in array) {
            Model *model = [Model bookWithDic:dic];
            
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
