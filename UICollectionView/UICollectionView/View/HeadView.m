//
//  HeadView.m
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.titleLabel = [UILabel new];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setGroupName:(NSString *)groupName{
    _groupName = groupName;
    [self settingData];
    
    [self settingFrame];
}

- (void)settingData{
    _titleLabel.text = _groupName;
}

- (void)settingFrame{
    _titleLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
}

@end
