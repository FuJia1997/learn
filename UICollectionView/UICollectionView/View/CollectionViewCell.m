//
//  CollectionViewCell.m
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        
        self.imageView = [UIImageView new];
        [self.contentView addSubview:self.imageView];
        
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:self.titleLabel];
        
        
    }
    return self;
}

- (void)setModel:(Model *)model{
    _model = model;
    [self settingData];
    
    [self settingFrame];
}

- (void)settingData{
    self.imageView.image = [UIImage imageNamed:_model.imageName];
    self.titleLabel.text = _model.title;
}

- (void)settingFrame{
    
    _imageView.frame = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 40) / 3, 120);
    _titleLabel.frame = CGRectMake(0, 120, ([UIScreen mainScreen].bounds.size.width - 40) / 3, 20);
    
}

@end
