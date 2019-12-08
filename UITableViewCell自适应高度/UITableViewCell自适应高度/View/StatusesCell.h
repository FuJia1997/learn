//
//  StatusesCell.h
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusesFrame.h"
@interface StatusesCell : UITableViewCell

@property(nonatomic, strong)StatusesFrame *statusesFrame;
@property(nonatomic, strong)UIImageView *iconImageView;
@property(nonatomic, strong)UILabel *nameLabel;
@property(nonatomic, strong)UILabel *contentTextLabel;
@property(nonatomic, strong)UIImageView *pictureImageView;
@property(nonatomic, strong)UIImageView *vipImageView;

+ (StatusesCell *)cellWithTableView:(UITableView *)tableView;

@end
