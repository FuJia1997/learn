//
//  ViewController.m
//  UITableView数据刷新
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic ,strong)NSMutableArray *dataArray;
@property(nonatomic, strong)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 100, 20, 50, 40)];
    self.button.backgroundColor = [UIColor redColor];
    [self.button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
}

- (void)click{
    Model *model = [Model new];
    model.name = @"狗子";
    model.nickName = @"哮天犬";
    model.imageName = @"狗子.jpg";
    
    [self.dataArray addObject:model];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
    }
    Model *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.nickName;
    cell.imageView.image = [UIImage imageNamed:model.imageName];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataArray{
    if (!_dataArray){
        //_dataArray = [[NSArray alloc] init];
        
        NSMutableArray *myArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 20; i++){
            NSMutableDictionary *dic = [NSMutableDictionary new];
            [dic setValue:[NSString stringWithFormat:@"大象%d号", i + 1] forKey:@"name"];
            [dic setValue:@"小飞象" forKey:@"nickName"];
            [dic setValue:@"头像.jpg" forKey:@"imageName"];
            
            Model *model = [Model heroWithDic:dic];
            [myArray addObject:model];
        }
        _dataArray = [NSMutableArray arrayWithArray:myArray];
    }
    return _dataArray;
}

@end
