//
//  LoadingView.m
//  AFCache
//
//  Created by tc on 2016/11/11.
//  Copyright © 2016年 tc. All rights reserved.
//

UIWindow *mainWindow() {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    return nil;
}

#import "LoadingView.h"
#import "MBProgressHUD.h"

static MBProgressHUD  *s_progressHUD = nil;

@implementation LoadingView


+ (void)showProgressHUD:(NSString *)aString duration:(CGFloat)duration {
    [self hideProgressHUD];
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:mainWindow()];
    [mainWindow() addSubview:progressHUD];
    progressHUD.animationType = MBProgressHUDAnimationZoom;
    progressHUD.label.text = aString;
    
    progressHUD.removeFromSuperViewOnHide = YES;
    [progressHUD.bezelView setOpaque:YES];
    [progressHUD showAnimated:NO];
    [progressHUD hideAnimated:YES afterDelay:duration];
}

+ (void)showProgressHUD:(NSString *)aString {
    if (!s_progressHUD) {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            s_progressHUD = [[MBProgressHUD alloc] initWithView:mainWindow()];
        });
    }else{
        [s_progressHUD hideAnimated:NO];
    }
    [mainWindow() addSubview:s_progressHUD];
    s_progressHUD.removeFromSuperViewOnHide = YES;
    s_progressHUD.animationType = MBProgressHUDAnimationZoom;
    if ([aString length]>0) {
        s_progressHUD.label.text = aString;
    }
    else s_progressHUD.label.text = nil;
    
    [s_progressHUD.bezelView setOpaque:YES];
    [s_progressHUD showAnimated:YES];
    [self performSelector:@selector(hidHudView) withObject:nil afterDelay:30];
    
}
+ (void)showMsg:(NSString *)msg duration:(CGFloat)time imgName:(NSString *)imgName
{
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    // 显示模式,改成customView,即显示自定义图片(mode设置,必须写在customView赋值之前)
    hud.mode = MBProgressHUDModeCustomView;
    // 设置要显示 的自定义的图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    // 显示的文字,比如:加载失败...加载中...
    hud.label.text = msg;
    // 标志:必须为YES,才可以隐藏,  隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:time];
}
+ (void)hidHudView{
    
    [LoadingView hideProgressHUD];
}

+ (void)showAlertHUD:(NSString *)aString duration:(CGFloat)duration {
    [self hideProgressHUD];
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:mainWindow()];
    [mainWindow() addSubview:progressHUD];
    progressHUD.animationType = MBProgressHUDAnimationZoom;
    progressHUD.label.text = aString;
    progressHUD.removeFromSuperViewOnHide = YES;
    [progressHUD.bezelView setOpaque:YES];
    progressHUD.mode = MBProgressHUDModeText;
    [progressHUD showAnimated:NO];
    [progressHUD hideAnimated:YES afterDelay:duration];
}

+ (void)hideProgressHUD {
    if (s_progressHUD) {
        [s_progressHUD hideAnimated:YES];
    }
}

+ (void)updateProgressHUD:(NSString*)progress {
    if (s_progressHUD) {
        s_progressHUD.label.text = progress;
    }
}


@end
