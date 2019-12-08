//
//  GroupModel.h
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface GroupModel : NSObject

@property(nonatomic, copy)NSString *groupName;
@property(nonatomic, strong)NSMutableArray *modelArray;

- (instancetype)initWithArray:(NSArray *)arr;
+ (id)groupModelWithArray:(NSArray *)arr;
@end
