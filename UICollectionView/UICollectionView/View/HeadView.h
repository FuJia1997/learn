//
//  HeadView.h
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UICollectionReusableView

@property(nonatomic, copy)NSString *groupName;
@property(nonatomic, strong)UILabel *titleLabel;

@end
