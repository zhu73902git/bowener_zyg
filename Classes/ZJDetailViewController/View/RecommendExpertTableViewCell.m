//
//  RecommendExpertTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "RecommendExpertTableViewCell.h"


@interface RecommendExpertTableViewCell ()


@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *nameLabel;
@property (nonatomic,strong) UILabel     *detailLabel;
@property (nonatomic,strong) UILabel     *labelsLabel;


@end

@implementation RecommendExpertTableViewCell

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
    self.iconImageView.image =[UIImage imageNamed:dict[@"icon"]];
    self.nameLabel.text = dict[@"name"];
    self.detailLabel.text = dict[@"position"];
    self.labelsLabel.text = dict[@"field"];

}


- (void)configUI{

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(@0);
        make.left.mas_equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.2, kScreenW*0.2));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top).mas_equalTo(@0);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom).mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
    }];
    [self.labelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.bottom.mas_equalTo(_iconImageView).mas_equalTo(@0);
        make.right.mas_equalTo(@-10);
        
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
        _nameLabel.textAlignment= NSTextAlignmentLeft;
        _nameLabel.font = BWFont(16);
        _nameLabel.text = @"张泽";
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel =[[UILabel alloc] init];
        _detailLabel.textAlignment= NSTextAlignmentLeft;
        _detailLabel.font = BWFont(14);
        _detailLabel.textColor = BWColor(180, 180, 180, 1);
        _detailLabel.numberOfLines = 2;
        _detailLabel.text = @"移动互联网改变了我们的生活。对于从业者来说，移动互联网是一个机会同时也是一项挑战，因为在移动互联网时代，获得成功的路径和传统互联网时代并不相同。";
        [self.contentView addSubview:self.detailLabel];
    }
    return _detailLabel;
}

- (UILabel *)labelsLabel{
    if (!_labelsLabel) {
        _labelsLabel =[[UILabel alloc] init];
        _labelsLabel.textAlignment= NSTextAlignmentLeft;
        _labelsLabel.font = BWFont(10);
        _labelsLabel.textColor = BWColor(180, 180, 180, 1);
        _labelsLabel.text = @" ";
        [self.contentView addSubview:self.labelsLabel];
    }
    return _labelsLabel;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
