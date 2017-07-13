//
//  ZhuanJiaMenuCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhuanJiaMenuCollectionViewCell.h"

@interface ZhuanJiaMenuCollectionViewCell ()


@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *nameLabel;
@property (nonatomic,strong) UILabel     *detaillabel;
@property (nonatomic,strong) UILabel     *typelabel;



@end


@implementation ZhuanJiaMenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        [self configview];
    }
    return self;
}


- (void)setModel:(ZhuanJiaMenuModel *)model{
    
    self.iconImageView.image =[UIImage imageNamed:model.iconImage];
    self.nameLabel.text = model.name;
    self.typelabel.text = model.type;
    self.detaillabel.text = model.detail;
}

- (void)configview{
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@6);
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(@-6);
        make.width.mas_equalTo(@(kScreenW/4-10));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top).mas_equalTo(@0);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@14);
        make.right.mas_equalTo(@-10);
    }];
    
    [self.detaillabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom).mas_equalTo(@5);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@14);
        make.right.mas_equalTo(@-10);
    }];
    [self.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@14);
        make.bottom.mas_equalTo(_iconImageView.mas_bottom).mas_equalTo(@0);
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
        _nameLabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor blackColor] WithFont:16];
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}
- (UILabel *)typelabel{
    if (!_typelabel) {
        _typelabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor blackColor] WithFont:12];
        [self.contentView addSubview:self.typelabel];
    }
    return _typelabel;
}
- (UILabel *)detaillabel{
    if (!_detaillabel) {
        _detaillabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor grayColor] WithFont:12];
        _detaillabel.numberOfLines = 2;
        [self.contentView addSubview:self.detaillabel];
    }
    return _detaillabel;
}



@end
