//
//  Model.m
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init])
    {
        self.title = dic[@"title"];
        self.imageName = dic[@"imageName"];
    }
    return self;
}

+ (id)modeWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
