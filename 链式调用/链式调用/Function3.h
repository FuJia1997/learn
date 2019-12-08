//
//  Function3.h
//  链式调用
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Function3;
typedef Function3 *(^mBlock2)(NSString *str);
@interface Function3 : NSObject

- (mBlock2)function;

@end
