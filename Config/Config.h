//
//  Config.h
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/5.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#ifndef Config_h
#define Config_h



#define UPARICLE_DATA      @"UPARICLE_DATA"

#define WeakSelf  __weak __typeof(&*self)weakSelf = self;

#define kPushPhotoBrowserNotifitationName @"PushPhotoBrowser"
#define kPresentVideoPlayerNotifitationName @"playCallBackVideo"

#define APPICONIMAGE [UIImage imageNamed:[[[[NSBundle mainBundle] infoDictionary] valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject]]
#define APPNAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define Main_Color [UIColor colorWithRed:(39)/255.0 green:(160)/255.0 blue:(235)/255.0 alpha:1.0]
#define Main2_Color [UIColor colorWithRed:(135)/255.0 green:(202)/255.0 blue:(231)/255.0 alpha:1.0]
#define VTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define Text_Color [UIColor colorWithRed:(51)/255.0 green:(71)/255.0 blue:(113)/255.0 alpha:1.0]
#define BackGround_Color [UIColor colorWithRed:(235)/255.0 green:(235)/255.0 blue:(241)/255.0 alpha:1.0]
#define BWColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define BWFont(font) [UIFont systemFontOfSize:(font)]

#define NameColor [UIColor colorWithRed:(0)/255.0 green:(0)/255.0 blue:(0)/255.0 alpha:1.0]
#define TextColor [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define BACKGROUNDCOLOR BWColor(231, 88, 83, 1)

// 输出功能  上线不显示
#define BWLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

/**
 *  判断当前设备是否时iOS8.0以上
 */
#define IOS8 ([[[UIDevice currentDevice] systemVersion] doubleValue] >=8.0 ? YES : NO)


/**
 *   是否是iPad   对其进行其他的处理
 */
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 *      适配时主要判断是 5 6 6p 三种屏幕尺寸就可以 放弃 4 的处理 7 7Plus 屏幕和6 6plus 相同
 */
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)
#define IS_IPhone6 (667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
#define IS_IPhone6plus (736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
#define IS_IPhone4S (480 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

// #CC00FF      252, 163, 78, 1    253 164 133

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))



#define BWColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define TabBarColor     BWColor(250, 250, 248, 1)
#define tabTitleColor   BWColor(107, 205, 253, 1)
#define TabRedColor     BWColor(202, 8,   20,  1)

///  导航的颜色
#define MainNavColor    BWColor(107, 205, 253, 1)
#define DetailTextColor BWColor(80, 80, 78, 1)
#define SelecteCellColor BWColor(238, 238, 240, 1)
///  选中字母颜色变化
#define SelecteABCMenuColor BWColor(35, 205, 253, 1)



///  文本字体
#define DefultTitle_NAVFONT  [UIFont fontWithName:@"Kaiti" size:17];
#define DefultDesc_NAVFONT  [UIFont fontWithName:@"Kaiti" size:15];
#define AuthorName_NAVFONT  [UIFont fontWithName:@"Fanfsong" size:13];


///  文本颜色
#define TitleColor      BWColor(68, 68, 68, 1)
#define DetailColor     BWColor(98, 98, 98, 1)






////   屏幕尺寸
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define SZUserDefault [NSUserDefaults standardUserDefaults]




#endif /* Config_h */
