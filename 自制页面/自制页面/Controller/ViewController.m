//
//  ViewController.m
//  自制页面
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "FJ_BaseCell.h"
#import "ViewController.h"
#import "FJ_TableViewDataSource.h"
#import "FJ_Model.h"

@interface ViewController ()<UITableViewDelegate>

@property(nonatomic, strong)NSArray *dataArray;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)FJ_TableViewDataSource *datasource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self.datasource;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (NSArray *)dataArray{
    if (!_dataArray){
        NSMutableArray *mArray = [NSMutableArray new];
        //导入头图数据
        NSString *headPictureStr = [[NSBundle  mainBundle]pathForResource:@"HeadPictures.plist" ofType:nil];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:headPictureStr];

        FJ_Model *headPictureModel = [FJ_Model modelWithDic:dic];
        headPictureModel.type = HeadPicturesType;
        [mArray addObject:headPictureModel];
        
        _dataArray = [NSArray arrayWithArray:mArray];
        
    }
    return _dataArray;
}
- (FJ_TableViewDataSource *)datasource{
    if (!_datasource){
        _datasource = [FJ_TableViewDataSource new];
        _datasource.itemArray = [NSArray arrayWithArray:self.dataArray];
    }
    return _datasource;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cls = [self.datasource cellClassAtIndexPath:indexPath];
    return [cls tableView:tableView rowHeightForObject:self.datasource.itemArray[indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
