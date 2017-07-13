//
//  AboutOurViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/27.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "AboutOurViewController.h"


static NSString *AboutListTableViewCellID = @"AboutListTableViewCellID";


@interface AboutOurViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;



@end

@implementation AboutOurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *vi =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.2)];
    vi.backgroundColor =[UIColor whiteColor];
    self.tableView.tableFooterView = vi;
    [self.view addSubview:self.tableView];
    
    [self loadDataSource];
}
- (void)loadDataSource{

    NSArray *dictArr = @[@{@"title":@"",@"detail":@"    智库在线 拟由中国社会科学院、清华大学、北京航空航天大学、中国软件科学研究所、中国国际人才交流基金会联合、和君商学院、智库在线（北京）信息技术研究院共同发起成立。"},
                         @{@"title":@"智库宗旨:",@"detail":@"    以互联网技术为依托，智库在线APP为平台，借众智理念，集天下智慧，基于对专业方向的研究，为政府、企业及产业等相关经济社会组织、团体，提供相关产业智库发展战略的整体解决方案、推动区域经济、相关产业的高速发展。"},
                         @{@"title":@"智库专家:",@"detail":@"    汇集国内外的政界要员、区域经济专家学者、行业精英、国内外文化深入研究者、商界企业家等各类社会精英。"},
                         @{@"title":@"智库职能:",@"detail":@"    主要职能为平台搭建、资源整合、政策解读、咨政建言、战略研判、产业规划、项目对接、金融服务等。"},
                         @{@"title":@"智库目标:",@"detail":@"    推动“十三五”期间区域经济的快速发展，优化产业结构，提高产业市场竞争力，加强供给侧结构性改革，打造区域优势特色产业集群，推动农业产业化，实施“中国制造2025”，促进“养老产业”发展，响应“双创”号召，推进“绿色金融”发展，加快“互联网+”行动，推动地方院校转型升级。"},
                         @{@"title":@"智库下设三个研究中心:",@"detail":@"    “养老产业”研究中心，“双创”研究中心，区域“绿色金融”发展战略研究中心。"},
                         @{@"title":@"",@"detail":@"    根据市场的需求我们提出了打造智库在线产品服务板块，通过智库在线平台给各智库机构之间、政府和企业之间、企业和企业之间形成一个线上的交流、学习、项目对接的互动平台。"}];
    [self.dataSource addObjectsFromArray:dictArr];
    [self.tableView reloadData];

}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)
                                                 style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title =[self.dataSource[indexPath.section] objectForKey:@"detail"];
    CGFloat fl =[title getHeighWithTitle:title font:BWFont(15) width:kScreenW-40];
    return fl+20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section==0 ? kScreenW*0.2 : 32;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        UIView *imgVIew =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*0.2)];
        imgVIew.backgroundColor = [UIColor whiteColor];
        
        UIImageView *iconImg =[[UIImageView alloc] init];
        iconImg.image =[UIImage imageNamed:@"logoImage"];
        [imgVIew addSubview:iconImg];
        [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(kScreenW*0.13/0.53, kScreenW*0.13));
        }];
        return imgVIew;
    }else{
        NSString *title =[self.dataSource[section] objectForKey:@"title"];
        UILabel *vie= [UILabel initWithTitle:[NSString stringWithFormat:@"     %@",title] WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor blackColor] WithFont:15];
        vie.frame= CGRectMake(0, 0, kScreenW, 32);
        vie.backgroundColor =[UIColor whiteColor];
        return vie;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSString *titleStr ;
    UILabel *footerView= [UILabel initWithTitle:titleStr WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor blackColor] WithFont:15];
    footerView.frame= CGRectMake(0, 0, kScreenW, 0.5);
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:AboutListTableViewCellID];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:AboutListTableViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.numberOfLines = 0;
    }
    NSDictionary *dict =self.dataSource[indexPath.section];
    cell.textLabel.text = dict[@"detail"];
    cell.textLabel.font = BWFont(15);
    cell.textLabel.textColor = DetailTextColor;
    
    
    return cell;
}
#pragma mark   选择了某一项
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
