//
//  MyClassViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/5.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MyClassViewController.h"

#import "AcctHeaderView.h"

#import "ReleaseNeedViewController.h"       // 发布的需求
#import "FollowExpertViewController.h"      // 关注的专家
#import "JoinActiveViewController.h"        // 参加的活动
#import "SubscribeVedioViewController.h"    // 订阅的视频
#import "MyAnswerViewController.h"          // 回答的问题
#import "ReleaseVedioViewController.h"      // 发布的视频

#import "FeedbackViewController.h"  // 意见反馈
#import "SettingViewController.h"   // 设置


@interface MyClassViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *listDataSource;

@end

@implementation MyClassViewController

static NSString *acctListCellReuseID = @"acctListCellReuseID";


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    RDVTabBarController *rdv =[self rdv_tabBarController];
    [rdv setTabBarHidden:NO animated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AcctHeaderView *mainHeader =[[AcctHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.5)];
    mainHeader.supVC = self;
    self.tableView.tableHeaderView = mainHeader;
    
    [self.view addSubview:self.tableView];
    
    [self loadDatas];
    
}
- (void)loadDatas{
    NSArray *dataArr =@[@[@{@"icon":@"acctIcon1",@"title":@"发布的需求",@"detail":@"1"},
                          @{@"icon":@"acctIcon2",@"title":@"关注的专家",@"detail":@"2"},
                          @{@"icon":@"acctIcon3",@"title":@"参加的活动",@"detail":@"0"},
                          @{@"icon":@"acctIcon4",@"title":@"订阅的视频",@"detail":@"1"}],
                        @[@{@"icon":@"acctIcon7",@"title":@"我的回答",@"detail":@"1"},
                          @{@"icon":@"acctIcon8",@"title":@"发布的视频",@"detail":@"1"}],
                        @[@{@"icon":@"acctIcon5",@"title":@"意见反馈",@"detail":@""},
                          @{@"icon":@"acctIcon6",@"title":@"设 置",@"detail":@""}]];
    [self.listDataSource addObjectsFromArray:dataArr];
    [self.tableView reloadData];

}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-49) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator =NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:acctListCellReuseID];
        
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.listDataSource objectAtIndex:section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}
///  sectionHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 25)];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return 15;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:acctListCellReuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict =self.listDataSource[indexPath.section][indexPath.row];
    cell.imageView.image =[UIImage imageNamed:dict[@"icon"]];
    cell.textLabel.text = dict[@"title"];
    cell.textLabel.font = BWFont(15);
    cell.detailTextLabel.text = dict[@"detail"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RDVTabBarController *rdv =[self rdv_tabBarController];
    [rdv setTabBarHidden:YES animated:YES];
    if (indexPath.section==0) {
        
        switch (indexPath.row) {
            case 0:
            {
                ReleaseNeedViewController *need =[ReleaseNeedViewController new];
                need.title = @"发布的需求";
                [self.navigationController pushViewController:need animated:YES];
            }
                break;
            case 1:
            {
                FollowExpertViewController *follow =[FollowExpertViewController new];
                follow.title = @"关注的专家";
                [self.navigationController pushViewController:follow animated:YES];
            }
                break;
                
            case 2:
            {
                JoinActiveViewController *join =[JoinActiveViewController new];
                join.title = @"参加的活动";
                [self.navigationController pushViewController:join animated:YES];
            }
                break;
                
            case 3:
            {
                SubscribeVedioViewController *subS =[SubscribeVedioViewController new];
                subS.title = @"订阅的视频";
                [self.navigationController pushViewController:subS animated:YES];
            }
                break;
                
            default:
                break;
        }
        
    }else if (indexPath.section==1){
        switch (indexPath.row) {
            case 0:
            {
                MyAnswerViewController *need =[MyAnswerViewController new];
                need.title = @"我的回答";
                [self.navigationController pushViewController:need animated:YES];
            }
                break;
            case 1:
            {
                ReleaseVedioViewController *subS =[ReleaseVedioViewController new];
                subS.title = @"发布的视频";
                [self.navigationController pushViewController:subS animated:YES];
            }
                break;

                
            default:
                break;
        }
        
    } else if(indexPath.section==2){
    
        switch (indexPath.row) {
            case 0:
            {
                FeedbackViewController *feed =[FeedbackViewController new];
                feed.title = @"意见反馈";
                [self.navigationController pushViewController:feed animated:YES];
            }
                break;
            case 1:
            {
                SettingViewController *set =[SettingViewController new];
                set.title = @"设 置";
                [self.navigationController pushViewController:set animated:YES];
            }
                break;

            default:
                break;
        }
    }
    
}

- (NSMutableArray *)listDataSource{

    if (!_listDataSource) {
        _listDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataSource;
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}






@end
