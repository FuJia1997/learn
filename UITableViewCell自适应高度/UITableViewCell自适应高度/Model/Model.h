//
//  Model.h
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *text;
@property(nonatomic, copy)NSString *icon;
@property(nonatomic, strong)NSString *vip;
@property(nonatomic, copy)NSString *pictureName;

- (instancetype)initWithDic:(NSDictionary *)dic;
+(id)ModelWithDic:(NSDictionary *)dic;

@end
