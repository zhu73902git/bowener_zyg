//
//  SubscribeVedioCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/9.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SubscribeVedioCollectionViewCell.h"

@interface SubscribeVedioCollectionViewCell ()


@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel    *titleLabel;
@property (nonatomic,strong) UILabel    *typelabel;
@property (nonatomic,strong) UILabel    *nameLabel;
@property (nonatomic,strong) UILabel    *priceLabel;

@end

@implementation SubscribeVedioCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame{

    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        [self loadSubViews];
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict{
    
    _dict =dict;
    self.iconImageView.image =[UIImage imageNamed:dict[@"icon"]];
    self.titleLabel.text = dict[@"title"];
    self.typelabel.text = dict[@"type"];
    self.priceLabel.text = [NSString stringWithFormat:@"价格:%@元",dict[@"price"]];
    self.nameLabel.text = [NSString stringWithFormat:@"专家:%@",dict[@"name"]];

}
- (void)loadSubViews{

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(@0);
        make.left.mas_equalTo(@10);
        make.height.mas_equalTo(@20);
    }];
    
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@5);
        make.height.mas_equalTo(@20);
        make.bottom.mas_equalTo(@-2);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-5);
        make.height.mas_equalTo(@20);
        make.bottom.mas_equalTo(@-2);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@0);
        make.left.mas_equalTo(@1);
        make.right.mas_equalTo(@-1);
        make.bottom.mas_equalTo(_nameLabel.mas_top).mas_equalTo(@-5);
    }];
    [self.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(@0);
        make.bottom.mas_equalTo(@-5);
    }];

}


- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.image =[UIImage imageNamed:@"listTest1"];
        [self.contentView addSubview:self.iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(13);
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}
- (UILabel *)typelabel{
    if (!_typelabel) {
        _typelabel =[[UILabel alloc] init];
        _typelabel.textAlignment= NSTextAlignmentCenter;
        _typelabel.font = BWFont(12);
        _typelabel.textColor = BWColor(250, 250, 250, 0.9);
        _typelabel.text = @"专家领域";
        [self.iconImageView addSubview:self.typelabel];
    }
    return _typelabel;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel =[[UILabel alloc] init];
        _nameLabel.textAlignment= NSTextAlignmentLeft;
        _nameLabel.font = BWFont(10);
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel =[[UILabel alloc] init];
        _priceLabel.textAlignment= NSTextAlignmentRight;
        _priceLabel.font = BWFont(10);
        _priceLabel.textColor = BWColor(35, 159, 96, 1);
        [self.contentView addSubview:self.priceLabel];
    }
    return _priceLabel;
}









@end
