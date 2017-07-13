//
//  VTGeneralTool.h
//  SZDT_Partents
//
//  Created by szdt on 15/3/23.
//  Copyright (c) 2015年 szdt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface VTGeneralTool : NSObject

+ (CGSize)boundingRectWithSize:(CGSize)size  font:(CGFloat)font text:(NSString *)text;
+ (UIColor *)colorWithHex:(NSString *)hexColor;
+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
+ (BOOL)judgePushSwitch;

+ (NSString *)getCurrentDevice;

+ (NSString*)base64forData:(NSData*)theData;

/**
 *  各种字符串判断
 *
 */
+ (Boolean)isNumberCharaterString:(NSString *)str;      // 核对是否为数字字符组合
+ (Boolean)isCharaterString:(NSString *)str;            // 核对是否是字符串
+ (Boolean)isNumberString:(NSString *)str;              // 核对是否全为数字
+ (Boolean)hasillegalString:(NSString *)str;            // 检查是否含有非法字符
+ (Boolean)isValidSmsString:(NSString *)str;            //
+ (BOOL)verifyEmail:(NSString*)email;                   // 核对email
+ (BOOL)verifyPhone:(NSString*)phone;                   // 核对座机号码
+ (BOOL)verifyMobilePhone:(NSString*)phone;             // 核对手机号码
+ (NSString *)getTimeString:(NSInteger)duration;        // 通过时长获取时分秒的字符串
+ (NSString *)getChangeTime:(NSString *)duration;
+ (NSString *)cleanPhone:(NSString *)beforeClean;       //
+ (NSString *)translationNumIntoChinese:(NSInteger)integer; // 将数值转换成中文
+ (NSString *)translationNumIntoSequeseNum:(NSInteger)integer; // 将数值转换01格式
+ (BOOL)IsBankCard:(NSString *)cardNumber;          /// 核对身份证号是否正确
+ (BOOL)isCheckPassWordCharaterString:(NSString *)str WithNum:(NSInteger)num;  //  核对密码格式是否正确

/**
 *  把color变成image
 *
 *  @param color 传来的color
 *
 *  @return 返回iamge
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;


/**
 *@image  通过网络地址获取视频 缩略图
 **/
+ (UIImage *)imageWithVideo:(NSURL *)vidoURL;


/**
 *  检查非法字符和中文
 
 */
+ (BOOL)checkNoChar:(NSString *)str;
/**
 *  隐藏tabbar
 */
+ (void)hiddenTabBar;
/**
 *  显示tabbar
 */
+ (void)showTabBar;
/**
 *  检查电话号码合法性
 *
 */
+ (BOOL)checkPhoneNumInput:(NSString *)phoneNumber;
/**
 *  根据dict返回data
 *
 */
+ (NSData*)returnDataWithDictionary:(NSDictionary*)dict;
/**
 *  根据输入的日期 返回周几的字符串
 *
 */
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
/**
 *  获取今日日期
 *
 */
+ (NSString *)getDate;
/**
 *  获取当前周的日期数组
 *
 */
+ (NSArray *)getCurrentWeekDay:(NSDate *)date;
/**
 *  计算当前路径下文件大小
 *
 */
+ (float)fileSizeAtPath:(NSString *)path;
/**
 *  当前路径文件夹的大小
 *
 */
+ (float)folderSizeAtPath:(NSString *)path;
/**
 *  清除文件
 *
 */
+ (void)clearCache:(NSString *)path;

/**
 *    POST 提交 并可以上传图片目前只支持单张
 */
+ (NSString *)postRequestWithURL: (NSString *)url  // IN
                      postParems: (NSMutableDictionary *)postParems // IN 提交参数据集合
                     picFilePath: (NSString *)picFilePath  // IN 上传图片路径
                     picFileName: (NSString *)picFileName;  // IN 上传图片名称

/**
 * 修发图片大小
 */
+ (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;

/**
 * 获取系相册图片

 */
- (void)openSystemPhotos:(UIViewController *)viewController;



/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;
/**
 * 生成GUID
 */
+ (NSString *)generateUuidString;

/**
 * 检查系统"照片"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkPhotoLibraryAuthorizationStatus;

/**
 * 检查系统"相机"授权状态, 如果权限被关闭, 提示用户去隐私设置中打开.
 */
+ (BOOL)checkCameraAuthorizationStatus;

/**
 *  百度转火星坐标
 *
 */
+ (CLLocationCoordinate2D )bdToGGEncrypt:(CLLocationCoordinate2D)coord;
/**
 *  火星转百度坐标
 *
 */
+ (CLLocationCoordinate2D )ggToBDEncrypt:(CLLocationCoordinate2D)coord;
+(NSString  *)displayDataStyleWithNumber:(NSString *)timeNumber;
@end
