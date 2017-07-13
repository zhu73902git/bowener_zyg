//
//  ExpertIntroduceTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ExpertIntroduceTableViewCell.h"


@interface ExpertIntroduceTableViewCell ()

@property (nonatomic,strong) UILabel    *titleLabel;
@property (nonatomic,strong) UILabel    *detailLabel;

@end

@implementation ExpertIntroduceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict{
    _dict = dict;
    self.titleLabel.text = dict[@"title"];
    self.detailLabel.text = dict[@"detail"];
    
}

#pragma mark   加载视图
- (void)configUI{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.top.mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
    }];

}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(15);
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel =[[UILabel alloc] init];
        _detailLabel.textAlignment= NSTextAlignmentLeft;
        _detailLabel.textColor = BWColor(40, 40, 44, 1);
        _detailLabel.numberOfLines= 0;
        _detailLabel.font = BWFont(14);
        [self.contentView addSubview:self.detailLabel];
    }
    return _detailLabel;
}










- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
