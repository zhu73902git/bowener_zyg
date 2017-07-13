//
//  MainTableViewHeaderView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/6.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MainTableViewHeaderView.h"
#import "MXScrollView.h"


///  所有子菜单
#import "BaiKeViewController.h"
#import "ZhuanJiaViewController.h"
#import "JiGouViewController.h"
#import "ChanYeViewController.h"
#import "ZhuanFangViewController.h"
#import "LunTanViewController.h"
#import "ChangGuoViewController.h"
#import "MoreMenuViewController.h"

#import "MainBannerDetailViewController.h"

@interface MainTableViewHeaderView ()<MXScrollViewDelegate>


@property (strong, nonatomic) NSArray *imageUrls;
///  底层视图
@property (nonatomic,strong) UIView *selecteBottomView;


@end

@implementation MainTableViewHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
        
        
    }
    return self;
}
///  控制器
- (void)setSupViewController:(UIViewController *)supViewController{
    _supViewController = supViewController;
}


- (void)loadSubViews{

    MXScrollView *mxScrollView = [[MXScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.5) withContents:self.imageUrls andScrollDelay:3.5];
    
    mxScrollView.clickHandler = ^(NSInteger index) {
        [self clickImageIndex:index];
    };
    
    [self addSubview:mxScrollView];
    
    [self addSubview:self.selecteBottomView];
    self.selecteBottomView.frame = CGRectMake(0, kScreenW*0.5, kScreenW, kScreenW*0.4);
    
    NSArray *titleArr =@[@"百科",@"专家",@"机构",@"产业",@"专访",@"论坛",@"成果",@"更多"];
    NSArray *imageArr =@[@"list1",@"list2",@"list3",@"list4",@"list5",@"list6",@"list7",@"list8"];
    for (int i=0; i<titleArr.count; i++) {
        UIView *botView =[[UIView alloc] init];
        botView.backgroundColor =[UIColor whiteColor];
        botView.tag = i;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selecteImageViewAction:)];
        [botView addGestureRecognizer:tap];
        if (i<4) {
            botView.frame = CGRectMake(kScreenW/4*i+0.6    , 0  , kScreenW/4-1.2, kScreenW*0.2);
        }else{
            botView.frame = CGRectMake(kScreenW/4*(i-4)+0.6, kScreenW*0.2+0.6, kScreenW/4-1.2, kScreenW*0.2);
        }
        
        [self.selecteBottomView addSubview:botView];
        
        UIImageView *img=[[UIImageView alloc] init];
        img.image =[UIImage imageNamed:imageArr[i]];
        [botView addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(@0);
            make.centerY.mas_equalTo(@-8);
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

- (void)clickImageIndex:(NSInteger)index {
    
    [[self.supViewController rdv_tabBarController] setTabBarHidden:YES];
    
    NSString *url = @"https://mp.weixin.qq.com/s?__biz=MjM5ODY0MjE0NQ==&mid=2652512111&idx=1&sn=403a64f5ddba84eff3a149eea3514d02&chksm=bd2917e18a5e9ef76e03ac3d553735cbd84906db62c12f7aa793ef650523a8c511482b3a396b&mpshare=1&scene=1&srcid=0628eTwE5R9A4PVPsiIP2pe4&key=f57fc7001c9b61fa7fee4dd2867dee38ab8d7cca6cb4fe19d9292fbeec204253bdbba922f416f6afc9d21322e617cf2ea2c34d104a91696d40e232ef3486cdc97d8ffc7f5064045b7ae76556f420dfb9&ascene=0&uin=MTY4MjU5MTQwNQ%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.12+build(16A323)&version=12020010&nettype=WIFI&fontScale=100&pass_ticket=uazGxz0UzcDeeRaogHEqiT2r%2FvdWPNo7M9Cyu6M4LtvS8CVcvpjlALN6rRLp0VXT";
    MainBannerDetailViewController *banner =[[MainBannerDetailViewController alloc] init];
    banner.urlStr = url;
    banner.title = @"奔驰到底做了什么";
    [self.supViewController.navigationController pushViewController:banner animated:YES];
}
- (void)selecteImageViewAction:(UITapGestureRecognizer *)tap{
    
    [[self.supViewController rdv_tabBarController] setTabBarHidden:YES];
    
    NSInteger index =tap.view.tag;
    switch (index) {
        case 0:
        {
            BaiKeViewController *baike =[BaiKeViewController new];
            baike.title = @"百科";
            [self.supViewController.navigationController pushViewController:baike animated:YES];
        }
            break;
        case 1:
        {
            ZhuanJiaViewController *zhuanjia =[ZhuanJiaViewController new];
            zhuanjia.title = @"专家";
            [self.supViewController.navigationController pushViewController:zhuanjia animated:YES];
        }
            break;
        case 2:
        {
            JiGouViewController *jigou =[JiGouViewController new];
            jigou.title = @"机构";
            [self.supViewController.navigationController pushViewController:jigou animated:YES];
        }
            break;
        case 3:
        {
            ChanYeViewController *chanye =[ChanYeViewController new];
            chanye.title = @"产业";
            [self.supViewController.navigationController pushViewController:chanye animated:YES];
        }
            break;
        case 4:
        {
            ZhuanFangViewController *baike =[ZhuanFangViewController new];
            baike.title = @"专访";
            [self.supViewController.navigationController pushViewController:baike animated:YES];
        }
            break;
        case 5:
        {
            LunTanViewController *luntan =[LunTanViewController new];
            luntan.title = @"论坛";
            [self.supViewController.navigationController pushViewController:luntan animated:YES];
        }
            break;
        case 6:
        {
            ChangGuoViewController *chengguo =[ChangGuoViewController new];
            chengguo.title = @"成果";
            [self.supViewController.navigationController pushViewController:chengguo animated:YES];
        }
            break;
        case 7:
        {
            MoreMenuViewController *moreMenu =[MoreMenuViewController new];
            moreMenu.title = @"更多";
            [self.supViewController.navigationController pushViewController:moreMenu animated:YES];
        }
            break;
            
        default:
            break;
    }

}
- (NSArray *)imageUrls {
    return @[@"http://a2.att.hudong.com/73/16/01300000165476121211162421024.jpg", @"http://pic8.nipic.com/20100808/4953913_162517044879_2.jpg",@"http://www.taopic.com/uploads/allimg/121214/267863-12121421114939.jpg"];
}

- (UIView *)selecteBottomView{
    if (!_selecteBottomView) {
        _selecteBottomView =[[UIView alloc] init];
        _selecteBottomView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
    }
    return _selecteBottomView;
}






@end
