//
//  Model.m
//  UITableView-plist
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]){
        self.name = dict[@"name"];
        self.nickName = dict[@"nickName"];
        self.imageName = dict[@"imageName"];
    }
    return self;
}
+ (id)heroWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
