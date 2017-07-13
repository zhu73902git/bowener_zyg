//
//  ChanYeViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ChanYeViewController.h"

#import "ChanYeListModel.h"
#import "ChanYeListCollectionViewCell.h"

#import "ChanYeDetailViewController.h"

static NSString *ChanYeListCVCellReuseID = @"ChanYeListCVCellReuseID";
static NSString *ChanYeSectionOneVCReViewID = @"ChanYeSectionOneVCReViewID";
static NSString *ChanYeSectionFooterReViewID= @"ChanYeSectionFooterReViewID";

@interface ChanYeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 内容
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray   *listDataSource;
@property (nonatomic,strong) NSMutableArray   *ABCDataSource;



@end

@implementation ChanYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    [self loadListData];
}


- (void)loadListData{
    
    NSArray *array = @[@{@"icon":@"list21",@"title":@"金融",@"id":@"1"},
                       @{@"icon":@"list22",@"title":@"养老",@"id":@"1"},
                       @{@"icon":@"list23",@"title":@"双创",@"id":@"1"},
                       @{@"icon":@"list24",@"title":@"互联网",@"id":@"1"},
                       @{@"icon":@"list25",@"title":@"教育",@"id":@"1"},
                       @{@"icon":@"list26",@"title":@"房地产",@"id":@"1"},
                       @{@"icon":@"list27",@"title":@"矿产",@"id":@"1"},
                       @{@"icon":@"list28",@"title":@"文化",@"id":@"1"},
                       @{@"icon":@"list5",@"title":@"影视",@"id":@"1"},
                       @{@"icon":@"list29",@"title":@"音乐",@"id":@"1"},
                       @{@"icon":@"list31",@"title":@"新能源",@"id":@"1"},
                       @{@"icon":@"list1",@"title":@"智能制造",@"id":@"1"},
                       @{@"icon":@"list6",@"title":@"一带一路",@"id":@"1"},
                       @{@"icon":@"list2",@"title":@"城镇化",@"id":@"1"},
                       @{@"icon":@"list30",@"title":@"生态文明",@"id":@"1"},
                       @{@"icon":@"list4",@"title":@"农业",@"id":@"1"},
                       @{@"icon":@"list9",@"title":@"法律",@"id":@"1"},
                       @{@"icon":@"list10",@"title":@"游戏",@"id":@"1"},
                       @{@"icon":@"list11",@"title":@"化工",@"id":@"1"},
                       @{@"icon":@"list14",@"title":@"体育",@"id":@"1"},
                       @{@"icon":@"list13",@"title":@"制造",@"id":@"1"},
                       @{@"icon":@"list14",@"title":@"纺织业",@"id":@"1"},
                       @{@"icon":@"list15",@"title":@"石油",@"id":@"1"},
                       @{@"icon":@"list16",@"title":@"贵金属",@"id":@"1"},
                       @{@"icon":@"list17",@"title":@"旅游",@"id":@"1"},
                       @{@"icon":@"list18",@"title":@"印刷",@"id":@"1"},
                       @{@"icon":@"list19",@"title":@"橡胶",@"id":@"1"},
                       @{@"icon":@"list20",@"title":@"零售",@"id":@"1"},];
    
    for (NSDictionary *dict in array) {
        ChanYeListModel *model =[[ChanYeListModel alloc] init];
        model.icon = dict[@"icon"];
        model.title = dict[@"title"];
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
        
        [_collectionView registerClass:[ChanYeListCollectionViewCell class] forCellWithReuseIdentifier:ChanYeListCVCellReuseID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ChanYeSectionOneVCReViewID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ChanYeSectionFooterReViewID];
    }
    return _collectionView;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   
    UICollectionReusableView *reView =  [collectionView dequeueReusableSupplementaryViewOfKind :UICollectionElementKindSectionHeader   withReuseIdentifier:ChanYeSectionOneVCReViewID   forIndexPath:indexPath];
    return reView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenW, kScreenW*0.02);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(kScreenW, kScreenW*0.02);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //return self.listDataSource.count;
    return self.listDataSource.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
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
    
    return CGSizeMake(kScreenW/4-0.5, kScreenW/4);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChanYeListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: ChanYeListCVCellReuseID forIndexPath:indexPath];
    ChanYeListModel *model =self.listDataSource[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark --------  选择了item 某个波纹
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ChanYeDetailViewController *detail =[[ChanYeDetailViewController alloc] init];
    ChanYeListModel *model =self.listDataSource[indexPath.row];
    detail.title = model.title;
    [self.navigationController pushViewController:detail animated:YES];
    
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
