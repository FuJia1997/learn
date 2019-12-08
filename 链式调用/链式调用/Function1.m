//
//  Function1.m
//  链式调用
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Function1.h"

@implementation Function1

- (mBlock)function{
    return ^{
        NSLog(@"无参无返回值block!");
    };
}

@end
