//
//  FJ_TableViewDataSource.h
//  自制页面
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FJ_TableViewItemType;
@interface FJ_TableViewDataSource : NSObject<UITableViewDataSource>

@property(nonatomic, strong)NSArray *itemArray;

- (FJ_Model *)itemAtIndexPath:(NSIndexPath *)indexPath;

- (Class)cellClassAtIndexPath:(NSIndexPath *)indexPath;

@end
