//
//  ZhiKuSelecteListTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZhiKuSelecteListTableViewCell.h"



@interface ZhiKuSelecteListTableViewCell ()

@property (nonatomic,strong) UILabel  *titleLabel;


@end

@implementation ZhiKuSelecteListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *vi =[[UIView alloc] init];
        vi.backgroundColor = SelecteCellColor;
        [self.contentView addSubview:vi];
        [vi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(@0);
            make.right.left.mas_equalTo(@0);
            make.height.mas_equalTo(@0.5);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(@0);
        }];
        
    }
    return self;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentCenter;
        _titleLabel.font = BWFont(14);
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}

- (void)setModel:(ZhiKuSelecteListModel *)model{

    _model= model;
    self.titleLabel.text = model.title;
    if (model.bol) {
        self.titleLabel.textColor =[UIColor redColor];
        self.contentView.backgroundColor = SelecteCellColor;
    }else{
        self.titleLabel.textColor =[UIColor blackColor];
        self.contentView.backgroundColor =[UIColor whiteColor];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
