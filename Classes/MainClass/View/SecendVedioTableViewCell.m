//
//  SecendVedioTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/6.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "SecendVedioTableViewCell.h"



@interface SecendVedioTableViewCell ()



@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UIButton    *openBtn;
@property (nonatomic,strong) UIImageView *userImageView;
@property (nonatomic,strong) UILabel     *nameLabel;



@end

@implementation SecendVedioTableViewCell

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
    self.userImageView.image = [UIImage imageNamed:dict[@"userIcon"]];
    self.nameLabel.text = dict[@"userName"];
    
}

- (void)loadSubViews{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@5);
        make.left.mas_equalTo(@15);
        make.right.mas_equalTo(@-15);
        make.height.mas_equalTo(@24);
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
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@5);
        make.left.mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(_userImageView.mas_top).mas_equalTo(@(-10));
    }];
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(@2);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.14, kScreenW*0.14));
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
- (UIButton *)openBtn{
    if (!_openBtn) {
        _openBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_openBtn setImage:[UIImage imageNamed:@"openBtnImage"] forState:UIControlStateNormal];
        [_openBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        _openBtn.userInteractionEnabled = NO;
        //    [_openBtn addTarget:self action:@selector(opemVedioButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.iconImageView addSubview:self.openBtn];
    }
    return _openBtn;
}
#pragma mark  打开视频
- (void)opemVedioButtonAct:(UIButton *)button{
    
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
        [self.contentView addSubview:self.nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(18);
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
