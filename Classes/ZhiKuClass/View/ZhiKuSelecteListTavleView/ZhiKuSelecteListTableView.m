//
//  ZhiKuSelecteListTableView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhiKuSelecteListTableView.h"


#import "ZhiKuSelecteListModel.h"
#import "ZhiKuSelecteListTableViewCell.h"

@interface ZhiKuSelecteListTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *listData;


@end

@implementation ZhiKuSelecteListTableView

static NSString *listReuseID = @"listReuseID";

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator= NO;
        self.showsVerticalScrollIndicator =NO;
        self.backgroundColor=SelecteCellColor;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[ZhiKuSelecteListTableViewCell class] forCellReuseIdentifier:listReuseID];
        
        [self loadListData];
    }
    return self;
}

- (void)loadListData{

    NSArray *selArr =@[@{@"title":@"智库推荐",@"typeString":@"",@"bol":@"1"},
                       @{@"title":@"互联网",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"大数据",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"云计算",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"金融交易",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"投资理财",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"政策分析",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"企业法律",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"创业指导",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"企业规划",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"市场分析",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"教育咨询",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"生态产业",@"typeString":@"",@"bol":@"0"},
                       @{@"title":@"融资推展",@"typeString":@"",@"bol":@"0"},
                       ];

    for (NSDictionary *dict in selArr) {
        ZhiKuSelecteListModel *model =[[ZhiKuSelecteListModel alloc] init];
        model.title = dict[@"title"];
        model.typeString = dict[@"typeString"];
        model.bol= [dict[@"bol"] boolValue];
        [self.listData addObject:model];
    }
    
    [self reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhiKuSelecteListTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:listReuseID forIndexPath:indexPath];
    ZhiKuSelecteListModel *model =[self.listData objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ZhiKuSelecteListModel *mod =[self.listData objectAtIndex:indexPath.row];
    
    for (ZhiKuSelecteListModel *model in self.listData) {
        if (model == mod) {
            model.bol = YES;
        }else{
            model.bol = NO;
        }
    }
    [self reloadData];
}

- (NSMutableArray *)listData{
    if (!_listData) {
        _listData=[NSMutableArray arrayWithCapacity:0];
    }
    return _listData;
}





@end
