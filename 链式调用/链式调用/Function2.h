//
//  Function2.h
//  链式调用
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Function2;
typedef void(^mBlock1)(NSString *str);

@interface Function2 : NSObject

- (mBlock1)function;

@end
