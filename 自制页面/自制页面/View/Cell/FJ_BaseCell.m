//
//  FJ_BaseCell.m
//  自制页面
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "FJ_BaseCell.h"

@implementation FJ_BaseCell
//cell默认高度
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(FJ_Model *)model{
    return 44.f;
}

- (void)setItem:(FJ_Model *)type{
    self.textLabel.text = self.reuseIdentifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
