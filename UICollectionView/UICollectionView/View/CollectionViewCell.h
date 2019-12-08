//
//  CollectionViewCell.h
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface CollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)Model *model;
@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, strong)UILabel *titleLabel;

@end
