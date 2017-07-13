//
//  FollowExpertTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/9.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "FollowExpertTableViewCell.h"

@interface FollowExpertTableViewCell ()

@property (nonatomic,strong) UIImageView *iconImageView;    // 头像
@property (nonatomic,strong) UILabel     *nameLabel;        // x姓名
@property (nonatomic,strong) UILabel     *fieldLabel;       // 擅长领域
@property (nonatomic,strong) UILabel     *positionLabel;    // 当前职位
@property (nonatomic,strong) UIButton    *concernButton;    // 关注专家


@end


@implementation FollowExpertTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.iconImageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.nameLabel.text = [NSString stringWithFormat:@"专家:%@",dict[@"name"]];
    self.fieldLabel.text = [NSString stringWithFormat:@"领域:%@",dict[@"type"]];
    self.positionLabel.text =[NSString stringWithFormat:@"职位:%@",dict[@"position"]];
    
}


- (void)loadSubViews{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.centerY.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.16, kScreenW*0.16));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.top.mas_equalTo(_iconImageView.mas_top).mas_equalTo(@0);
        make.right.mas_equalTo(@-10);
    }];
    [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.centerY.mas_equalTo(_iconImageView.mas_centerY).mas_equalTo(@0);
        make.right.mas_equalTo(@-10);
    }];
    [self.positionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.bottom.mas_equalTo(_iconImageView.mas_bottom).mas_equalTo(@0);
        make.right.mas_equalTo(@-10);
    }];
    [self.concernButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-15);
        make.centerY.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(50, 24));
    }];
    
}


- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 3;
        [self.contentView addSubview:self.iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel =[[UILabel alloc] init];
        _nameLabel.textAlignment= NSTextAlignmentLeft;
        _nameLabel.textColor = tabTitleColor;
        _nameLabel.font = BWFont(15);
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)fieldLabel{
    if (!_fieldLabel) {
        _fieldLabel =[[UILabel alloc] init];
        _fieldLabel.textAlignment= NSTextAlignmentLeft;
        _fieldLabel.textColor = BWColor(20, 20, 22, 1);
        _fieldLabel.font = BWFont(12);
        [self.contentView addSubview:self.fieldLabel];
    }
    return _fieldLabel;
}

- (UILabel *)positionLabel{
    if (!_positionLabel) {
        _positionLabel =[[UILabel alloc] init];
        _positionLabel.textAlignment= NSTextAlignmentLeft;
        _positionLabel.textColor = BWColor(20, 20, 22, 1);
        _positionLabel.font = BWFont(12);
        [self.contentView addSubview:self.positionLabel];
    }
    return _positionLabel;
}

- (UIButton *)concernButton{
    if (!_concernButton) {
        _concernButton =[UIButton buttonWithType:UIButtonTypeCustom];
        _concernButton.layer.masksToBounds = YES;
        _concernButton.layer.cornerRadius = 6;
        _concernButton.titleLabel.font = BWFont(10);
        _concernButton.layer.borderColor =[UIColor redColor].CGColor;
        _concernButton.layer.borderWidth = 1.0;
        [_concernButton setTitle:@"关 注" forState:UIControlStateNormal];
        [_concernButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_concernButton setTitle:@"取消关注" forState:UIControlStateSelected];
        [_concernButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_concernButton addTarget:self action:@selector(concernZhuanJia:) forControlEvents:UIControlEventTouchUpInside];
        _concernButton.selected = YES;
        [self.contentView addSubview:self.concernButton];
    }
    return _concernButton;
}

- (void)concernZhuanJia:(UIButton *)button{
    
    button.selected = !button.isSelected;
    if (button.selected) {
        _concernButton.layer.borderColor =[UIColor redColor].CGColor;
    }else{
        _concernButton.layer.borderColor =[UIColor grayColor].CGColor;
    }
}
















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
