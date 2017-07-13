//
//  MainListHeaderCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MainListHeaderCollectionViewCell.h"



@interface MainListHeaderCollectionViewCell ()

@property (nonatomic,strong) UIImageView    *iconImageView;
@property (nonatomic,strong) UILabel        *nameLabel;
@property (nonatomic,strong) UILabel        *typelabel;


@end

@implementation MainListHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{

    self =[super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor =[UIColor whiteColor];
        [self configview];
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict{
    _dict = dict;
    self.iconImageView.image =[UIImage imageNamed:dict[@"icon"]];
    self.nameLabel.text = dict[@"name"];
    self.typelabel.text = dict[@"type"];
    
}

- (void)configview{
    
   
    [self.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(@0);
        make.bottom.mas_equalTo(@-4);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_typelabel.mas_top).mas_equalTo(@-2);
        make.left.right.mas_equalTo(@0);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@4);
        make.left.mas_equalTo(@2);
        make.right.mas_equalTo(@-2);
        make.bottom.mas_equalTo(_nameLabel.mas_top).mas_equalTo(@-3);
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

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel =[[UILabel alloc] init];
        _nameLabel.textAlignment= NSTextAlignmentCenter;
        _nameLabel.font = BWFont(9);
        _nameLabel.text = @"专家名字";
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}
- (UILabel *)typelabel{
    if (!_typelabel) {
        _typelabel =[[UILabel alloc] init];
        _typelabel.textAlignment= NSTextAlignmentCenter;
        _typelabel.font = BWFont(8);
        _typelabel.text = @"专家领域";
        [self.contentView addSubview:self.typelabel];
    }
    return _typelabel;
}


@end
