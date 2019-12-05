//
//  Model.h
//  UITableView-plist
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *nickName;
@property(nonatomic, copy)NSString *imageName;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(id)heroWithDict:(NSDictionary *)dict;

@end
