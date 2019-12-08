//
//  StatusesFrame.h
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import <UIKit/UIKit.h>
@interface StatusesFrame : NSObject

@property(nonatomic, strong)Model *model;
@property(nonatomic, assign, readonly)CGRect iconFrame;
@property(nonatomic, assign, readonly)CGRect nameFrame;
@property(nonatomic, assign, readonly)CGRect contentTextFrame;
@property(nonatomic, assign, readonly)CGRect pictureFrame;
@property(nonatomic, assign, readonly)CGRect vipFrame;
@property(nonatomic, assign, readonly)CGFloat cellHeight;

@end
