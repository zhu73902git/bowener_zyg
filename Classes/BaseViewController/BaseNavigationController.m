//
//  BaseNavigationController.m
//  
//
//  Created by zhujp on 2017/6/5.
//
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavgation];
}



- (void)setNavgation{
    
    
    //设置NavigationBar背景颜色
    //设置NavigationBar背景颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: tabTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:22.0]}];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:230 / 255.0
//                                                                  green:88 / 255.0
//                                                                   blue:83 / 255.0
//                                                                  alpha:1]];
//    [[UINavigationBar appearance] setTintColor:tabTitleColor];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{
//                                                           NSForegroundColorAttributeName : tabTitleColor
//                                                           }];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{
//                                                           NSFontAttributeName : [UIFont systemFontOfSize:22]}];
//    //不设置这个无法修改状态栏字体颜色
//    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
