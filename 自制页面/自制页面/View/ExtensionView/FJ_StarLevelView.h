//
//  FJ_StarLevelView.h
//  自制页面
//
//  Created by yons on 2019/12/9.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJ_StarLevelView : UIView

- (instancetype)initWithScore:(CGFloat)score;
+ (FJ_StarLevelView *)starLevelWithScore:(CGFloat)score;

@end
