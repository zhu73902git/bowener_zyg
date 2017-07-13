//
//  BKOnlyTextTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/27.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "BKOnlyTextTableViewCell.h"


@interface BKOnlyTextTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;


@end

@implementation BKOnlyTextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

- (void)setModel:(BaiKeListModel *)model{
    
    self.titleLabel.text  = model.title;
    self.detailLabel.text  = model.detail;
    
}

- (void)loadSubViews{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.top.mas_equalTo(@10);
        make.right.mas_equalTo(@-15);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-8);
        make.left.mas_equalTo(@15);
        make.right.mas_equalTo(@-15);
    }];
    
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
        _detailLabel.numberOfLines= 2;
        _detailLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.detailLabel];
    }
    return _detailLabel;
}












- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
