//
//  Function3.m
//  链式调用
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "Function3.h"

@implementation Function3

- (mBlock2)function{
    return ^Function3 *(NSString *str){
        NSLog(@"我想:%@", str);
        return self;
    };
}

@end
