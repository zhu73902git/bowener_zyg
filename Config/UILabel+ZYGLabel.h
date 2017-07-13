//
//  UILabel+ZYGLabel.h
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZYGLabel)




/**
 *   初始化label
 */
+ (UILabel *)initWithTitle:(NSString *)title
           WithTextAligent:(NSTextAlignment)aligment
             WithTextColor:(UIColor *)color
                  WithFont:(NSInteger)font;



@end
