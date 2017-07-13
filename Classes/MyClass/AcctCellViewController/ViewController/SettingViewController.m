//
//  SettingViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SettingViewController.h"

#import "AboutOurViewController.h"

#import "SetOhterViewController.h"



static NSString *SetListTableViewCellID = @"SetListTableViewCellID";

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) UIView *footerView;




@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadListData];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = self.footerView;
    
    
}
#pragma mark  加载数据
- (void)loadListData{
    
    NSArray *array = @[@[@{@"icon":@"",@"title":@"安全中心"},
                         @{@"icon":@"",@"title":@"推送通知"},
                         @{@"icon":@"",@"title":@"修改密码"},
                         @{@"icon":@"",@"title":@"清理缓存"}],
                       @[@{@"icon":@"",@"title":@"使用帮助"},
                         @{@"icon":@"",@"title":@"关于我们"},
                         @{@"icon":@"",@"title":@"当前版本"}]];
    [self.dataSource addObjectsFromArray:array];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)
                                                 style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataSource[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==2 ? kScreenW*0.14 : kScreenW*0.12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return kScreenW*0.05;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *vie= [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.05)];
    vie.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return vie;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.6;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0.6)];
    footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:SetListTableViewCellID];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SetListTableViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dict =self.dataSource[indexPath.section][indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"  %@",dict[@"title"]];
    cell.textLabel.font = BWFont(15);
    
    if (indexPath.section==1 && indexPath.row == 2) {
        cell.detailTextLabel.text = @"1.2";
    }else{
        cell.detailTextLabel.text = nil;
    }
    
    return cell;
}
#pragma mark   选择了某一项
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger sec = indexPath.section;
    NSUInteger row = indexPath.row;
    if (sec==0) {
        SetOhterViewController *other =[[SetOhterViewController alloc] init];
        NSDictionary *dict =self.dataSource[sec][row];
        other.title = dict[@"title"];
        [self.navigationController pushViewController:other animated:YES];
    }else if (sec==1){
        if (row==1) {
            AboutOurViewController *about =[[AboutOurViewController alloc] init];
            about.title = @"关于我们";
            [self.navigationController pushViewController:about animated:YES];
        }else{
            SetOhterViewController *other =[[SetOhterViewController alloc] init];
            NSDictionary *dict =self.dataSource[sec][row];
            other.title = dict[@"title"];
            [self.navigationController pushViewController:other animated:YES];
        }
    
    }
}

- (UIView *)footerView{
    if (!_footerView) {
        _footerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.26)];
        _footerView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        UIButton *but =[[UIButton alloc] initWithFrame:CGRectMake(0, kScreenW*0.15, kScreenW, kScreenW*0.13)];
        but.backgroundColor = [UIColor whiteColor];
        [but setTitle:@"退出登录" forState:UIControlStateNormal];
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        but.titleLabel.font = BWFont(18);
        [_footerView addSubview:but];
        
    }
    return _footerView;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
