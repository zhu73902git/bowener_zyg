//
//  BKVidioTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/27.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "BKVidioTableViewCell.h"

@interface BKVidioTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *viewsLabel;
@property (nonatomic, strong) UILabel     *comentLabel;
@property (nonatomic, strong) UILabel     *timeLabel;

@property (nonatomic, strong) UIButton    *openBtn;


@end


@implementation BKVidioTableViewCell

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
    self.titleLabel.text  = model.title;
    self.viewsLabel.text  = [NSString stringWithFormat:@"浏览量: %@",model.views];
    self.comentLabel.text = [NSString stringWithFormat:@"评论: %@",model.comment];
    self.timeLabel.text   = model.time;
    
}

- (void)loadSubViews{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@5);
        make.right.mas_equalTo(@-10);
        make.height.mas_equalTo(@30);
    }];
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(@2);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.14, kScreenW*0.14));
    }];
    [self.viewsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-5);
        make.left.mas_equalTo(@10);
    }];
    [self.comentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-5);
        make.left.mas_equalTo(_viewsLabel.mas_right).mas_equalTo(@10);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-5);
        make.right.mas_equalTo(@-15);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@0);
        make.left.mas_equalTo(@5);
        make.right.mas_equalTo(@-5);
        make.bottom.mas_equalTo(_viewsLabel.mas_top).mas_equalTo(@(-10));
    }];

}


- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc] init];
        _iconImageView.userInteractionEnabled = YES;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 1;
        _iconImageView.layer.borderColor = SelecteCellColor.CGColor;
        _iconImageView.layer.borderWidth = 1;
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

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(16);
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}


- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel =[[UILabel alloc] init];
        _timeLabel.textAlignment= NSTextAlignmentRight;
        _timeLabel.font = BWFont(11);
        _timeLabel.textColor = DetailColor;
        [self.contentView addSubview:self.timeLabel];
    }
    return _timeLabel;
}


- (UILabel *)viewsLabel{
    if (!_viewsLabel) {
        _viewsLabel =[[UILabel alloc] init];
        _viewsLabel.textAlignment= NSTextAlignmentRight;
        _viewsLabel.font = BWFont(11);
        _viewsLabel.textColor = DetailColor;
        [self.contentView addSubview:self.viewsLabel];
    }
    return _viewsLabel;
}


- (UILabel *)comentLabel{
    if (!_comentLabel) {
        _comentLabel =[[UILabel alloc] init];
        _comentLabel.textAlignment= NSTextAlignmentRight;
        _comentLabel.font = BWFont(11);
        _comentLabel.textColor = DetailColor;
        [self.contentView addSubview:self.comentLabel];
    }
    return _comentLabel;
}
















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
