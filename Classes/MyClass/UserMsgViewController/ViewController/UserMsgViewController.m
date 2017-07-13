//
//  UserMsgViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "UserMsgViewController.h"

#import "UserMsgListTableViewCell.h"

@interface UserMsgViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *listDataSource;

@end

@implementation UserMsgViewController


static NSString  *UserMsgListCellReuseID = @"UserMsgListCellReuseID";


- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.3)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iconImg =[[UIImageView alloc] init];
    iconImg.image = [UIImage imageNamed:@"listTest1"];
    iconImg.layer.masksToBounds = YES;
    iconImg.layer.cornerRadius = kScreenW*0.09;
    iconImg.layer.borderColor =SelecteCellColor.CGColor;
    iconImg.layer.borderWidth = 1.6;
    [headerView addSubview:iconImg];
    
    [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.18, kScreenW*0.18));
    }];
    
    self.tableView.tableHeaderView = headerView;
    
    [self.view addSubview:self.tableView];
    
    [self loadDatas];
    
}


- (void)loadDatas{
    NSArray *dataArr =@[@[@{@"icon":@"acctIcon1",@"title":@"昵称",@"detail":@"乐百氏纯净水"},
                          @{@"icon":@"acctIcon2",@"title":@"手机",@"detail":@"177****2129"},
                          @{@"icon":@"acctIcon3",@"title":@"真实姓名",@"detail":@"张泽一"},
                          @{@"icon":@"acctIcon4",@"title":@"身份证",@"detail":@"****0219"}],
                        @[@{@"icon":@"wechat",@"title":@"微信",@"detail":@"已绑定"},
                          @{@"icon":@"QQ",@"title":@"QQ",@"detail":@"未绑定"},
                          @{@"icon":@"weibo",@"title":@"微博",@"detail":@"未绑定"}]];
    [self.listDataSource addObjectsFromArray:dataArr];
    
    [self.tableView reloadData];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator =NO;
        [_tableView registerClass:[UserMsgListTableViewCell class] forCellReuseIdentifier:UserMsgListCellReuseID];
        
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
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *titleArr = @[@"基本资料",@"第三方登录"];
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenW/2, 30)];
    label.textColor = BWColor(30, 30, 30, 1);
    label.text = titleArr[section];
    label.font = BWFont(15);
    [view addSubview:label];
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
    
    UserMsgListTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:UserMsgListCellReuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict = self.listDataSource[indexPath.section][indexPath.row];
    cell.dict = dict;

    return cell;
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
