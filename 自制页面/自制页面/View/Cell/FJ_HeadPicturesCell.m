//
//  FJ_HeadPicturesCell.m
//  自制页面
//
//  Created by yons on 2019/12/9.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Masonry.h"
#import "FJ_HeadPicturesCell.h"

@implementation FJ_HeadPicturesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
    }
    return self;
}

- (void)setUI{
    [self addSubview];
    [self addContraint];
    [self setAttribute:self.model];
}

- (void)setAttribute:(FJ_Model *)model{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:model.dataDic];
    NSArray *arr = [NSArray arrayWithArray:dic[@"picture"]];
    self.headScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * arr.count, 230.f);
    self.headScrollView.pagingEnabled = YES;
    self.headScrollView.bounces = NO;
    for (int i = 0; i < arr.count; i++){
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 230.f)];
        imageView.image = [UIImage imageNamed:arr[i]];
        [self.headScrollView addSubview:imageView];
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.backGroundView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.backGroundView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.backGroundView.layer.mask = maskLayer;
    
    //标题
    NSDictionary *detailsDic = [NSDictionary dictionaryWithDictionary:dic[@"detail"]];
    self.titleLabel.text = detailsDic[@"title"];
    //星级
    //self.starView = [FJ_StarLevelView starLevelWithScore:4.8];
}

- (void)addSubview{
    [self addSubview:self.headScrollView];
    [self addSubview:self.backGroundView];
    [self.backGroundView addSubview:self.titleLabel];
    [self.backGroundView addSubview:self.starView];
}

- (void)addContraint{
    [self.headScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    //标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(30);
    }];
    
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(120);
        make.centerY.mas_equalTo(self.titleLabel);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
}

- (UIScrollView *)headScrollView{
    if (!_headScrollView){
        _headScrollView = [UIScrollView new];
    }
    return _headScrollView;
}

- (UIView *)backGroundView{
    if (!_backGroundView){
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 210, [UIScreen mainScreen].bounds.size.width, 220)];
        
        _backGroundView.backgroundColor = [UIColor whiteColor];
    }
    return _backGroundView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 1;
        [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    }
    return _titleLabel;
}

- (FJ_StarLevelView *)starView{
    if (!_starView){
        _starView = [FJ_StarLevelView starLevelWithScore:4.8];
    }
    return _starView;
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(FJ_Model *)model{
    return 230.f + 200.f;
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
