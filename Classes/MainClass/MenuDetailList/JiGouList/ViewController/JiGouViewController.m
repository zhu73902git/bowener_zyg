//
//  JiGouViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "JiGouViewController.h"



#import "ABCModel.h"
#import "ABCListCollectionViewCell.h"

#import "JiGouListModel.h"
#import "JiGouListCollectionViewCell.h"

#import "JiGouDetailViewController.h"


static NSString *JiGouListCVCellReuseID = @"JiGouListCVCellReuseID";
static NSString *SelecteJiGouABCCVCellReuseID = @"SelecteJiGouABCCVCellReuseID";




@interface JiGouViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 内容
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray   *listDataSource;
@property (nonatomic,strong) NSMutableArray   *ABCDataSource;


@end

@implementation JiGouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.collectionView];
    [self loadData];
    
}


- (void)loadData{
    
    ///  选择栏
    //A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    NSArray *list = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    for (NSString *str in list) {
        ABCModel *model =[[ABCModel alloc] init];
        model.title = str;
        model.bol = NO;
        [self.ABCDataSource addObject:model];
    }
    ///  列表数据
    NSArray *listArray = @[@{@"icon":@"JiGouListImage1",@"name":@"上海北广股权投资基金管理有限",@"type":@"上海北广股权投资基金管理有限公司作为本基金的基金管理人,将恪尽职守、诚实信用、",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage2",@"name":@"国家互联网信息办公室",@"type":@"维护互联网信息内容传播秩序,国家互联网信息办公室在广泛调研、征求吸收业界专家等",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage3",@"name":@"上海涌浦金融",@"type":@"上海涌利金融信息服务有限公司,是一家独立运营的金融服务企业,公司成立于2014年,并于同年7月获得中国基金业协会私募基金投资管理",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage4",@"name":@"中国互联网络信息中心",@"type":@"五星级注册服务机构 资源导航 中文域名邮箱注册平台 国家物联网标识管理公共服务平台.",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage5",@"name":@"商赢金融（大元财富）",@"type":@"商赢金服(www.sy8.com)是商赢集团旗下重点打造的投融资一键式智能平台。公司以先进的金融科技体系,成熟的服务管理理念",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage6",@"name":@"中国互联网协会",@"type":@"互联网新闻信息服务管理规定 陈肇雄会见互联网名称和数字地址分配机构总裁兼首席执行",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage7",@"name":@"上海徽富金融信息服务有限公司",@"type":@"徽富金融信息服务有限公司是一家专业的投资置业公司,以自有资金对房地产项目,科技项目,能源项目,金融公司进行投资管理,同时又将金融资金进行运转流动",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage8",@"name":@"北京市质量技术监督局",@"type":@"企业产品标准自我声明公开如何办理? 计量认证对消防检测机构的技术主管和授权签字",@"Authentication":@"1"},
                           @{@"icon":@"JiGouListImage9",@"name":@"正规公司贷款投资理财",@"type":@"北京正规贷款公司公司,十年行业经验,与20多家银行合作,一站式,的服务,为您量身定制低息高额贷款方案.还有更多贷后增值服务等着您",@"Authentication":@"1"},];
    
    for (NSDictionary *dict in listArray) {
        JiGouListModel *model =[[JiGouListModel alloc] init];
        model.icon = dict[@"icon"];
        model.name =  dict[@"name"];
        model.type =  dict[@"type"];
        model.bol  =  [dict[@"Authentication"] boolValue];
        [self.listDataSource addObject:model];
    }
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        [_collectionView registerClass:[JiGouListCollectionViewCell class] forCellWithReuseIdentifier:JiGouListCVCellReuseID];
        [_collectionView registerClass:[ABCListCollectionViewCell class] forCellWithReuseIdentifier:SelecteJiGouABCCVCellReuseID];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //return self.listDataSource.count;
    return section==0 ? self.ABCDataSource.count :self.listDataSource.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout =[[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(1, 0, 1, 0);
        // 设置间距
        _flowLayout.minimumLineSpacing = 0.5;
        _flowLayout.minimumInteritemSpacing = 0.5;
        // 设置滚动方向（默认垂直滚动）
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        // _flowLayout.itemSize = CGSizeMake(kScreenW/3-0.5, kScreenW/3);
        
    }
    return _flowLayout;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(kScreenW/13-0.5, kScreenW/13);
    }else{
        return CGSizeMake(kScreenW-0.5, kScreenW/4);
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        ABCListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SelecteJiGouABCCVCellReuseID forIndexPath:indexPath];
        ABCModel *model = self.ABCDataSource[indexPath.row];
        cell.model = model;
        return cell;
    }else{
        JiGouListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JiGouListCVCellReuseID forIndexPath:indexPath];
        JiGouListModel *model =self.listDataSource[indexPath.row];
        cell.model = model;
        return cell;
    }
}

#pragma mark --------  选择了item 某个波纹
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        ///  刷新 UI
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            for (ABCModel *model in self.ABCDataSource) {
                if (model.bol) {
                    model.bol = NO;
                }
            }
            ABCModel *model =[self.ABCDataSource objectAtIndex:indexPath.row];
            model.bol= YES;
            NSIndexSet *set =[[NSIndexSet alloc] initWithIndex:0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadSections:set];
            });
        });
    }else{
        
        JiGouDetailViewController *jigou = [[JiGouDetailViewController alloc] init];
        JiGouListModel *model =self.listDataSource[indexPath.row];
        jigou.title = model.name;
        [self.navigationController pushViewController:jigou animated:YES];
        
    }
    
}

- (NSMutableArray *)listDataSource{
    if (!_listDataSource) {
        _listDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataSource;
}
- (NSMutableArray *)ABCDataSource{
    if (!_ABCDataSource) {
        _ABCDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _ABCDataSource;
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
