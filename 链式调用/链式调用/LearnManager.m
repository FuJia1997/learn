//
//  LearnManager.m
//  链式调用
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "LearnManager.h"

@implementation LearnManager

- (LearnChineseBlock)learnChinese{
    return ^LearnManager *(NSString *chinese){
        NSLog(@"学习：%@", chinese);
        return self;
    };
}

@end
