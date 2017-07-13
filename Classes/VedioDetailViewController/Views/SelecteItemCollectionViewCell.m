//
//  SelecteItemCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/8.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SelecteItemCollectionViewCell.h"


@interface SelecteItemCollectionViewCell ()





@end

@implementation SelecteItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(kScreenW*0.10, kScreenW*0.10));
        }];
    }
    return self;
}

- (UILabel *)itemLabel{
    
    if (!_itemLabel) {
        _itemLabel =[[UILabel alloc] init];
        _itemLabel.backgroundColor = tabTitleColor;
        _itemLabel.textAlignment = NSTextAlignmentCenter;
        _itemLabel.textColor = [UIColor blackColor];
        _itemLabel.layer.masksToBounds = YES;
        _itemLabel.layer.cornerRadius = 4;
        _itemLabel.font = BWFont(17);
        [self.contentView addSubview:self.itemLabel];
    }
    return _itemLabel;
}

@end
