//
//  StatusesCell.m
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "StatusesCell.h"

@implementation StatusesCell

+ (StatusesCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"status";
    StatusesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil){
        cell = [[StatusesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{ 
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.vipImageView];
        [self.contentView addSubview:self.pictureImageView];
        [self.contentView addSubview:self.contentTextLabel];
    }
    return self;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView){
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel){
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UIImageView *)vipImageView{
    if (!_vipImageView){
        _vipImageView = [UIImageView new];
        _vipImageView.image = [UIImage imageNamed:@"会员.png"];
    }
    return _vipImageView;
}

- (UILabel *)contentTextLabel{
    if (!_contentTextLabel){
        _contentTextLabel = [UILabel new];
        _contentTextLabel.numberOfLines = 0;
        _contentTextLabel.font = [UIFont systemFontOfSize:17];
    }
    return _contentTextLabel;
}

- (UIImageView *)pictureImageView{
    if (!_pictureImageView){
        _pictureImageView = [UIImageView new];
    }
    return _pictureImageView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStatusesFrame:(StatusesFrame *)statusesFrame{
    _statusesFrame = statusesFrame;
    [self settingFrame];
    
    [self setData];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    //获取字体族
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    //根据文本的高度宽度字体内容计算文本高度（ios7之后可用）
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

- (void)setData{
    Model *model = _statusesFrame.model;
    
    _iconImageView.image = [UIImage imageNamed:model.icon];
    
    _nameLabel.text = model.name;
    
    if ([model.vip boolValue] == YES){
        _vipImageView.image = [UIImage imageNamed:@"会员.png"];
        _nameLabel.textColor = [UIColor redColor];
        _vipImageView.hidden = NO;
    }else{
        _nameLabel.textColor = [UIColor blackColor];
        _vipImageView.hidden = YES;
    }
    
    
    _contentTextLabel.text = model.text;
    
    _pictureImageView.image = [UIImage imageNamed:model.pictureName];
}

- (void) settingFrame{
    _iconImageView.frame = _statusesFrame.iconFrame;
    _nameLabel.frame = _statusesFrame.nameFrame;
    _vipImageView.frame = _statusesFrame.vipFrame;
    _contentTextLabel.frame = _statusesFrame.contentTextFrame;
    _pictureImageView.frame = _statusesFrame.pictureFrame;
}

@end
