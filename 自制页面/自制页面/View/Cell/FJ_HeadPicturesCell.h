//
//  FJ_HeadPicturesCell.h
//  自制页面
//
//  Created by yons on 2019/12/9.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJ_BaseCell.h"
#import "FJ_StarLevelView.h"

@interface FJ_HeadPicturesCell : FJ_BaseCell

@property(nonatomic, strong)UIView *backGroundView;
@property(nonatomic, strong)UIScrollView *headScrollView;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)FJ_StarLevelView *starView;
//- (void)setUI;

@end
