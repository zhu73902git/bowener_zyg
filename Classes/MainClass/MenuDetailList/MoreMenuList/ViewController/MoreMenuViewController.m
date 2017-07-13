//
//  MoreMenuViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MoreMenuViewController.h"

#import "MoreMenuListModel.h"

#import "MoreSectionOneCollectionViewCell.h"
#import "MoreSectionTwoCollectionViewCell.h"



static NSString *MoreSectionOneCVCellReuseID = @"MoreSectionOneCVCellReuseID";
static NSString *MoreSectionTwoCVCellReuseID = @"MoreSectionTwoCVCellReuseID";
static NSString *MoreSectionOneVCReViewID = @"MoreSectionOneVCReViewID";


@interface MoreMenuViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 内容
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray   *listDataSource;




@end

@implementation MoreMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.collectionView];
    
    [self loadListData];
}
#pragma mark   加载数据
- (void)loadListData{

    /**
     NSArray *titleArr =@[@"百科",@"专家",@"机构",@"产业",@"专访",@"论坛",@"成果",@"更多"];
     NSArray *imageArr =@[@"list1",@"list2",@"list3",@"list4",@"list5",@"list6",@"list7",@"list8"];
     */
    
    NSArray *dictArr = @[@[@{@"icon":@"list1",@"title":@"百科",@"detail":@""},
                           @{@"icon":@"list2",@"title":@"专家",@"detail":@""},
                           @{@"icon":@"list24",@"title":@"机构",@"detail":@""},
                           @{@"icon":@"list4",@"title":@"产业",@"detail":@""},
                           @{@"icon":@"list5",@"title":@"专访",@"detail":@""},
                           @{@"icon":@"list6",@"title":@"论坛",@"detail":@""},
                           @{@"icon":@"list7",@"title":@"成果",@"detail":@""},
                           @{@"icon":@"list3",@"title":@"在线课堂",@"detail":@""},
                           @{@"icon":@"list9",@"title":@"活动",@"detail":@""},
                           @{@"icon":@"list10",@"title":@"会议",@"detail":@""},
                           @{@"icon":@"list11",@"title":@"订阅",@"detail":@""},
                           @{@"icon":@"list12",@"title":@"拓展",@"detail":@""}],
                         @[@{@"icon":@"list13",@"title":@"关于我们",@"detail":@"了解更多"},
                           @{@"icon":@"list14",@"title":@"网络声明",@"detail":@"提升服务"},
                           @{@"icon":@"list15",@"title":@"机构服务",@"detail":@"为您服务"},
                           @{@"icon":@"list16",@"title":@"合作共享",@"detail":@"互利并共赢"},
                           @{@"icon":@"list17",@"title":@"平台入驻",@"detail":@"抓住好机会"},
                           @{@"icon":@"list18",@"title":@"智库联盟",@"detail":@"选择好渠道"}]
                         ];
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *arr2 = [NSMutableArray arrayWithCapacity:0];

    for (int i=0; i<dictArr.count ; i++ ) {
        
        for (NSDictionary *dic in dictArr[i]) {
            MoreMenuListModel *model =[[MoreMenuListModel alloc] init];
            model.icon = dic[@"icon"];
            model.title = dic[@"title"];
            model.detail = dic[@"detail"];
            if (i==0) {
                [arr1 addObject:model];
            }else if(i==1){
                [arr2 addObject:model];
            }
        }
    }
    [self.listDataSource addObject:arr1];
    [self.listDataSource addObject:arr2];
    
    [self.collectionView reloadData];
    
    
    
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        [_collectionView registerClass:[MoreSectionOneCollectionViewCell class] forCellWithReuseIdentifier:MoreSectionOneCVCellReuseID];
        [_collectionView registerClass:[MoreSectionTwoCollectionViewCell class] forCellWithReuseIdentifier:MoreSectionTwoCVCellReuseID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MoreSectionOneVCReViewID];
        
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //return self.listDataSource.count;
    return [self.listDataSource[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.listDataSource.count;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout =[[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(1, 0, 1, 0);
        _flowLayout.minimumLineSpacing = 0.5;
        _flowLayout.minimumInteritemSpacing = 0.5;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        return CGSizeMake(kScreenW/4-0.5, kScreenW/4);
    }else{
        return CGSizeMake(kScreenW/3-0.5, kScreenW/3);
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reView =  [collectionView dequeueReusableSupplementaryViewOfKind :UICollectionElementKindSectionHeader   withReuseIdentifier:MoreSectionOneVCReViewID   forIndexPath:indexPath];
    return reView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(kScreenW, kScreenW*0.02);
    }else{
        return CGSizeMake(kScreenW, kScreenW*0.1);
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sec = indexPath.section;
    NSUInteger row = indexPath.row;
    if (sec==0) {
        MoreSectionOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: MoreSectionOneCVCellReuseID forIndexPath:indexPath];
        MoreMenuListModel *model =self.listDataSource[sec][row];
        cell.model = model;
        return cell;
    }else{
    
        MoreSectionTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: MoreSectionTwoCVCellReuseID forIndexPath:indexPath];
        MoreMenuListModel *model =self.listDataSource[sec][row];
        cell.model = model;
        return cell;

    }
}

#pragma mark --------  选择了item 某个波纹
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (NSMutableArray *)listDataSource{
    if (!_listDataSource) {
        _listDataSource =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataSource;
}
























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
