//
//  AcctHeaderView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "AcctHeaderView.h"
#import "AccountViewController.h"           // 钱包
#import "MemberViewController.h"            // 会员中心
#import "AuthenticationViewController.h"    // 实名认证
#import "InvitationViewController.h"        // 邀请
#import "UserMsgViewController.h"           // 用户资料


@interface AcctHeaderView ()

@property (nonatomic,strong) UIView     *userMsgView;   // 用户信息视图模块
@property (nonatomic,strong) UIImageView *iconImgView;  // 头像
@property (nonatomic,strong) UILabel     *userNameLabel;// 用户名
@property (nonatomic,strong) UILabel     *MemberLabel;  // 会员


@property (nonatomic,strong) UIView     *selListBottomView;  ///选择模块视图


@end

@implementation AcctHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=SelecteCellColor;
        [self loadSubViews];
    }
    return self;
}

- (void)setSupVC:(UIViewController *)supVC{
    _supVC= supVC;
}


- (void)loadSubViews{
    
    ///  设置头像模块
    [self addSubview:self.userMsgView];
    self.userMsgView.frame = CGRectMake(0, 0, kScreenW, kScreenW*0.3-1);
    /// 头像 名称 会员状态
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(@0);
        make.left.mas_equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.18, kScreenW*0.18));
    }];
    self.iconImgView.layer.cornerRadius = kScreenW*0.09;
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImgView.mas_right).mas_equalTo(@15);
        make.top.mas_equalTo(_iconImgView.mas_top).mas_equalTo(@5);
        make.right.mas_equalTo(@-20);
    }];
    [self.MemberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImgView.mas_right).mas_equalTo(@15);
        make.bottom.mas_equalTo(_iconImgView.mas_bottom).mas_equalTo(@-5);
        make.right.mas_equalTo(@-20);
    }];
    UIImageView *img =[[UIImageView alloc] init];
    img.image= [UIImage imageNamed:@"acctRightImg"];
    [self.userMsgView addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-8);
        make.centerY.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    
    ///  设置选择模块
    [self addSubview:self.selListBottomView];
    self.selListBottomView.frame = CGRectMake(0, kScreenW*0.3, kScreenW, kScreenW*0.20);
    NSArray *titleArr =@[@"钱包",@"会员中心",@"实名认证",@"邀请"];
    NSArray *imageArr =@[@"actList1",@"actList2",@"actList3",@"actList4"];
    for (int i=0; i<titleArr.count; i++) {
        UIView *botView =[[UIView alloc] init];
        botView.backgroundColor =[UIColor whiteColor];
        botView.tag = i;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acctSelecteViewAction:)];
        [botView addGestureRecognizer:tap];
        if (i==1) {
            botView.frame = CGRectMake(kScreenW/4*i+0.6, 0, kScreenW/4-1.2, kScreenW*0.20);
        }else if(i==2){
            botView.frame = CGRectMake(kScreenW/4*i, 0, kScreenW/4-0.6, kScreenW*0.20);
        }else{
            botView.frame = CGRectMake(kScreenW/4*i, 0, kScreenW/4, kScreenW*0.20);
        }
        
        [self.selListBottomView addSubview:botView];
        
        UIImageView *img=[[UIImageView alloc] init];
        img.image =[UIImage imageNamed:imageArr[i]];
        [botView addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(@0);
            make.centerY.mas_equalTo(@-10);
            make.size.mas_equalTo(CGSizeMake(kScreenW*0.06, kScreenW*0.06));
        }];
        
        UILabel *label =[[UILabel alloc] init];
        label.text = titleArr[i];
        label.textAlignment =NSTextAlignmentCenter;
        label.font = BWFont(12);
        [botView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(@0);
            make.top.mas_equalTo(img.mas_bottom).mas_equalTo(@5);
            make.size.mas_equalTo(CGSizeMake(kScreenW/4, 18));
        }];
        
    }

}


#pragma mark  选择视图
- (void)acctSelecteViewAction:(UITapGestureRecognizer *)tap{
    
    NSInteger index = tap.view.tag;
    NSArray *titleArr = @[@"钱包",@"会员中心",@"实名认证",@"邀请"];
    
    RDVTabBarController *rdv =[self.supVC rdv_tabBarController];
    [rdv setTabBarHidden:YES animated:YES];
    
    switch (index) {
        case 0:
        {
            AccountViewController *viewVC =[AccountViewController new];
            viewVC.title = titleArr[index];
            [self.supVC.navigationController pushViewController:viewVC animated:YES];

        }
            break;
        case 1:
        {
            MemberViewController *viewVC =[MemberViewController new];
            viewVC.title = titleArr[index];
            [self.supVC.navigationController pushViewController:viewVC animated:YES];

        }
            break;
        case 2:
        {
            AuthenticationViewController *viewVC =[AuthenticationViewController new];
            viewVC.title = titleArr[index];
            [self.supVC.navigationController pushViewController:viewVC animated:YES];

        }
            break;
        case 3:
        {
            InvitationViewController *viewVC =[InvitationViewController new];
            viewVC.title = titleArr[index];
            [self.supVC.navigationController pushViewController:viewVC animated:YES];

        }
            break;
        default:
            break;
    }
    
}


- (UIView *)userMsgView{
    if (!_userMsgView) {
        _userMsgView =[[UIView alloc] init];
        UITapGestureRecognizer *userTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userMsgViewTapAction:)];
        [_userMsgView addGestureRecognizer:userTap];
        _userMsgView.backgroundColor =[UIColor whiteColor];
    }
    return _userMsgView;
}
#pragma mark  用户资料
- (void)userMsgViewTapAction:(UITapGestureRecognizer *)tap{
    
    RDVTabBarController *rdv =[self.supVC rdv_tabBarController];
    [rdv setTabBarHidden:YES animated:YES];
    UserMsgViewController *userMsg =[[UserMsgViewController alloc] init];
    userMsg.title = @"我的资料";
    [self.supVC.navigationController pushViewController:userMsg animated:YES];

}

- (UIView *)selListBottomView{
    if (!_selListBottomView) {
        _selListBottomView =[[UIView alloc] init];
        _selListBottomView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
    }
    return _selListBottomView;
}

///
- (UIImageView *)iconImgView{
    if (!_iconImgView) {
        _iconImgView =[[UIImageView alloc] init];
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.borderColor =BWColor(238, 238, 240, 1).CGColor;
        _iconImgView.layer.borderWidth = 1.6;
        _iconImgView.image =[UIImage imageNamed:@"listTest1"];
        [self.userMsgView addSubview:self.iconImgView];
    }
    return _iconImgView;
}
- (UILabel *)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel =[[UILabel alloc] init];
        _userNameLabel.textAlignment= NSTextAlignmentLeft;
        _userNameLabel.font = [UIFont boldSystemFontOfSize:16];
        _userNameLabel.text = @"张泽一";
        [self.userMsgView addSubview:self.userNameLabel];
    }
    return _userNameLabel;
}

- (UILabel *)MemberLabel{
    if (!_MemberLabel) {
        _MemberLabel =[[UILabel alloc] init];
        _MemberLabel.textAlignment= NSTextAlignmentLeft;
        _MemberLabel.font = BWFont(14);
        _MemberLabel.text = @"普通会员";
        _MemberLabel.textColor =[UIColor orangeColor];
        [self.userMsgView addSubview:self.MemberLabel];
    }
    return _MemberLabel;
}



@end
