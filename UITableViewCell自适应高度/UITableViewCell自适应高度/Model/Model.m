//
//  Model.m
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (id)ModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

@end
