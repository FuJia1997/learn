//
//  ViewControllerTwo.h
//  Block
//
//  Created by yons on 2019/12/4.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TwoDalegate<NSObject>

- (void)input:(NSString *)text;

@end

@interface ViewControllerTwo : UIViewController <UITextFieldDelegate>

@property(nonatomic, assign)id <TwoDalegate> delegate;

@end

