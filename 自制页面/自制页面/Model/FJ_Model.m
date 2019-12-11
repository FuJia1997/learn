//
//  FJ_Model.m
//  自制页面
//
//  Created by yons on 2019/12/9.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "FJ_Model.h"

@implementation FJ_Model

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]){
        self.dataDic = [[NSDictionary alloc]initWithDictionary:dic];
    }
    return self;
}

+ (FJ_Model *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
