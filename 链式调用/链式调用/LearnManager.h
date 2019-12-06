//
//  LearnManager.h
//  链式调用
//
//  Created by yons on 2019/12/6.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LearnManager;
typedef LearnManager *(^LearnChineseBlock) (NSString *chineseName);

@interface LearnManager : NSObject

- (LearnChineseBlock)learnChinese;

@end
