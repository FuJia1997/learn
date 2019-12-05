//
//  Model.m
//  UITableView数据刷新
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]){
        self.name = dic[@"name"];
        self.nickName = dic[@"nickName"];
        self.imageName = dic[@"imageName"];
    }
    return self;
}

+ (id)heroWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
@end
