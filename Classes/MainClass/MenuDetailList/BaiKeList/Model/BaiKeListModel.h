//
//  BaiKeListModel.h
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/27.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaiKeListModel : NSObject



@property (nonatomic,strong) NSString *type;    // text textImg video person 
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *detail;

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *desc;

@property (nonatomic,strong) NSString *views;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *time;






@end
