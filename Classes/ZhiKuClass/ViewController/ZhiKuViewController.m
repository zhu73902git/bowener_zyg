//
//  ZhiKuViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/5.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhiKuViewController.h"

#import "ZhiKuSelecteListTableView.h"   // 选择列表
#import "ZhiKuCnetertableView.h"        // 中间视图

@interface ZhiKuViewController ()

@end

@implementation ZhiKuViewController


{
    ZhiKuSelecteListTableView *zhikuSelecte;
    ZhiKuCnetertableView      *CenterTableView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SelecteCellColor;
    [self setnavigationItem];
    [self loadLeftSlecteTableView];
    [self loadCenterListTableView];
    
}
#pragma mark  左侧选择列表
- (void)loadLeftSlecteTableView{
    
    zhikuSelecte =[[ZhiKuSelecteListTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW*0.25, kScreenH-49) style:UITableViewStylePlain];
    [self.view addSubview:zhikuSelecte];

}

#pragma mark  中间列表视图库

- (void)loadCenterListTableView{

    CenterTableView =[[ZhiKuCnetertableView alloc] initWithFrame:CGRectMake(kScreenW*0.25+1, 64, kScreenW*0.75-1, kScreenH-49-64) style:UITableViewStylePlain];
    [self.view addSubview:CenterTableView];
}

- (void)setnavigationItem{
    
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"zhikuNavRightItem"]
                                                            style:UIBarButtonItemStyleDone
                                                           target:self
                                                           action:@selector(changeSelecteType)];
    self.navigationItem.rightBarButtonItem =item;

}
#pragma mark  内容筛选  专家筛选
- (void)changeSelecteType{
    

}




@end
