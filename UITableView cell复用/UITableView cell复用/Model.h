//
//  Model.h
//  UITableView cell复用
//
//  Created by yons on 2019/12/5.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *detail;
@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *price;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (id)bookWithDic:(NSDictionary *)dic;

@end
