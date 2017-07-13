//
//  ReleaseNeedTableViewCell.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/9.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ReleaseNeedTableViewCell.h"


@interface ReleaseNeedTableViewCell ()

@property (nonatomic,strong) UIImageView *iconImg;
@property (nonatomic,strong) UILabel     *questionLabel;
@property (nonatomic,strong) UILabel     *auswerLabel;
@property (nonatomic,strong) UILabel     *nameLabel;
@property (nonatomic,strong) UILabel     *timeLabel;
@property (nonatomic,strong) UILabel     *priceLabel;


@end

@implementation ReleaseNeedTableViewCell

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
    self.iconImg.image = [UIImage imageNamed:dict[@"icon"]];
    self.questionLabel.text = [NSString stringWithFormat:@"问题:%@",dict[@"question"]];
    self.auswerLabel.text = dict[@"auswer"];
    self.priceLabel.text = [NSString stringWithFormat:@"消费:%@元",dict[@"price"]];
    self.nameLabel.text = dict[@"name"];
    self.timeLabel.text = dict[@"time"];

}

- (void)loadSubViews{
   /**
    @"question":@"如何做好互联网生态的维护？",@"auswer":@"以让公共用户或者私人用户享受现代计算机信息技术带来的高水平、全方位的服务。这种服务是建立在上述通信及相关的基础设施之上的",@"price":@"100",@"icon":@"zhuanjiaImg4",@"name":@"刘玉",@"time":@"2017.06.10 12:20"}
    */
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.top.mas_equalTo(@10);
        make.width.mas_equalTo(@60);
        
    }];
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@8);
        make.left.mas_equalTo(@15);
        make.right.mas_equalTo(_priceLabel.mas_left).mas_equalTo(@-5);
    }];
    UIView *lineView =[[UIView alloc] init];
    lineView.backgroundColor= [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_questionLabel.mas_bottom).mas_equalTo(@5);
        make.left.mas_equalTo(@15);
        make.right.mas_equalTo(@0);
        make.height.mas_equalTo(@0.6);
    }];
    [self.auswerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_questionLabel.mas_bottom).mas_equalTo(@12);
        make.left.mas_equalTo(@15);
        make.right.mas_equalTo(@-10);
    }];
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-3);
        make.left.mas_equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImg.mas_right).mas_equalTo(@4);
        make.centerY.mas_equalTo(_iconImg.mas_centerY).mas_equalTo(@0);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.centerY.mas_equalTo(_nameLabel.mas_centerY).mas_equalTo(@0);
        
    }];


}

- (UIImageView *)iconImg{
    if (!_iconImg) {
        _iconImg =[[UIImageView alloc] init];
        _iconImg.layer.masksToBounds = YES;
        _iconImg.layer.cornerRadius = 9;
        _iconImg.image =[UIImage imageNamed:@"listTest1"];
        [self.contentView addSubview:self.iconImg];
    }
    return _iconImg;
}
- (UILabel *)questionLabel{
    if (!_questionLabel) {
        _questionLabel =[[UILabel alloc] init];
        _questionLabel.textAlignment= NSTextAlignmentLeft;
        _questionLabel.font = BWFont(15);
        _questionLabel.textColor = BWColor(112, 108, 205, 1);
        [self.contentView addSubview:self.questionLabel];
    }
    return _questionLabel;
}
- (UILabel *)auswerLabel{
    if (!_auswerLabel) {
        _auswerLabel =[[UILabel alloc] init];
        _auswerLabel.textAlignment= NSTextAlignmentLeft;
        _auswerLabel.textColor = DetailTextColor;
        _auswerLabel.font = BWFont(13);
        _auswerLabel.numberOfLines = 0;
        [self.contentView addSubview:self.auswerLabel];
    }
    return _auswerLabel;
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
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel =[[UILabel alloc] init];
        _priceLabel.textAlignment= NSTextAlignmentRight;
        _priceLabel.font = BWFont(10);
        _priceLabel.textColor = BWColor(34, 159, 95, 1);
        [self.contentView addSubview:self.priceLabel];
    }
    return _priceLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel =[[UILabel alloc] init];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.font = BWFont(10);
        _timeLabel.text = @"张泽";
        [self.contentView addSubview:self.timeLabel];
    }
    return _timeLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
