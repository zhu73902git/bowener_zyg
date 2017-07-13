//
//  MainViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/5.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MainViewController.h"


#import "MainTableViewHeaderView.h" //toushitu

///  第一组header
#import "FirstSectionHeader.h"

#import "SecendTextTableViewCell.h"     //
#import "SecendVedioTableViewCell.h"    //
#import "MainSearchViewController.h"    // 搜索页面





static NSString *secendTextCellReuseID = @"secendTextCellReuseID";
static NSString *secendVedioCellReuseID = @"secendVedioCellReuseID";


@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *listDataSource;




@end

@implementation MainViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:NO animated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainTableViewHeaderView *mainHeader =[[MainTableViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.90)];
    mainHeader.supViewController = self;    // 将控制器赋值  子视图直接处理事件
    self.tableView.tableHeaderView = mainHeader;
    
    [self.view addSubview:self.tableView];
    
    [self setNavigation];
    [self loadMainListData];
    
     NSArray *array = [[NSArray alloc] init];
}

- (void)setNavigation{
    UIButton *searchButton =[UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame= CGRectMake(0, 0, 35, 35);
    [searchButton setImage:[UIImage imageNamed:@"searchImage"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(beginSearchAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:searchButton];

}
#pragma mark   搜索
- (void)beginSearchAction:(UIButton *)button{

    MainSearchViewController *search =[[MainSearchViewController alloc] init];
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:search];
    [self presentViewController:nav animated:NO completion:^{
        
    }];
    
}

#pragma mark   获取数据
- (void)loadMainListData{
    

    NSArray *array = @[@[],@[@{@"icon":@"listTest1",@"title":@"移动互联网是一个机会",@"detail":@"移动互联网改变了我们的生活。对于从业者来说，移动互联网是一个机会同时也是一项挑战，因为在移动互联网时代，",@"type":@"互联网 大数据 金融",@"userIcon":@"zhuanjiaImg1",@"userName":@"丁哲"},
                             @{@"icon":@"listTest2",@"title":@"2013全球移动互联网大会",@"detail":@"获得成功的路径和传统互联网时代并不相同。2013全球移动互联网大会期间，腾讯科技采访多位“过来人”，辑录观点、总结教训，汇成此《移动互联网新6大生存法则》，希望对创业者们有所裨益。",@"type":@"政策 形势 金融",@"userIcon":@"zhuanjiaImg2",@"userName":@"关察"},
                             @{@"icon":@"JiGouListImage9",@"title":@"《移动互联网新6大生存法则》",@"detail":@"腾讯科技采访多位“过来人”，辑录观点、总结教训，汇成此《移动互联网新6大生存法则》，希望对创业者们有所裨益",@"type":@"云计算 网络服务",@"userIcon":@"zhuanjiaImg3",@"userName":@"刘毅"}],
                       @[@{@"title":@"最新政策解析",@"icon":@"vedioImg2",@"detail":@"",@"userIcon":@"zhuanjiaImg2",@"userName":@"关埔照"},
                         @{@"title":@"云计算服务的深入探究",@"icon":@"vedioImg1",@"detail":@"",@"userIcon":@"zhuanjiaImg2",@"userName":@"王季乐"}]];
    [self.listDataSource addObjectsFromArray:array];
//    NSIndexSet *set1 =[[NSIndexSet alloc] initWithIndex:1];
//    NSIndexSet *set2 =[[NSIndexSet alloc] initWithIndex:2];
//    
//    [self.tableView reloadSections:set1 withRowAnimation:UITableViewRowAnimationNone];
//    [self.tableView reloadSections:set2 withRowAnimation:UITableViewRowAnimationNone];
//    

    [self.tableView reloadData];
}

#pragma mark   tableView
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-49) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator =NO;
        [_tableView registerClass:[SecendTextTableViewCell class] forCellReuseIdentifier:secendTextCellReuseID];
        [_tableView registerClass:[SecendVedioTableViewCell class] forCellReuseIdentifier:secendVedioCellReuseID];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr =self.listDataSource[section];
    
    return arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==1 ? kScreenW*0.28 : kScreenW*0.7;
}
///  sectionHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return kScreenW*0.35;
    } else
    return 35;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        FirstSectionHeader *first =[[FirstSectionHeader alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.35)];
        first.superVC =self;
        return first;
    }else{
        NSArray *titleArr = @[@"热点资讯",@"智库视频"];
        UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
        UILabel *headerTitle =[[UILabel alloc] initWithFrame:CGRectMake(8, 0, kScreenW/2, 35)];
        headerTitle.text = titleArr[section-1];
        headerTitle.font = BWFont(16);
        headerTitle.textColor = [UIColor blackColor];
        [view addSubview:headerTitle];
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 1;
    } else{
        return 15;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.listDataSource[indexPath.section][indexPath.row];
    
    if (indexPath.section==1) {
        SecendTextTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:secendTextCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.dict = dict;
        return cell;
    }else{
        SecendVedioTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:secendVedioCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.dict = dict;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


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
