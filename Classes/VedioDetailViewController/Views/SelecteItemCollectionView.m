//
//  SelecteItemCollectionView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/8.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SelecteItemCollectionView.h"

#import "SelecteItemCollectionViewCell.h"

@interface SelecteItemCollectionView  ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) NSMutableArray *listDataArray;
@property (nonatomic,strong) UICollectionViewFlowLayout *flayOut;

@end

@implementation SelecteItemCollectionView

static NSString *SelecteItemCellReuseID = @"SelecteItemCellReuseID";
- (instancetype)initWithFrame:(CGRect)frame{
    
    self= [super initWithFrame:frame collectionViewLayout:self.flayOut];
    if (self) {
        [self loadSubs];
    }
    return self;
}

- (void)loadSubs{
    
    self.delegate =self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator= NO;
    self.showsHorizontalScrollIndicator =NO;
    self.backgroundColor =[UIColor whiteColor];
    [self registerClass:[SelecteItemCollectionViewCell class] forCellWithReuseIdentifier:SelecteItemCellReuseID];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;    //self.listDataArray.count
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (UICollectionViewFlowLayout *)flayOut{
    if (!_flayOut) {
        _flayOut =[[UICollectionViewFlowLayout alloc] init];
        _flayOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置间距
        _flayOut.minimumLineSpacing = 0;
        _flayOut.minimumInteritemSpacing = 8;
        // 设置滚动方向（默认垂直滚动）
        _flayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flayOut.itemSize = CGSizeMake(kScreenW*0.14, kScreenW*0.14);
        
    }
    return _flayOut;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SelecteItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SelecteItemCellReuseID forIndexPath:indexPath];
    cell.itemLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    return cell;
}

#pragma mark --------  选择了item 某个波纹
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (NSMutableArray *)listDataArray{
    if (!_listDataArray) {
        _listDataArray =[NSMutableArray arrayWithCapacity:0];
    }
    return _listDataArray;
}


@end
