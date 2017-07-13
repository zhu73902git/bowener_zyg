//
//  BaiKeViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "BaiKeViewController.h"

#import "BaiKeListModel.h"

#import "BKOnlyTextTableViewCell.h"
#import "BKTextImageTableViewCell.h"
#import "BKVidioTableViewCell.h"
#import "BKPersonTableViewCell.h"

#import "MainSearchViewController.h"


static NSString *textCellReuseID = @"textCellReuseID";
static NSString *textImgCellReuseID = @"textImgCellReuseID";
static NSString *vidioCellReuseID =@"vidioCellReuseID";
static NSString *personCellReuseID =@"personCellReuseID";

@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>


@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UISearchBar    *searchBar;



@end

@implementation BaiKeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.tableHeaderView= self.searchBar;
    [self.view addSubview:self.tableView];
    
    [self loadData];
    
}

#pragma mark   加载数据

- (void)loadData{
    
    NSArray *arr = @[@{@"type":@"textImg",@"title":@"中国互联网协会",@"detail":@"中国产业互联网研究院 • 产业互联网促进中心(上海宝山) • 网络与未来社会研究中心 • 中国互联网电子数据研究院 • 中国互联网协会研究中心",@"userName":@"",@"desc":@"",@"icon":@"JiGouListImage6",@"views":@"",@"comment":@"",@"time":@""},
                     @{@"type":@"text",@"title":@"问：大数据在会展产业中的实际应用是怎么样的？",@"detail":@"答：会展业与大数据结合的话题常被业内提及,但是大数据如何影响和服务于会展业、两者...个人理解会展产业本身基本不怎么生产数据。所以会展产业的大数据应",@"userName":@"",@"desc":@"",@"icon":@"",@"views":@"",@"comment":@"",@"time":@""},
                     @{@"type":@"video",@"title":@"大数据时代带来的大变革-中国青年报",@"detail":@"",@"userName":@"",@"desc":@"",@"icon":@"vedioImg1",@"views":@"1220",@"comment":@"312",@"time":@"2小时前"},
                    @{@"type":@"person",@"title":@"",@"detail":@"管理和处理的数据集合，是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产",@"userName":@"专家: 李宇涛",@"desc":@"大数据 互联网 云计算",@"icon":@"zhuanjiaImg3",@"views":@"",@"comment":@"",@"time":@""},
                     @{@"type":@"textImg",@"title":@"中国互联网信息中心",@"detail":@"中国科学院计算机网络信息中心是中国科学院科研信息化和管理信息化的支撑服务机构,信息化应用技术的研发和示范基地,是中国科学院信息化建设、技术支撑与服务的龙头和...",@"userName":@"",@"desc":@"",@"icon":@"JiGouListImage4",@"views":@"",@"comment":@"",@"time":@""},@{@"type":@"text",@"title":@"问：大数据在会展产业中的实际应用是怎么样的？",@"detail":@"答：会展业与大数据结合的话题常被业内提及,但是大数据如何影响和服务于会展业、两者...个人理解会展产业本身基本不怎么生产数据。所以会展产业的大数据应",@"userName":@"",@"desc":@"",@"icon":@"",@"views":@"",@"comment":@"",@"time":@""},
                     @{@"type":@"video",@"title":@"大数据时代带来的大变革-中国青年报",@"detail":@"",@"userName":@"",@"desc":@"",@"icon":@"vedioImg1",@"views":@"1220",@"comment":@"312",@"time":@"2小时前"},
                     @{@"type":@"person",@"title":@"",@"detail":@"管理和处理的数据集合，是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产",@"userName":@"专家: 李宇涛",@"desc":@"大数据 互联网 云计算",@"icon":@"JiGouListImage5",@"views":@"",@"comment":@"",@"time":@""},
                     @{@"type":@"textImg",@"title":@"中国互联网信息中心",@"detail":@"中国科学院计算机网络信息中心是中国科学院科研信息化和管理信息化的支撑服务机构,信息化应用技术的研发和示范基地,是中国科学院信息化建设、技术支撑与服务的龙头和...",@"userName":@"",@"desc":@"",@"icon":@"JiGouListImage7",@"views":@"",@"comment":@"",@"time":@""}];
    for (NSDictionary *dict in arr) {
        
        BaiKeListModel *model =[BaiKeListModel objectWithDictionary:dict];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
}

- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar =[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 40)];
        _searchBar.placeholder = @"关键字 热词";
        _searchBar.delegate= self;
        _searchBar.backgroundColor = [UIColor whiteColor];
        _searchBar.barTintColor = [UIColor groupTableViewBackgroundColor];
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    }
    return _searchBar;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    MainSearchViewController *search =[[MainSearchViewController alloc] init];
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:search];
    [self presentViewController:nav animated:NO completion:^{
        
    }];
    
    return NO;
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)
                                                 style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        [_tableView registerClass:[BKOnlyTextTableViewCell class] forCellReuseIdentifier:textCellReuseID];
        [_tableView registerClass:[BKTextImageTableViewCell class] forCellReuseIdentifier:textImgCellReuseID];
        [_tableView registerClass:[BKVidioTableViewCell class] forCellReuseIdentifier:vidioCellReuseID];
        [_tableView registerClass:[BKPersonTableViewCell class] forCellReuseIdentifier:personCellReuseID];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 1)];
    view.backgroundColor =[UIColor whiteColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 1)];
    view.backgroundColor =[UIColor whiteColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    BaiKeListModel *model =self.dataSource[row];
    if ([model.type isEqualToString:@"text"]) {
        return kScreenW*0.22;
    }else if ([model.type isEqualToString:@"textImg"]){
        return kScreenW*0.28;
    
    }else if ([model.type isEqualToString:@"video"]){
        return kScreenW*0.7;
        
    }else if ([model.type isEqualToString:@"person"]){
        
        return kScreenW*0.28;
        
    }else{
        
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // text textImg video person
    NSUInteger row = indexPath.row;
    BaiKeListModel *model =self.dataSource[row];
    if ([model.type isEqualToString:@"text"]) {
        BKOnlyTextTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:textCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
    }else if ([model.type isEqualToString:@"textImg"]){
        BKTextImageTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:textImgCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
    
    }else if ([model.type isEqualToString:@"video"]){
        BKVidioTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:vidioCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model= model;
        return cell;
        
    }else if ([model.type isEqualToString:@"person"]){
        BKPersonTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:personCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
    }else{
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        return cell;
    }
    
}



#pragma mark   选择了某一项
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger sec = indexPath.section;
    NSUInteger row = indexPath.row;
   
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
