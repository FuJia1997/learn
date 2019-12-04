//
//  SingleTon.h
//  单例传值
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleTon : NSObject

@property(nonatomic, copy)NSString *text;
+ (SingleTon *)shareSingle;

@end
