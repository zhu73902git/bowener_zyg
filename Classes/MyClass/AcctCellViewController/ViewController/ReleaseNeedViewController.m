//
//  ReleaseNeedViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ReleaseNeedViewController.h"

#import "ReleaseNeedTableViewCell.h"

@interface ReleaseNeedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *listDataSource;

@end

@implementation ReleaseNeedViewController

static NSString *releaseNeedCellReuseID = @"releaseNeedCellReuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
}

- (void)loadSubViews{
    NSArray *array = @[
                       @{@"question":@"大数据的真正价值在哪里？",@"auswer":@"网络与网络之间所串连成的庞大网络，则可译为“网际”网络，又音译因特网或者英特网，在1990年代发展初期，因其跨国际性连接之特性，在台湾亦有人称其为国际网络，或国际电脑网络。是指在ARPA网基础上发展出的世界上最大的全球性互联网络",@"price":@"10",@"icon":@"zhuanjiaImg1",@"name":@"李江行",@"time":@"2017.06.7 12:20"},
                       @{@"question":@"云计算服务的核心？",@"auswer":@"互联网是指将两台计算机或者是两台以上的计算机终端、客户端、服务端通过计算机信息技术的手段互相联系起来的结果，人们可以与远在千里之外的朋友相互发送邮件、共同完成一项工作、共同娱乐。",@"price":@"20",@"icon":@"zhuanjiaImg2",@"name":@"章玉",@"time":@"2017.06.8 12:20"},
                       @{@"question":@"云计算服务怎样更好的服务于社会？",@"auswer":@"这当然是从技术的角度来定义互联网。这个定义至少揭示了三个方面的内容：首先，互联网是全球性的;其次，互联网上的每一台主机都需要有“地址”;最后，这些主机必须按照共同的规则(协议)连接在一起。",@"price":@"17",@"icon":@"zhuanjiaImg3",@"name":@"何佳期",@"time":@"2017.06.9 12:20"},
                       @{@"question":@"如何做好互联网生态的维护？",@"auswer":@"以让公共用户或者私人用户享受现代计算机信息技术带来的高水平、全方位的服务。这种服务是建立在上述通信及相关的基础设施之上的",@"price":@"100",@"icon":@"zhuanjiaImg4",@"name":@"刘玉",@"time":@"2017.06.10 12:20"}];
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
        [_tableView registerClass:[ReleaseNeedTableViewCell class] forCellReuseIdentifier:releaseNeedCellReuseID];
        
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
    NSString *auswer =dcit[@"auswer"];
    CGFloat fl =[auswer getHeighWithTitle:auswer font:BWFont(13) width:kScreenW-25];
    
    return fl+80;
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
    
    ReleaseNeedTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:releaseNeedCellReuseID forIndexPath:indexPath];
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
