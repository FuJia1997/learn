//
//  FJ_StarLevelView.m
//  自制页面
//
//  Created by yons on 2019/12/9.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "FJ_StarLevelView.h"
#import "Masonry.h"

@implementation FJ_StarLevelView

//满分为5分
- (instancetype)initWithScore:(CGFloat)score{
    if (self = [super init]){
        int starLightNum = score;
        
        int width = 20;
        int height = 20;
        
        for (int i = 0; i < starLightNum; i++){
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"星_亮.png"]];
            imageView.frame = CGRectMake(i * width, 0, width, height);
            [self addSubview:imageView];
        }
        for (int i = starLightNum; i < 5; i++){
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"星_暗.png"]];
            imageView.frame = CGRectMake(i * width, 0, width, height);
            [self addSubview:imageView];
        }
    }
    return self;
}

+ (FJ_StarLevelView *)starLevelWithScore:(CGFloat)score{
    return [[self alloc]initWithScore:score];
}

@end
