//
//  SecendTextTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/6.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SecendTextTableViewCell.h"


@interface SecendTextTableViewCell ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *descLabel;
@property (nonatomic,strong) UILabel     *labelsLabel;

@property (nonatomic,strong) UIImageView *userImageView;
@property (nonatomic,strong) UILabel     *nameLabel;


@end

@implementation SecendTextTableViewCell

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
    
    //@"icon":@"",@"title":@"",@"userIcon":@"",@"userName":@""
    self.iconImageView.image =[UIImage imageNamed:dict[@"icon"]];
    self.titleLabel.text = dict[@"title"];
    self.descLabel.text = dict[@"detail"];
    self.labelsLabel.text = dict[@"type"];
    self.userImageView.image = [UIImage imageNamed:dict[@"userIcon"]];
    self.nameLabel.text = dict[@"userName"];

}

- (void)loadSubViews{

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@10);
        make.left.mas_equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@10);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
        make.left.mas_equalTo(_iconImageView.mas_right).mas_equalTo(@10);
    }];
    [self.labelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_descLabel.mas_left).mas_equalTo(@0);
        make.top.mas_equalTo(_descLabel.mas_bottom).mas_equalTo(@10);
        
    }];
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_userImageView.mas_right).mas_equalTo(@10);
        make.centerY.mas_equalTo(_userImageView.mas_centerY).mas_equalTo(@0);
        make.width.mas_equalTo(@(kScreenW/2));
    }];

    

}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.image =[UIImage imageNamed:@"listTest2"];
        [self.contentView addSubview:self.iconImageView];
    }
    return _iconImageView;
}

- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView =[[UIImageView alloc] init];
        _userImageView.layer.masksToBounds = YES;
        _userImageView.layer.cornerRadius = 8;
        _userImageView.image =[UIImage imageNamed:@"listTest1"];
        [self.contentView addSubview:self.userImageView];
    }
    return _userImageView;
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
- (UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel =[[UILabel alloc] init];
        _descLabel.textAlignment= NSTextAlignmentLeft;
        _descLabel.font = BWFont(12);
        _descLabel.textColor = BWColor(180, 180, 180, 1);
        _descLabel.numberOfLines = 2;
        _descLabel.text = @"移动互联网改变了我们的生活。对于从业者来说，移动互联网是一个机会同时也是一项挑战，因为在移动互联网时代，获得成功的路径和传统互联网时代并不相同。2013全球移动互联网大会期间，腾讯科技采访多位“过来人”，辑录观点、总结教训，汇成此《移动互联网新6大生存法则》，希望对创业者们有所裨益。";
        [self.contentView addSubview:self.descLabel];
    }
    return _descLabel;
}
- (UILabel *)labelsLabel{
    if (!_labelsLabel) {
        _labelsLabel =[[UILabel alloc] init];
        _labelsLabel.textAlignment= NSTextAlignmentLeft;
        _labelsLabel.font = BWFont(10);
        _labelsLabel.text = @"金融 互联网 政策";
        [self.contentView addSubview:self.labelsLabel];
    }
    return _labelsLabel;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(17);
        _titleLabel.text = @"互联网丛林生存法则 (一)";
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
