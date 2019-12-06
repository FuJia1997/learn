//
//  bookTableViewCell.h
//  UITableView cell复用
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface bookTableViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView *iconImageView;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *detailLabel;
@property(nonatomic, strong)UILabel *priceLabel;
@property(nonatomic, strong)Model *model;

@end
