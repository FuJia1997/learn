//
//  ViewController.m
//  UITableView cell复用
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()<UITableViewDataSource>

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
    self.tableView.rowHeight = 100;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
    //return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"book";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        Model *model = self.dataArray[indexPath.row];
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        iconImageView.image = [UIImage imageNamed:model.icon];

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, self.view.frame.size.width - 120, 30)];
        titleLabel.text = model.title;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, self.view.frame.size.width - 120, 15)];
        detailLabel.text = model.detail;
        
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, self.view.frame.size.width - 120, 30)];
        priceLabel.text = model.price;
        priceLabel.textColor = [UIColor redColor];
        
        [cell.contentView addSubview:iconImageView];
        [cell.contentView addSubview:titleLabel];
        [cell.contentView addSubview:detailLabel];
        [cell.contentView addSubview:priceLabel];
    }
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
