//
//  NSString+StringSize.h
//  bowen
//
//  Created by zhujp on 2016/11/9.
//  Copyright © 2016年 zhuyonggang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringSize)


/**
 *  简单计算textsize
 *
 *  @param width 传入特定的宽度
 *  @param font  字体
 */
- (CGSize)sizeWithLabelWidth:(CGFloat)width font:(UIFont *)font;

- (CGFloat)getHeighWithTitle:(NSString *)title font:(UIFont *)font width:(float)width;

+ (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width LineSpace:(CGFloat)lineHeight;

+ (CGSize)getSizeWirth;

@end
