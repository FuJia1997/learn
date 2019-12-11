//
//  FJ_Model.h
//  自制页面
//
//  Created by yons on 2019/12/9.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger{
    HeadPicturesType,
}FJ_ItemType;
@interface FJ_Model : NSObject

@property(nonatomic, strong)NSDictionary *dataDic;
@property(nonatomic, assign)FJ_ItemType type;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (FJ_Model *)modelWithDic:(NSDictionary *)dic;

@end
