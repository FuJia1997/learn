//
//  ViewController.m
//  UITableView
//
//  Created by yons on 2019/12/3.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Model.h"
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//懒加载
- (NSMutableArray *)dataArray{
    if (_dataArray == nil){
        _dataArray = [[NSMutableArray alloc] init];
        
        Model *wu = [[Model alloc] init];
        wu.name = @"吴";
        wu.desc = @"吴国(229年5月23日[1-2]-280年5月1日[3])，三国之一，是孙权在中国东南部建立的割据政权，国号吴，史学界称之为孙吴。由于与曹魏、蜀汉成鼎立之势，所统治地区又居于三国之东，故亦成为东吴[4]";
        wu.perArray = @[@"孙权(国君)", @"周瑜(大都督)", @"黄盖(三朝元老)", @"吕蒙(都督)", @"陆逊(都督)", @"孙权(国君)", @"周瑜(大都督)", @"黄盖(三朝元老)", @"吕蒙(都督)", @"陆逊(都督)", @"孙权(国君)", @"周瑜(大都督)", @"黄盖(三朝元老)", @"吕蒙(都督)", @"陆逊(都督)", @"孙权(国君)", @"周瑜(大都督)", @"黄盖(三朝元老)", @"吕蒙(都督)", @"陆逊(都督)"];
        
        Model *wei = [[Model alloc] init];
        wei.name = @"魏";
        wei.desc = @"86年拓跋珪趁前秦四分五裂之际在牛川自称代王，重建代国，定都盛乐（今内蒙古呼和浩特市和林格尔县）。同年四月，改称魏王。398年六月，正式定国号为“魏” [2]  ，史称北魏。398年七月，道武帝拓跋珪迁都平城（今山西大同市），称帝。";
        wei.perArray = @[@"曹操(国君)", @"司马懿(军师)", @"曹丕(太子)", @"曹植(皇子)", @"许褚(将军)"];
        
        Model *shu = [[Model alloc] init];
        shu.name = @"蜀";
        shu.desc = @"蜀汉（221年5月15日 [1]  —263年），三国之一。公元221年，刘备在成都称帝，国号汉，史称蜀或蜀汉，亦称刘蜀、季汉。蜀汉王朝疆域所及，北至武都、汉中，东抵巫峡，南包云、贵，西达缅甸东部。";
        shu.perArray = @[@"刘备(国君)", @"诸葛亮(丞相)", @"关羽(荆州都督)", @"张飞(梓潼太守)", @"庞统(军师)"];
        
        [self.dataArray addObject:wu];
        [self.dataArray addObject:wei];
        [self.dataArray addObject:shu];
        
    }
    return _dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Model *model = self.dataArray[section];
    return model.perArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    Model *model = self.dataArray[indexPath.section];
    cell.textLabel.text = model.perArray[indexPath.row];
    return cell;
     */
    
    //cell复用的版本
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"secretaryCell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secretaryCell"];
    }
    
    Model *model = self.dataArray[indexPath.section];
    cell.textLabel.text = model.perArray[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Model *model = self.dataArray[section];
    return model.name;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    Model *model = self.dataArray[section];
    return model.desc;
}
@end
