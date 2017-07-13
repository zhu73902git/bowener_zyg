//
//  ZhuanJiaDetailViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhuanJiaDetailViewController.h"

#import "ExpertHeaderTableViewCell.h"       // 专家基本信息
#import "ExpertIntroduceTableViewCell.h"    // 专家介绍
#import "ExpertVedioTableViewCell.h"        // 专家视频
#import "RecommendExpertTableViewCell.h"    // 推荐专家


@interface ZhuanJiaDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

{
    NSIndexPath *_indexPath;
    XLVideoPlayer *_player;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray    *listDataSource;

@end

@implementation ZhuanJiaDetailViewController

static NSString *HeaderCellReuseID    = @"HeaderCellReuseID";
static NSString *IntroduceCellReuseID = @"IntroduceCellReuseID";
static NSString *VedioCellReuseID     = @"VedioCellReuseID";
static NSString *RecomentCellReuseID  = @"RecomentCellReuseID";



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    [self loadDatas];
}

#pragma mark  加载数据
- (void)loadDatas{
    
    NSArray *dictArr = @[@[@{@"icon":self.icon,
                             @"name":self.name,
                             @"field":@"移动互联网 大数据",
                             @"position":@"阿里巴巴董事会委员"}],
                         @[@{@"title":@"阿里巴巴董事会委员",@"detail":@"张先生为中国互联网行业的先锋人物，于一九九五年成立中国最早的互联网指南之一 — 中国黄页。于一九九八年至一九九九年间，张先生担任由中国对外经济贸易合作部（「外经贸部」）"},
                           @{@"title":@"先后担任职务",@"detail":@"现任阿里巴巴集团董事局主席、中国雅虎董事局主席、杭州师范大学阿里巴巴商学院院长、华谊兄弟传媒集团董事、菜鸟网络董事长等职务。"},
                           @{@"title":@"主要成就",@"detail":@"2003年1~5月：屯河玛纳斯分公司新增2X1500t/d番茄生产线项目\n2004年2~5月：博乐市“家和园“亚中商住小区精品街项目1#,2#5#,6#楼，总建筑面积12283㎡\n2005年11月~2006年1月：昌吉东和实业41号小区7号楼项目。建筑总高49.70米，总建筑面积14500㎡，商住楼，属二类高层。\n2006年5~6月：玛纳斯澳洋科技公司外网工程\n2007年2~5月：中基霍尔果斯分公司日处理番茄2200吨生产线项目"}],
                         @[@{@"title":@"互联网生存法则 (三) 经典视频",@"vedioImg":@"vedioImg1",@"time":@"0:40:10",@"price":@"180.0元",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1705/29/orhJO1646/HD/orhJO1646-mobile.mp4"},
                           @{@"title":@"互联网生存法则 (四) 经典视频",@"vedioImg":@"vedioImg2",@"time":@"0:30:30",@"price":@"180.0元",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1705/29/orhJO1646/HD/orhJO1646-mobile.mp4"},
                           @{@"title":@"互联网生存法则 (五) 经典视频",@"vedioImg":@"vedioImg3",@"time":@"0:40:10",@"price":@"200.0元",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1706/08/wkGUI4146/SD/wkGUI4146-mobile.mp4"}],
                         @[@{@"icon":@"zhuanjiaImg1",@"name":@"赵毅",@"position":@"腾讯金融部总监",@"field":@"领域:互联网 金融"},
                           @{@"icon":@"zhuanjiaImg2",@"name":@"刘品",@"position":@"百度搜索执行总监",@"field":@"领域:互联网 大数据 云计算"},
                           @{@"icon":@"zhuanjiaImg3",@"name":@"李江一",@"position":@"360",@"field":@"领域:云计算 大数据"},
                           @{@"icon":@"zhuanjiaImg4",@"name":@"章海涛",@"position":@"小米执行创意总监",@"field":@"领域:创意 设计 互联网"}]];
    /// http://flv2.bn.netease.com/videolib3/1705/29/orhJO1646/HD/orhJO1646-mobile.mp4
    //http://192.168.0.159/upload/advert/1/2017/06/16/bmw002.mp4
    [self.listDataSource addObjectsFromArray:dictArr];
    
    [self.tableView reloadData];
    
    
}

- (void)fetchVideoListData {
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:videoListUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        //        NSLog(@"%@", responseObject);
//        NSArray *dataArray = responseObject[@"VAP4BFR16"];
//        for (NSDictionary *dict in dataArray) {
//            [self.listDataSource addObject:[XLVideoItem mj_objectWithKeyValues:dict]];
//        }
//        [self.exampleTableView reloadData];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
}



#pragma mark  加载子视图
- (void)loadSubViews{
    
    [self.view addSubview:self.tableView];
    
    UIView *botView =[[UIView alloc] initWithFrame:CGRectMake(0, kScreenH-44, kScreenW, 44)];
    botView.backgroundColor =SelecteCellColor;
    [self.view addSubview:botView];
    NSArray *titleArr = @[@"电话咨询",@"在线约谈"];
    NSArray *iconArr  = @[@"typeIcon1",@"typeIcon2"];
    for (int i=0; i<titleArr.count; i++) {
        UIView *vi =[[UIView alloc] init];
        if (i==0) {
          vi.frame = CGRectMake(0, 0, kScreenW/2-0.4, 44);
        }else{
            vi.frame = CGRectMake(kScreenW/2*i+0.4, 0, kScreenW/2-0.4, 44);
        }
        vi.backgroundColor = [UIColor whiteColor];
        vi.tag = i;
        [botView addSubview:vi];
        
        UIImageView *img =[[UIImageView alloc] init];
        img.image =[UIImage imageNamed:iconArr[i]];
        [vi addSubview:img];
        UILabel *titleLabel =[[UILabel alloc] init];
        titleLabel.text = titleArr[i];
        titleLabel.font = BWFont(15);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [vi addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(@0);
            make.centerX.mas_equalTo(@0);
            make.height.mas_equalTo(@22);
        }];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(@0);
            make.right.mas_equalTo(titleLabel.mas_left).mas_equalTo(@-5);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        
    }

}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-44) style:UITableViewStyleGrouped];
        _tableView.delegate= self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator =NO;
        
        [_tableView registerClass:[ExpertHeaderTableViewCell class] forCellReuseIdentifier:HeaderCellReuseID];
        [_tableView registerClass:[ExpertIntroduceTableViewCell class] forCellReuseIdentifier:IntroduceCellReuseID];
        [_tableView registerClass:[ExpertVedioTableViewCell class] forCellReuseIdentifier:VedioCellReuseID];
        [_tableView registerClass:[RecommendExpertTableViewCell class] forCellReuseIdentifier:RecomentCellReuseID];
        
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [[self.listDataSource objectAtIndex:section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return kScreenW*0.25;
    }else if (indexPath.section==1){
        NSDictionary *dict =[self.listDataSource objectAtIndex:indexPath.section][indexPath.row];
        NSString *detailStr =[dict objectForKey:@"detail"];
        CGFloat fl =[detailStr getHeighWithTitle:detailStr font:BWFont(14) width:kScreenW-20];
        return fl+55;
    }else if (indexPath.section==2){
    
        return kScreenW*0.5+60;
        
    } else
        return kScreenW*0.25;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return  section==0 ? 1 : 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *titleArr = @[@"",@"专家介绍",@"专家课程",@"推荐专家"];
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
    view.backgroundColor = SelecteCellColor;
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenW/2, 35)];
    label.textColor = BWColor(30, 30, 30, 1);
    label.text = titleArr[section];
    label.font = BWFont(16);
    [view addSubview:label];
    return view;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger sec = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (sec==0) {
        ExpertHeaderTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:HeaderCellReuseID forIndexPath:indexPath];
        NSDictionary *dict =self.listDataSource[sec][row];
        cell.dict = dict;
        return cell;
    }else if (sec==1){
        ExpertIntroduceTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:IntroduceCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dict =self.listDataSource[sec][row];
        cell.dict = dict;
        return cell;
    }
    else if (sec==2){
        ExpertVedioTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:VedioCellReuseID forIndexPath:indexPath];
        [cell videoCellWithTableView:tableView WithIndexPath:indexPath];
        __weak typeof(self) weakSelf =self;
        cell.block = ^(NSIndexPath *indexP){
            [weakSelf openVedioAtion:indexP];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dict =self.listDataSource[sec][row];
        
        cell.dict = dict;
        return cell;
    }
    else if (sec==3){
        RecommendExpertTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:RecomentCellReuseID forIndexPath:indexPath];
        NSDictionary *dict =self.listDataSource[sec][row];
        cell.dict = dict;
        return cell;
    }else{
    
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
        
        return cell;
    }
}
- (void)openVedioAtion:(NSIndexPath *)indexPath{
    [_player destroyPlayer];
    _player = nil;
    
    NSDictionary *item = self.listDataSource[indexPath.section][indexPath.row];
    
    _indexPath = indexPath;
    ExpertVedioTableViewCell *cell = [self.tableView cellForRowAtIndexPath:_indexPath];
    
    _player = [[XLVideoPlayer alloc] init];

    _player.videoUrl = item[@"vedioUrl"];
    [_player playerBindTableView:self.tableView currentIndexPath:_indexPath];
    _player.frame = CGRectMake(5, 35, kScreenW-10, kScreenW*0.5);
    
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(XLVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        NSDictionary *dict = self.listDataSource[indexPath.section][indexPath.row];
        VideoDetailViewController *videoDetailViewController = [[VideoDetailViewController alloc] init];
        videoDetailViewController.videoTitle = dict[@"title"];
        videoDetailViewController.mp4_url = dict[@"vedioUrl"];
        [self.navigationController pushViewController:videoDetailViewController animated:YES];
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.tableView]) {
        
        [_player playerScrollIsSupportSmallWindowPlay:NO];
    }
}

- (NSMutableArray *)listDataSource{
    if (!_listDataSource) {
        _listDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataSource;
}


- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    [_player destroyPlayer];
    _player = nil;
}



@end
