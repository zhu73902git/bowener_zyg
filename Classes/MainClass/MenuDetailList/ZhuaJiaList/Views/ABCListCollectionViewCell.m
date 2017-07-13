//
//  ABCListCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ABCListCollectionViewCell.h"



@interface ABCListCollectionViewCell ()

@property (nonatomic,strong) UILabel    *titleLabel;

@end

@implementation ABCListCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubViews];
    }
    return self;
}
- (void)setModel:(ABCModel *)model{
    
    self.titleLabel.text = model.title;
    if (model.bol) {
        self.titleLabel.backgroundColor = SelecteABCMenuColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }else{
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
    }
}
- (void)loadSubViews{

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(@0);
    }];

}
- (UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentCenter WithTextColor:[UIColor blackColor] WithFont:15];
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}


@end
