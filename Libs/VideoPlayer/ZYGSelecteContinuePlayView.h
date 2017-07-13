//
//  ZYGSelecteContinuePlayView.h
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/13.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelecteISContinueActionBlock)(BOOL bol);
typedef void(^TouchTestActionBlock)(BOOL bol);


@interface ZYGSelecteContinuePlayView : UIView


///  点击了 继续播放按钮
@property (nonatomic,copy)  SelecteISContinueActionBlock selBlock;
///  点击了 重试按钮
@property (nonatomic,copy)  TouchTestActionBlock touchBlock;

///  背景颜色
@property (nonatomic,strong) UIColor    *backGroundColor;

///  标题
@property (nonatomic,strong) NSString   *title;
///  副标题
@property (nonatomic,strong) NSString   *detailTitle;
///  按钮
@property (nonatomic,strong) NSString   *buttonTitle;
///  显示是否继续播放视图  用语检测网络

- (instancetype)init;
///  隐藏移除视图
- (void)hideSelecteView;





@end
