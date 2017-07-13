//
//  AppDelegate+RootViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/5.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "AppDelegate+RootViewController.h"

#import <RDVTabBarController/RDVTabBarItem.h>



@interface AppDelegate ()<UITabBarControllerDelegate,RDVTabBarControllerDelegate,RDVTabBarDelegate>



@end



@implementation AppDelegate (RootViewController)



- (void)setMainWindow{
    
    UIWindow *window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
}

- (void)setRootViewController{
    
    RDVTabBarController *rdv =[RDVTabBarController new];
    
    MainViewController *main =[[MainViewController alloc] init];
    main.title = @"智库在线";
    FindViewController *find =[[FindViewController alloc] init];
    find.title = @"发现";
    QuestionViewController *question =[[QuestionViewController alloc] init];
    question.title = @"问答";
    ZhiKuViewController *zhiku =[[ZhiKuViewController alloc] init];
    zhiku.title = @"智库";
    MyClassViewController *myclass =[[MyClassViewController alloc] init];
    myclass.title = @"我的";
    
    BaseNavigationController *mainNav =[[BaseNavigationController alloc] initWithRootViewController:main];
    BaseNavigationController *zhikuNav =[[BaseNavigationController alloc] initWithRootViewController:zhiku];
    BaseNavigationController *questionNav =[[BaseNavigationController alloc] initWithRootViewController:question];
    BaseNavigationController *findNav =[[BaseNavigationController alloc] initWithRootViewController:find];
    BaseNavigationController *acctNav =[[BaseNavigationController alloc] initWithRootViewController:myclass];
    ///
    //[rdv setViewControllers:@[main,secend,find,acct]];
    [rdv setViewControllers:@[mainNav,zhikuNav,questionNav,findNav,acctNav]];
    ///
    rdv.delegate = self;
    
    [self customizeTabBarForController:rdv];
    
    //   UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:rdv];
    self.window.rootViewController = rdv;
    
}

#pragma  mark======================== 设置 tabbar 的相关属性
- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbackgroudImage"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbackgroudImage"];
    NSArray *tabBarItemImages = @[@"tab_main",
                                  @"tab_zhiku",
                                  @"tab_question",
                                  @"tab_find",
                                  @"tab_acct"];
    NSArray *selectedImages =  @[@"tab_selmain",
                                 @"tab_selzhiku",
                                 @"tab_selquestion",
                                 @"tab_selfind",
                                 @"tab_selacct"];
    NSArray *titleArray = @[@"主页",@"智库",@"",@"发现",@"我的"];
    
    [[tabBarController tabBar] setTintColor:tabTitleColor];
    NSInteger index = 0;
    [[tabBarController tabBar] setTranslucent:NO];
    [[tabBarController tabBar] setHeight:49.f];
    
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        UIImage *selectedimage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        UIImage *unselectedimage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        NSDictionary *unseleAtrr = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:10],
                                     NSForegroundColorAttributeName: [UIColor grayColor],
                                     };
        NSDictionary *seleAtrr = @{
                                   NSFontAttributeName: [UIFont systemFontOfSize:10],
                                   NSForegroundColorAttributeName: TabRedColor,
                                   };
        [item setUnselectedTitleAttributes:unseleAtrr];
        [item setSelectedTitleAttributes:seleAtrr];
        
        
        [item setTitle:titleArray[index]];
        UIOffset centerOffset = UIOffsetMake(0, 6); // 设置title距离上面的图标的距离
        [item setTitlePositionAdjustment:centerOffset];
        
        index++;
    }
    
}




@end
