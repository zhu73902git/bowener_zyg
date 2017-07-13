//
//  VedioDetailTableView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/8.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "VedioDetailTableView.h"

#import "VedioDetailFirstCellTableViewCell.h"
#import "SelecteItemCollectionView.h"
#import "ExpertIntroduceTableViewCell.h"    // 专家介绍

@interface VedioDetailTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *listDataSource;
@property (nonatomic, strong) UIView        *vedioMsgView;  // 视频相关


@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *totalVedioLabel;
@property (nonatomic, strong) UIButton *SubscribeButton;



@end

@implementation VedioDetailTableView

static NSString *VedioDetailFirstCellReuseID= @"VedioDetailFirstCellReuseID";
static NSString *vedioIntroduceCellReuseID= @"vedioIntroduceCellReuseID";


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self =[super initWithFrame:frame style:style];
    if (self) {
        [self loadSubViews];
        
        [self loadVedioMsgView];
        
        [self loadDatas];
    }
    return self;
}

- (void)loadDatas{

    NSArray *arr= @[@[@{@"title":@"张泽",@"detail":@"阿里巴巴董事会委员",@"detail":@"张先生为中国互联网行业的先锋人物，于一九九五年成立中国最早的互联网指南之一 — 中国黄页。于一九九八年至一九九九年间，张先生担任由中国对外经济贸易合作部（「外经贸部」）"},@{@"title":@"课程内容介绍",@"detail":@"网络与网络之间所串连成的庞大网络，则可译为“网际”网络，又音译因特网或者英特网，在1990年代发展初期，因其跨国际性连接之特性，在台湾亦有人称其为国际网络，或国际电脑网络。是指在ARPA网基础上发展出的世界上最大的全球性互联网络。而互联网(英语：international network或internet)，在台湾译作网际网路，或称互连网，即是“连接网络的网络”，可以是任何分离的实体网络之集合，这些网络以一组通用的协定相连，形成逻辑上的单一网络。这种将计算机网络互相联接在一起的方法称为“网络互联”"}],
                    @[@{},@{}]];
    [self.listDataSource addObjectsFromArray:arr];
}


- (void)loadVedioMsgView{

    SelecteItemCollectionView *coll =[[SelecteItemCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.14)];
    [self.vedioMsgView addSubview:coll];
    UIView *lineV =[[UIView alloc] init];
    lineV.backgroundColor = BWColor(100, 100, 110, 1);
    [self.vedioMsgView addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(@0);
        make.height.mas_equalTo(@(0.5));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.bottom.mas_equalTo(@0);
        make.height.mas_equalTo(@(kScreenW*0.12));
    }];
    [self.totalVedioLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(@0);
        make.centerY.mas_equalTo(_priceLabel.mas_centerY).mas_equalTo(@0);
    }];
    [self.SubscribeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.centerY.mas_equalTo(_priceLabel.mas_centerY).mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(66, 25));
    }];
    
    self.tableHeaderView= self.vedioMsgView;

}



- (void)loadSubViews{
    
    self.delegate= self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator =self;
    self.showsHorizontalScrollIndicator = self;
    
    [self registerClass:[VedioDetailFirstCellTableViewCell class] forCellReuseIdentifier:VedioDetailFirstCellReuseID];
    [self registerClass:[ExpertIntroduceTableViewCell class] forCellReuseIdentifier:vedioIntroduceCellReuseID];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.listDataSource[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        NSDictionary *dict =[self.listDataSource objectAtIndex:indexPath.section][indexPath.row];
        NSString *detailStr =[dict objectForKey:@"detail"];
        CGFloat fl =[detailStr getHeighWithTitle:detailStr font:BWFont(14) width:kScreenW-20];
        return fl+55;
    }else
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 15)];
    view.backgroundColor = SelecteCellColor;
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        ExpertIntroduceTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:vedioIntroduceCellReuseID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dict =[self.listDataSource objectAtIndex:indexPath.section][indexPath.row];
        cell.dict = dict;
        return cell;
    }else{
        VedioDetailFirstCellTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:VedioDetailFirstCellReuseID forIndexPath:indexPath];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


}


- (UIView *)vedioMsgView{
    if (!_vedioMsgView) {
        _vedioMsgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.28)];
        _vedioMsgView.backgroundColor =[UIColor whiteColor];
    }
    return _vedioMsgView;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel =[[UILabel alloc] init];
        _priceLabel.textColor = BWColor(35, 160, 97, 1);
        _priceLabel.font = BWFont(14);
        _priceLabel.text = @"订阅价格:500元";
        [self.vedioMsgView addSubview:self.priceLabel];
    }
    return _priceLabel;
}
- (UILabel *)totalVedioLabel{
    if (!_totalVedioLabel) {
        _totalVedioLabel =[[UILabel alloc] init];
        _totalVedioLabel.textAlignment = NSTextAlignmentCenter;
        _totalVedioLabel.textColor = [UIColor blackColor];
        _totalVedioLabel.font = BWFont(12);
        _totalVedioLabel.text = @"共10节内容";
        [self.vedioMsgView addSubview:self.totalVedioLabel];
    }
    return _totalVedioLabel;
}

- (UIButton *)SubscribeButton{
    if (!_SubscribeButton) {
        _SubscribeButton =[UIButton buttonWithType:UIButtonTypeCustom];
        _SubscribeButton.layer.masksToBounds = YES;
        _SubscribeButton.layer.cornerRadius = 6;
        _SubscribeButton.titleLabel.font = BWFont(12);
        _SubscribeButton.layer.borderColor =[UIColor grayColor].CGColor;
        _SubscribeButton.layer.borderWidth = 1;
        [_SubscribeButton setTitle:@"订阅内容" forState:UIControlStateNormal];
        [_SubscribeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_SubscribeButton setTitle:@"已订阅" forState:UIControlStateSelected];
        [_SubscribeButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_SubscribeButton addTarget:self action:@selector(SubscribeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.vedioMsgView addSubview:self.SubscribeButton];
    }
    return _SubscribeButton;
}

- (void)SubscribeButtonAction:(UIButton *)button{
    
    button.selected = !button.isSelected;
    if (button.selected) {
        _SubscribeButton.layer.borderColor =[UIColor redColor].CGColor;
    }else{
        _SubscribeButton.layer.borderColor =[UIColor grayColor].CGColor;
    }
}

- (NSMutableArray *)listDataSource{
    
    if (!_listDataSource) {
        _listDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataSource;

}


@end
