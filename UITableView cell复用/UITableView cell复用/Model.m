//
//  Model.m
//  UITableView cell复用
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self == [super init]){
        self.title = dic[@"title"];
        self.detail = dic[@"detail"];
        self.icon = dic[@"icon"];
        self.price = dic[@"price"];
    }
    return self;
}

+ (id)bookWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
