//
//  GroupModel.m
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel

- (instancetype)initWithArray:(NSArray *)arr{
    if (self = [super init]){
        self.modelArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in arr){
            Model *model = [Model modeWithDic:dic];
            [self.modelArray addObject:model];
        }
    }
    return self;
}
+ (id)groupModelWithArray:(NSArray *)arr{
    return [[self alloc] initWithArray:arr];
}

@end
