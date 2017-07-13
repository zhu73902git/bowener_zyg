//
//  UserMsgListTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "UserMsgListTableViewCell.h"


@interface UserMsgListTableViewCell ()

@property (nonatomic,strong) UILabel        *titleLabel;
@property (nonatomic,strong) UIImageView    *iconImageView;
@property (nonatomic,strong) UILabel        *detailLabel;




@end

@implementation UserMsgListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI{

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.centerY.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(@0);
        make.height.mas_equalTo(@30);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(@0);
        make.height.mas_equalTo(@30);
        make.right.mas_equalTo(@-10);
    }];
    

}


- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    self.iconImageView.image =[UIImage imageNamed:dict[@"icon"]];
    self.titleLabel.text = dict[@"title"];
    self.detailLabel.text = dict[@"detail"];
    
    if ([dict[@"detail"] isEqualToString:@"已绑定"]) {
        self.detailLabel.textColor = BWColor(231, 88, 83, 1);
    }else if ([dict[@"detail"] isEqualToString:@"未绑定"]){
        self.detailLabel.textColor = BWColor(140, 140, 140, 1);
    }
    

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
        _detailLabel.textAlignment= NSTextAlignmentRight;
        _detailLabel.textColor = BWColor(80, 80, 80, 1);
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
