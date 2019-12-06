//
//  bookTableViewCell.m
//  UITableView cell复用
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "bookTableViewCell.h"

@implementation bookTableViewCell
//重写创建cell的方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self addSubview:self.iconImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.priceLabel];
        
    }
    return self;
}

- (void)setModel:(Model *)model{
    _model = model;
    
    [self setData];
}

- (void)setData{
    _iconImageView.image = [UIImage imageNamed:self.model.icon];
    
    _titleLabel.text = self.model.title;
    
    _detailLabel.text = self.model.detail;
    
    _priceLabel.text = self.model.price;
    _priceLabel.textColor = [UIColor redColor];
}

- (UIImageView *)iconImageView{
    if (!_iconImageView){
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, [UIScreen mainScreen].bounds.size.width - 120, 30)];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel){
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, [UIScreen mainScreen].bounds.size.width - 120, 15)];
    }
    return _detailLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel){
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, [UIScreen mainScreen].bounds.size.width - 120, 30)];
    }
    return _priceLabel;
}

//一下两个方法是使用xib设置控件时使用
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
