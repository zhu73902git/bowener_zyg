//
//  ZhiKuCnetertableView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhiKuCnetertableView.h"



@interface ZhiKuCnetertableView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) NSMutableArray *centerListData;

@end

@implementation ZhiKuCnetertableView

static NSString *CenterlistReuseID = @"CenterlistReuseID";


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self =[super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadCenterView];
        
        
    }
    return self;
}

- (void)loadCenterView{

    self.delegate = self;
    self.dataSource = self;
    self.showsHorizontalScrollIndicator= NO;
    self.showsVerticalScrollIndicator =NO;
    self.backgroundColor=SelecteCellColor;
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:CenterlistReuseID];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CenterlistReuseID forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (NSMutableArray *)centerListData{
    if (!_centerListData) {
        _centerListData=[NSMutableArray arrayWithCapacity:0];
    }
    return _centerListData;
}







@end
