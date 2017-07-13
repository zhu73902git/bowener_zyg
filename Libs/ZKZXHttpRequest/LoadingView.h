//
//  LoadingView.h
//  AFCache
//
//  Created by tc on 2016/11/11.
//  Copyright © 2016年 tc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadingView : NSObject

+ (void)showAlertHUD:(NSString *)aString duration:(CGFloat)duration;
+ (void)showProgressHUD:(NSString *)aString duration:(CGFloat)duration;
// 只有标题提示
+ (void)showProgressHUD:(NSString *)aString;
// 转圈图标
+ (void)hideProgressHUD;
// 更新进度
+ (void)updateProgressHUD:(NSString*)progress;
// 显示 提示信息  显示时常  显示的图片
+ (void)showMsg:(NSString *)msg duration:(CGFloat)time imgName:(NSString *)imgName;



@end
