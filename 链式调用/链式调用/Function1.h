//
//  Function1.h
//  链式调用
//
//  Created by yons on 2019/12/7.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Function1;
typedef void(^mBlock)();
@interface Function1 : NSObject

- (mBlock)function;

@end
