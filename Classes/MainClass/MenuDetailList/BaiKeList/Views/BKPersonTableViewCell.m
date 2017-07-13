//
//  BKPersonTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/27.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "BKPersonTableViewCell.h"

@interface BKPersonTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation BKPersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

- (void)setModel:(BaiKeListModel *)model{
    
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text  = model.userName;
    self.detailLabel.text  = model.detail;
    self.descLabel.text = model.desc;
    
}

- (void)loadSubViews{
    
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@12);
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(@-12);
        make.width.mas_equalTo(@(kScreenW*0.28-24));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top).mas_equalTo(@0);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@14);
        make.right.mas_equalTo(@-10);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@5);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@14);
        make.right.mas_equalTo(@-10);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@14);
        make.bottom.mas_equalTo(_iconImageView.mas_bottom).mas_equalTo(@0);
    }];
    
}


- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.userInteractionEnabled = YES;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.layer.borderColor = SelecteCellColor.CGColor;
        _iconImageView.layer.borderWidth = 1;
        [self.contentView addSubview:self.iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(16);
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}


- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel =[[UILabel alloc] init];
        _detailLabel.textAlignment= NSTextAlignmentLeft;
        _detailLabel.font = BWFont(12);
        _detailLabel.numberOfLines = 2;
        _detailLabel.textColor = DetailColor;
        [self.contentView addSubview:self.detailLabel];
    }
    return _detailLabel;
}


- (UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel =[[UILabel alloc] init];
        _descLabel.textAlignment= NSTextAlignmentLeft;
        _descLabel.font = BWFont(12);
        _descLabel.textColor = DetailColor;
        [self.contentView addSubview:self.descLabel];
    }
    return _descLabel;
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
