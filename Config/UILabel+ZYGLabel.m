//
//  UILabel+ZYGLabel.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "UILabel+ZYGLabel.h"

@implementation UILabel (ZYGLabel)


+ (UILabel *)initWithTitle:(NSString *)title
           WithTextAligent:(NSTextAlignment)aligment
             WithTextColor:(UIColor *)color
                  WithFont:(NSInteger)font{
    
    UILabel *label=[[UILabel alloc] init];
    label.font=[UIFont systemFontOfSize:font];
    label.textAlignment=aligment;
    label.textColor =color;
    label.text=title;
    
    return label;
    
}




@end
