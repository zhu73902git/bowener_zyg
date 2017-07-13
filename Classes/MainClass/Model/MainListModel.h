//
//  MainListModel.h
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainListModel : NSObject


////
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *desc;
@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSString *iconImage;
@property (nonatomic,strong) NSArray  *labels;

@property (nonatomic,strong) NSString *vedioPath;

/// 发布者
@property (nonatomic,strong) NSString *userImage;
@property (nonatomic,strong) NSString *name;




@end
