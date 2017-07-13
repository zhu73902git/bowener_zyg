//
//  FirstSectionHeader.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/6.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "FirstSectionHeader.h"
#import "MainListHeaderCollectionViewCell.h"


#define listCollectionItemWidth kScreenW*0.22
#define listCollectionItemHeight kScreenW*0.35-25

@interface FirstSectionHeader ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray   *listDataArray;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;


@end

@implementation FirstSectionHeader

static NSString *MainListHeaderCVCellReuseID =@"MainListHeaderCVCellReuseID";

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    
    if (self) {
        [self loadCollectionView];
        [self loadDatas];
    }
    return self;
}

- (void)loadDatas{
    
    NSArray *arr = @[@{@"icon":@"zhuanjiaImg1",@"name":@"张泽",@"type":@"金融 证券"},
                     @{@"icon":@"zhuanjiaImg3",@"name":@"李江",@"type":@"大数据 云计算 金融"},
                     @{@"icon":@"zhuanjiaImg2",@"name":@"刘涛",@"type":@"投资 理财"},
                     @{@"icon":@"zhuanjiaImg6",@"name":@"李彦宏",@"type":@"互联网 金融"},
                     @{@"icon":@"zhuanjiaImg4",@"name":@"李双江",@"type":@"政策分析"},
                     @{@"icon":@"zhuanjiaImg5",@"name":@"马云",@"type":@"互联网 大佬"},
                     @{@"icon":@"zhuanjiaImg7",@"name":@"马化腾",@"type":@"科技 企业"},
                     @{@"icon":@"zhuanjiaImg8",@"name":@"王健林",@"type":@"实体经济 政策"},];
    [self.listDataArray addObjectsFromArray:arr];
    
}

- (void)setSuperVC:(UIViewController *)superVC{
    _superVC = superVC;
}
- (void)loadCollectionView{
    
    UILabel *headerTitle =[[UILabel alloc] initWithFrame:CGRectMake(8, 0, kScreenW/2, 25)];
    headerTitle.text = @"知名专家";
    headerTitle.font = BWFont(12);
    headerTitle.textColor = [UIColor blackColor];
    [self addSubview:headerTitle];
    
    
    [self addSubview:self.collectionView];

}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 25, kScreenW, kScreenW*0.35-25) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =[UIColor whiteColor];
        
        [_collectionView registerClass:[MainListHeaderCollectionViewCell class] forCellWithReuseIdentifier:MainListHeaderCVCellReuseID];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listDataArray.count;    //self.listDataArray.count
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout =[[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置间距
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 8;
        // 设置滚动方向（默认垂直滚动）
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.itemSize = CGSizeMake(listCollectionItemWidth, listCollectionItemHeight);
       
    }
    return _flowLayout;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainListHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MainListHeaderCVCellReuseID forIndexPath:indexPath];
    NSDictionary *dict = self.listDataArray[indexPath.row];
    cell.dict = dict;
    return cell;
}

#pragma mark --------  选择了item 某个波纹
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RDVTabBarController *rdv =[self.superVC rdv_tabBarController];
    [rdv setTabBarHidden:YES animated:YES];
    ZhuanJiaDetailViewController *detail =[ZhuanJiaDetailViewController new];
    NSDictionary *dict =[self.listDataArray objectAtIndex:indexPath.row];
    detail.title = [NSString stringWithFormat:@"专家-%@",dict[@"name"]];
    detail.name = dict[@"name"];
    detail.icon = dict[@"icon"];
    [self.superVC.navigationController pushViewController:detail animated:YES];
    
}

- (NSMutableArray *)listDataArray{
    if (!_listDataArray) {
        _listDataArray =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataArray;
}


@end
