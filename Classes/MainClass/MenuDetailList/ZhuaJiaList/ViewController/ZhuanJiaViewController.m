//
//  ZhuanJiaViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhuanJiaViewController.h"


#import "ZhuanJiaMenuCollectionViewCell.h"
#import "ABCListCollectionViewCell.h"
#import "ABCModel.h"
#import "ZhuanJiaMenuModel.h"

static NSString *ZhuanJiaMenuCVCellReuseID = @"ZhuanJiaMenuCVCellReuseID";
static NSString *SelecteABCCVCellReuseID = @"SelecteABCCVCellReuseID";

@interface ZhuanJiaViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 内容
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray   *listDataSource;
@property (nonatomic,strong) NSMutableArray   *ABCDataSource;


@end

@implementation ZhuanJiaViewController





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
    NSArray *listArray = @[@{@"icon":@"zhuanjiaImg1",@"name":@"张泽",@"detail":@"中共党员，材料科学晶体结构专家，中国科学院院士。浙江大学材料系教授，浙江大学学术委员会主任。",@"type":@"金融 证券"},
                           @{@"icon":@"zhuanjiaImg3",@"name":@"李江",@"detail":@"管理和处理的数据集合，是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产",@"type":@"大数据 云计算 金融"},
                           @{@"icon":@"zhuanjiaImg2",@"name":@"刘涛",@"detail":@"中国内地影视女演员、歌手。2000年，因出演情景剧《外地媳妇本地郎》进入演艺圈。2003年，凭借古装剧《还珠格格3之天上人间》被观众熟知",@"type":@"投资 理财"},
                           @{@"icon":@"zhuanjiaImg6",@"name":@"李彦宏",@"detail":@"李彦宏，百度公司创始人、董事长兼首席执行官，全面负责百度公司的战略规划和运营管理。李彦宏毕业于北京大学信息管理专业，随后前往美国布法罗纽约州立大学",@"type":@"互联网 金融"},
                           @{@"icon":@"zhuanjiaImg4",@"name":@"李双江",@"detail":@"中国男高音歌唱家，声乐教育家，国家一级演员。河南理工大学音乐学院特聘教授[1]  ，毕业于中央音乐学院",@"type":@"政策分析"},
                           @{@"icon":@"zhuanjiaImg5",@"name":@"马云",@"detail":@" 阿里巴巴集团主要创始人，现担任阿里巴巴集团董事局主席、日本软银董事、大自然保护协会中国理事会主席兼全球董事会成员",@"type":@"互联网 大佬"},
                           @{@"icon":@"zhuanjiaImg7",@"name":@"马化腾",@"detail":@"腾讯公司主要创办人之一，现担任腾讯公司控股董事会主席兼首席执行官；全国青联副主席。",@"type":@"科技 企业"},
                           @{@"icon":@"zhuanjiaImg8",@"name":@"王健林",@"detail":@"大连万达集团股份有限公司董事长至今。中共十七大代表、第十一届全国政协常委、第十一届全国工商联副主席。",@"type":@"实体经济 政策"},
                           @{@"icon":@"zhuanjiaImg1",@"name":@"张泽",@"detail":@"中共党员，材料科学晶体结构专家，中国科学院院士。浙江大学材料系教授，浙江大学学术委员会主任。",@"type":@"金融 证券"},
                           @{@"icon":@"zhuanjiaImg2",@"name":@"刘涛",@"detail":@"中国内地影视女演员、歌手。2000年，因出演情景剧《外地媳妇本地郎》进入演艺圈。2003年，凭借古装剧《还珠格格3之天上",@"type":@"投资 理财"},
                           @{@"icon":@"zhuanjiaImg6",@"name":@"李彦宏",@"detail":@"李彦宏，百度公司创始人、董事长兼首席执行官，全面负责百度公司的战略规划和运营管理。李彦宏毕业于北京大学信息管理专业，随后前往美国布法罗纽约州立大学",@"type":@"互联网 金融",@"type":@"互联网 金融"},
                           @{@"icon":@"zhuanjiaImg4",@"name":@"李双江",@"detail":@"中国男高音歌唱家，声乐教育家，国家一级演员。河南理工大学音乐学院特聘教授[1]  ，毕业于中央音乐学院",@"type":@"政策分析"},
                           @{@"icon":@"zhuanjiaImg5",@"name":@"马云",@"detail":@" 阿里巴巴集团主要创始人，现担任阿里巴巴集团董事局主席、日本软银董事、大自然保护协会中国理事会主席兼全球董事会成员",@"type":@"互联网 大佬"},
                           @{@"icon":@"zhuanjiaImg7",@"name":@"马化腾",@"detail":@"腾讯公司主要创办人之一，现担任腾讯公司控股董事会主席兼首席执行官；全国青联副主席。",@"type":@"科技 企业"},
                           @{@"icon":@"zhuanjiaImg8",@"name":@"王健林",@"detail":@"大连万达集团股份有限公司董事长至今。中共十七大代表、第十一届全国政协常委、第十一届全国工商联副主席。",@"type":@"实体经济 政策"},
                           @{@"icon":@"zhuanjiaImg4",@"name":@"李双江",@"detail":@"中国男高音歌唱家，声乐教育家，国家一级演员。河南理工大学音乐学院特聘教授[1]  ，毕业于中央音乐学院",@"type":@"政策分析"},];

    for (NSDictionary *dict in listArray) {
        ZhuanJiaMenuModel *model =[[ZhuanJiaMenuModel alloc] init];
        model.iconImage = dict[@"icon"];
        model.name =  dict[@"name"];
        model.type =  dict[@"type"];
        model.detail = dict[@"detail"];
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
        
        [_collectionView registerClass:[ZhuanJiaMenuCollectionViewCell class] forCellWithReuseIdentifier:ZhuanJiaMenuCVCellReuseID];
        [_collectionView registerClass:[ABCListCollectionViewCell class] forCellWithReuseIdentifier:SelecteABCCVCellReuseID];
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
        return CGSizeMake(kScreenW-1, kScreenW/4);
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        ABCListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SelecteABCCVCellReuseID forIndexPath:indexPath];
        ABCModel *model = self.ABCDataSource[indexPath.row];
        cell.model = model;
        return cell;
    }else{
        ZhuanJiaMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZhuanJiaMenuCVCellReuseID forIndexPath:indexPath];
        ZhuanJiaMenuModel *model =self.listDataSource[indexPath.row];
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
        
        ZhuanJiaDetailViewController *detail =[ZhuanJiaDetailViewController new];
        ZhuanJiaMenuModel *model =self.listDataSource[indexPath.row];
        detail.title = [NSString stringWithFormat:@"专家-%@",model.name];
        detail.name = model.name;
        detail.icon = model.iconImage;
        [self.navigationController pushViewController:detail animated:YES];

        
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
