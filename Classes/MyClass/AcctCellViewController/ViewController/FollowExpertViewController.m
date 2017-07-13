//
//  FollowExpertViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "FollowExpertViewController.h"
#import "FollowExpertTableViewCell.h"



@interface FollowExpertViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *listDataSource;



@end

@implementation FollowExpertViewController

static NSString *FollowExpertCellReuseID = @"FollowExpertCellReuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadSUbViews];
}

- (void)loadSUbViews{
    
    NSArray *array = @[@{@"icon":@"zhuanjiaImg1",@"name":@"张泽",@"type":@"金融 证券",@"position":@"马尔康集团董事"},
                       @{@"icon":@"zhuanjiaImg3",@"name":@"李江",@"type":@"大数据 云计算 金融",@"position":@"360大数据专家"},
                       @{@"icon":@"zhuanjiaImg2",@"name":@"刘涛",@"type":@"投资 理财",@"position":@"京东金融金融部总监"},
                       @{@"icon":@"zhuanjiaImg6",@"name":@"李彦宏",@"type":@"互联网 金融",@"position":@"百度首席执行官"}];
    [self.listDataSource addObjectsFromArray:array];
    [self.view addSubview:self.tableView];
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator =NO;
        [_tableView registerClass:[FollowExpertTableViewCell class] forCellReuseIdentifier:FollowExpertCellReuseID];
        
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listDataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenW*0.20;
}
///  sectionHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 25)];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FollowExpertTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:FollowExpertCellReuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict =self.listDataSource[indexPath.row];
    cell.dict = dict;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict =self.listDataSource[indexPath.row];

    ZhuanJiaDetailViewController *zhuanjai =[[ZhuanJiaDetailViewController alloc] init];
    zhuanjai.title = [NSString stringWithFormat:@"专家-%@",dict[@"name"]];
    zhuanjai.icon = dict[@"icon"];
    zhuanjai.name = dict[@"name"];
    [self.navigationController pushViewController:zhuanjai animated:YES];
    
}


- (NSMutableArray *)listDataSource{
    if (!_listDataSource) {
        _listDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataSource;
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
