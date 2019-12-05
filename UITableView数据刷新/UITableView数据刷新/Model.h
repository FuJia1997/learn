//
//  Model.h
//  UITableView数据刷新
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *nickName;
@property(nonatomic, copy)NSString *imageName;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (id)heroWithDic:(NSDictionary *)dic;

@end
