//
//  SubscribeVedioViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SubscribeVedioViewController.h"

#import "SubscribeVedioCollectionViewCell.h"

@interface SubscribeVedioViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) UICollectionView    *collectionView;
@property (nonatomic,strong) NSMutableArray *listDataSource;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;



@end

@implementation SubscribeVedioViewController


static NSString *SubscribeVedioCellReuseID = @"SubscribeVedioCellReuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *array = @[@{@"icon":@"activeImg1",@"title":@"大数据揭秘",@"type":@"大数据 算法",@"name":@"李亦非",@"price":@"100",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1705/29/qimuy3037/SD/qimuy3037-mobile.mp4"},
                       @{@"icon":@"activeImg2",@"title":@"云计算的背后",@"type":@"云计算",@"name":@"柳江",@"price":@"200",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1705/29/orhJO1646/HD/orhJO1646-mobile.mp4"},
                       @{@"icon":@"activeImg3",@"title":@"互联网大咖",@"type":@"互联网 企业",@"name":@"张泽",@"price":@"100",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1705/29/qimuy3037/SD/qimuy3037-mobile.mp4"},
                       @{@"icon":@"activeImg4",@"title":@"计算未来时间",@"type":@"科技 创新",@"name":@"虎一番",@"price":@"300",@"vedioUrl":@"http://flv2.bn.netease.com/videolib3/1706/08/wkGUI4146/SD/wkGUI4146-mobile.mp4"}];
    [self.listDataSource addObjectsFromArray:array];
    [self.view addSubview:self.collectionView];
}


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        [_collectionView registerClass:[SubscribeVedioCollectionViewCell class] forCellWithReuseIdentifier:SubscribeVedioCellReuseID];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listDataSource.count;    //self.listDataArray.count
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout =[[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置间距
        _flowLayout.minimumLineSpacing = 5;
        _flowLayout.minimumInteritemSpacing = 0.5;
        // 设置滚动方向（默认垂直滚动）
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.itemSize = CGSizeMake(kScreenW/2-0.5, kScreenW/2*0.8);
        
    }
    return _flowLayout;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubscribeVedioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SubscribeVedioCellReuseID forIndexPath:indexPath];
    NSDictionary *dict = self.listDataSource[indexPath.row];
    cell.dict = dict;
    return cell;
}

#pragma mark --------  选择了item 某个波纹
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.listDataSource[indexPath.row];
    VideoDetailViewController *videoDetailViewController = [[VideoDetailViewController alloc] init];
    videoDetailViewController.videoTitle = dict[@"title"];
    videoDetailViewController.mp4_url = dict[@"vedioUrl"];
    [self.navigationController pushViewController:videoDetailViewController animated:YES];
    
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
