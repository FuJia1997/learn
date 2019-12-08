//
//  Function2.m
//  链式调用
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Function2.h"

@implementation Function2

- (mBlock1)function{
    return ^(NSString *str){
        NSLog(@"我想：%@", str);
    };
}

@end
