//
//  FJ_TableViewDataSource.m
//  自制页面
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "FJ_BaseCell.h"
#import "FJ_TableViewDataSource.h"
#import "FJ_HeadPicturesCell.h"
#import "FJ_Model.h"

@implementation FJ_TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FJ_BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentiferAtIndexPath: indexPath]];
    
    if (!cell){
        Class cls = [self cellClassAtIndexPath:indexPath];
        cell = [[cls alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentiferAtIndexPath:indexPath]];
    }
    cell.model = [self itemAtIndexPath:indexPath];
    [cell setUI];
    return cell;
}

- (Class)cellClassAtIndexPath:(NSIndexPath *)indexPath{
    FJ_Model *model = [self itemAtIndexPath:indexPath];
    switch (model.type) {
        case HeadPicturesType:{
            return [FJ_HeadPicturesCell class];
        }
            break;
    }
}

- (FJ_Model *)itemAtIndexPath:(NSIndexPath *)indexPath{
    return self.itemArray[indexPath.row];
}


- (NSString *)cellIdentiferAtIndexPath:(NSIndexPath *)indexPath{
    return NSStringFromClass([self cellClassAtIndexPath:indexPath]);
}

@end
