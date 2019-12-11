//
//  FJ_BaseCell.h
//  自制页面
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJ_Model.h"
#import "Masonry.h"

@interface FJ_BaseCell : UITableViewCell

@property(nonatomic, strong)FJ_Model *model;
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(FJ_Model *)model;
- (void)setUI;

@end
