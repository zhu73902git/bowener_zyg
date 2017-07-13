//
//  JiGouListCollectionViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/26.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "JiGouListCollectionViewCell.h"


@interface JiGouListCollectionViewCell ()


@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *nameLabel;
@property (nonatomic,strong) UILabel     *typelabel;
@property (nonatomic,strong) UILabel     *rzlabel;



@end

@implementation JiGouListCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubViews];
    }
    return self;
}

- (void)setModel:(JiGouListModel *)model{
    
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
    self.typelabel.text = model.type;
    if (model.type) {
        self.rzlabel.text = @"已认证";
        self.rzlabel.textColor = [UIColor redColor];
    }else{
        self.rzlabel.text = @"未认证";
        self.rzlabel.textColor = [UIColor grayColor];
    }

}
/// 
- (void)loadSubViews{

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@6);
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(@-6);
        make.width.mas_equalTo(@(kScreenW/4-10));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top).mas_equalTo(@0);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
    }];
    
    [self.rzlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom).mas_equalTo(@5);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
    }];
    [self.typelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.bottom.mas_equalTo(@-6);
    }];


}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.layer.borderWidth = 1.5;
        _iconImageView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        _iconImageView.image =[UIImage imageNamed:@"listTest1"];
        [self.contentView addSubview:self.iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor blackColor] WithFont:15];
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}
- (UILabel *)typelabel{
    if (!_typelabel) {
        _typelabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor grayColor] WithFont:12];
        _typelabel.numberOfLines = 2;
        [self.contentView addSubview:self.typelabel];
    }
    return _typelabel;
}
- (UILabel *)rzlabel{
    if (!_rzlabel) {
        _rzlabel =[UILabel initWithTitle:@"" WithTextAligent:NSTextAlignmentLeft WithTextColor:[UIColor grayColor] WithFont:12];
        [self.contentView addSubview:self.rzlabel];
    }
    return _rzlabel;
}







@end
