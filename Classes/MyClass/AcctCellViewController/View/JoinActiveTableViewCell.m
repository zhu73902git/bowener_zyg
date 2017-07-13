//
//  JoinActiveTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/9.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "JoinActiveTableViewCell.h"


@interface JoinActiveTableViewCell ()


@property (nonatomic,strong) UILabel    *titleLabel;
@property (nonatomic,strong) UILabel    *detailLabel;


@property (nonatomic,strong) UILabel    *addressLabel;
@property (nonatomic,strong) UILabel    *timeLabel;
@property (nonatomic,strong) UILabel    *nameLabel;
@property (nonatomic,strong) UILabel    *priceLabel;
@property (nonatomic,strong) UILabel    *stateLabel;
@property (nonatomic,strong) UILabel    *moreLabel;

@end



@implementation JoinActiveTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    
    self.titleLabel.text = dict[@"title"];
    self.detailLabel.text = dict[@"detail"];
    self.nameLabel.text = dict[@"name"];
    self.addressLabel.text = [NSString stringWithFormat:@"活动地点:%@",dict[@"address"]];
    self.timeLabel.text = [NSString stringWithFormat:@"活动时间:%@",dict[@"time"]];
    self.priceLabel.text = dict[@"price"];
    self.stateLabel.text = dict[@"state"];
    
    
}

- (void)loadSubViews{


    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.top.mas_equalTo(@10);
    }];
    UIView *lineView =[[UIView alloc] init];
    lineView.backgroundColor= [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@3);
        make.left.mas_equalTo(@15);
        make.right.mas_equalTo(@0);
        make.height.mas_equalTo(@0.6);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@13);
        make.right.mas_equalTo(@-10);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(@-8);
        make.right.mas_equalTo(@-10);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(_addressLabel.mas_top).mas_equalTo(@-4);
        make.right.mas_equalTo(@-10);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(_timeLabel.mas_top).mas_equalTo(@-4);
        make.right.mas_equalTo(@-10);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-15);
        make.centerY.mas_equalTo(_addressLabel.mas_centerY).mas_equalTo(@0);
    }];
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_timeLabel.mas_centerY).mas_equalTo(@0);
        make.right.mas_equalTo(@-10);
    }];
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_titleLabel.mas_centerY).mas_equalTo(@0);
        make.right.mas_equalTo(@-10);
    }];
    
    
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(15);
        _titleLabel.textColor = BWColor(112, 108, 205, 1);
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel =[[UILabel alloc] init];
        _detailLabel.textAlignment= NSTextAlignmentLeft;
        _detailLabel.textColor = DetailTextColor;
        _detailLabel.font = BWFont(12);
        _detailLabel.numberOfLines = 0;
        [self.contentView addSubview:self.detailLabel];
    }
    return _detailLabel;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel =[[UILabel alloc] init];
        _nameLabel.textAlignment= NSTextAlignmentLeft;
        _nameLabel.font = BWFont(10);
        _nameLabel.text = @"张泽";
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}
- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel =[[UILabel alloc] init];
        _addressLabel.textAlignment= NSTextAlignmentLeft;
        _addressLabel.font = BWFont(10);
        
        [self.contentView addSubview:self.addressLabel];
    }
    return _addressLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel =[[UILabel alloc] init];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = BWFont(10);
        [self.contentView addSubview:self.timeLabel];
    }
    return _timeLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel =[[UILabel alloc] init];
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.font = BWFont(10);
        _priceLabel.textColor = BWColor(34, 159, 95, 1);
        [self.contentView addSubview:self.priceLabel];
    }
    return _priceLabel;
}
- (UILabel *)moreLabel{
    if (!_moreLabel) {
        _moreLabel =[[UILabel alloc] init];
        _moreLabel.textAlignment = NSTextAlignmentRight;
        _moreLabel.font = BWFont(10);
        _moreLabel.text = @"详情>>";
        _moreLabel.textColor = BWColor(34, 159, 95, 1);
        [self.contentView addSubview:self.moreLabel];
    }
    return _moreLabel;
}

- (UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel =[[UILabel alloc] init];
        _stateLabel.textAlignment = NSTextAlignmentRight;
        _stateLabel.font = BWFont(10);
        _stateLabel.text = @"张泽";
        _stateLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.stateLabel];
    }
    return _stateLabel;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
