//
//  Model.h
//  UICollectionView
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *imageName;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (id)modeWithDic:(NSDictionary *)dic;

@end
