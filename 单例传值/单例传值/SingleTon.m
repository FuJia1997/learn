//
//  SingleTon.m
//  单例传值
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "SingleTon.h"

@implementation SingleTon

+ (SingleTon *)shareSingle{
    static SingleTon *single = nil;
    if (single == nil){
        single = [[SingleTon alloc] init];
    }
    return single;
}

@end
