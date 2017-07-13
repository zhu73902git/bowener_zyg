//
//  JoinActiveViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "JoinActiveViewController.h"

#import "JoinActiveTableViewCell.h"

@interface JoinActiveViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *listDataSource;

@end

@implementation JoinActiveViewController


static NSString *JoinActiveCellReuseID = @"JoinActiveCellReuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSArray *array = @[@{@"title":@"圣世奇想创投活动(二)",@"detail":@"是集前期项目开发、拍摄制作和投资于一体的影视娱乐公司。公司投资与开发制作并行，拥有经验丰富的海内外制片团队，现已打通影视制作全流程。曾参与制作《画皮2》、《饥饿游戏3：嘲笑鸟》、《一步之遥》以及《寻龙诀》等多部作品。",@"name":@"举办方:波纹APP 圣世互娱",@"address":@"北京市朝阳区国贸29号",@"time":@"2017.06.12 11:10",@"price":@"免费",@"state":@"活动筹办中"},
                       @{@"title":@"圣世奇想创投活动(一)",@"detail":@"是集前期项目开发、拍摄制作和投资于一体的影视娱乐公司。公司投资与开发制作并行，拥有经验丰富的海内外制片团队，现已打通影视制作全流程。曾参与制作《画皮2》、《饥饿游戏3：嘲笑鸟》、《一步之遥》以及《寻龙诀》等多部作品。",@"name":@"举办方:波纹APP 圣世互娱",@"address":@"北京市朝阳区国贸29号",@"time":@"2017.06.11 11:10",@"price":@"报名费:100元",@"state":@"活动举行中"}];
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
        [_tableView registerClass:[JoinActiveTableViewCell class] forCellReuseIdentifier:JoinActiveCellReuseID];
        
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
    NSDictionary *dcit =[self.listDataSource objectAtIndex:indexPath.row];
    NSString *auswer =dcit[@"detail"];
    CGFloat fl =[auswer getHeighWithTitle:auswer font:BWFont(13) width:kScreenW-25];
    return fl+110;

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
    if (section==0) {
        return 1;
    }else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JoinActiveTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:JoinActiveCellReuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict =self.listDataSource[indexPath.row];
    cell.dict = dict;
    
    return cell;
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
