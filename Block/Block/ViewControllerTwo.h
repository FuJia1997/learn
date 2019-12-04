//
//  ViewControllerTwo.h
//  Block
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>

//第一步：声明一个block
typedef void (^ReturnTextBlock)(NSString *showText);
@interface ViewControllerTwo : UIViewController <UITextFieldDelegate>

@property(nonatomic, copy) ReturnTextBlock retBlock;
@end
