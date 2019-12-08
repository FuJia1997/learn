//
//  StatusesFrame.m
//  UITableViewCell自适应高度
//
//  Created by yons on 2019/12/8.
//  Copyright © 2019年 fujia. All rights reserved.
//

#import "StatusesFrame.h"

@implementation StatusesFrame

- (void)setModel:(Model *)model{
    _model = model;
    [self settingFrame];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    //获取字体族
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    //根据文本的高度宽度字体内容计算文本高度（ios7之后可用）
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

- (void)settingFrame{
//设置icon位置
    CGFloat padding = 10;
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
//设置昵称位置
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + padding;
    CGFloat nameY = padding;
    //保证文字显示完整
    CGSize nameSize = [self sizeWithText:self.model.name font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
//设置vip角标位置
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + padding;
    CGFloat vipY = padding;
    CGFloat vipW = 19;
    CGFloat vipH = 14;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
//设置text文字位置
    CGFloat textX = padding;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + padding;
    CGSize textSize = [self sizeWithText:self.model.text font:[UIFont systemFontOfSize:17.0] maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * padding, MAXFLOAT)];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _contentTextFrame = CGRectMake(textX, textY, textW, textH);
//设置picture位置
    CGFloat pictureX = padding;
    CGFloat pictureY = CGRectGetMaxY(_contentTextFrame) + padding;
    CGFloat pictureW = 100;
    CGFloat pictureH = 100;
    _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    if (_model.pictureName){
        _cellHeight = CGRectGetMaxY(_pictureFrame) + padding;
    }else{
        _cellHeight = CGRectGetMaxY(_contentTextFrame) + padding;
    }
}

@end
