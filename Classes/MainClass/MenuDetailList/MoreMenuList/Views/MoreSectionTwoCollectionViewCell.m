//
//  MoreSectionTwoCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/27.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MoreSectionTwoCollectionViewCell.h"


@interface MoreSectionTwoCollectionViewCell ()


@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *detailLabel;


@end

@implementation MoreSectionTwoCollectionViewCell




- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubViews];
    }
    return self;
}

- (void)setModel:(MoreMenuListModel *)model{
    
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.title;
    self.detailLabel.text = model.detail;
    
}
///
- (void)loadSubViews{
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(@0);
        make.centerY.mas_equalTo(@-8);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.07, kScreenW*0.07));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_bottom).mas_equalTo(@5);
        make.left.right.mas_equalTo(@0);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@5);
        make.left.right.mas_equalTo(@0);
    }];
    
    
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.image =[UIImage imageNamed:@"listTest1"];
        [self.contentView addSubview:self.iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentCenter WithTextColor:[UIColor blackColor] WithFont:14];
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentCenter WithTextColor:[UIColor grayColor] WithFont:12];
        [self.contentView addSubview:self.detailLabel];
    }
    return _detailLabel;
}







@end
