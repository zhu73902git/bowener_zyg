//
//  ExpertVedioTableViewCell.m
//  
//
//  Created by zhujp on 2017/6/7.
//
//

#import "ExpertVedioTableViewCell.h"

@interface ExpertVedioTableViewCell ()



@property (nonatomic,strong) UILabel      *titleLabel;

@property (nonatomic,strong) UIButton     *openBtn;
@property (nonatomic,strong) UILabel      *timelongLabel;
@property (nonatomic,strong) UILabel      *priceLabel;


@property (nonatomic,strong) NSIndexPath  *indexPath;

@end

@implementation ExpertVedioTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
        [self loadVedioView];
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict{
    _dict = dict;
    self.titleLabel.text = dict[@"title"];
    
    self.timelongLabel.text = [NSString stringWithFormat:@"时长:%@", dict[@"time"]];
    self.priceLabel.text    = [NSString stringWithFormat:@"课程价格:%@",dict[@"price"]];
    
    self.titleLabel.text = dict[@"title"];
    self.vedioImageView.image = [UIImage imageNamed:dict[@"vedioImg"]];

}


- (void)videoCellWithTableView:(UITableView *)tableview WithIndexPath:(NSIndexPath *)indexpath{
   
    self.indexPath = indexpath;
}





#pragma mark  加载视图
- (void)configUI{

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@5);
        make.right.mas_equalTo(@-10);
        make.height.mas_equalTo(@30);
    }];
    [self.vedioImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(@0);
        make.left.mas_equalTo(@5);
        make.right.mas_equalTo(@-5);
        make.height.mas_equalTo(@(kScreenW*0.5));
    }];
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(@2);
        make.size.mas_equalTo(CGSizeMake(kScreenW*0.14, kScreenW*0.14));
    }];
    [self.timelongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-5);
        make.left.mas_equalTo(@10);
        make.width.mas_equalTo(@(kScreenW*0.5));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@-5);
        make.right.mas_equalTo(@-10);
        make.width.mas_equalTo(@(kScreenW*0.5));
    }];

}

#pragma mark   创建视频播放器
- (void)loadVedioView{
    

}

- (UIImageView *)vedioImageView{
    if (!_vedioImageView) {
        _vedioImageView =[[UIImageView alloc] init];
        _vedioImageView.userInteractionEnabled = YES;
        _vedioImageView.layer.masksToBounds = YES;
        _vedioImageView.layer.cornerRadius = 1;
        _vedioImageView.layer.borderColor = SelecteCellColor.CGColor;
        _vedioImageView.layer.borderWidth = 1;
        [self.contentView addSubview:self.vedioImageView];
    }
    return _vedioImageView;
}
- (UIButton *)openBtn{
    if (!_openBtn) {
        _openBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_openBtn setImage:[UIImage imageNamed:@"openBtnImage"] forState:UIControlStateNormal];
        [_openBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        _openBtn.userInteractionEnabled = NO;
    //    [_openBtn addTarget:self action:@selector(opemVedioButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.vedioImageView addSubview:self.openBtn];
    }
    return _openBtn;
}
#pragma mark  打开视频
- (void)opemVedioButtonAct:(UIButton *)button{
    if (self.block) {
        self.block(self.indexPath);
    }

}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textAlignment= NSTextAlignmentLeft;
        _titleLabel.font = BWFont(14);
        _titleLabel.text = @"互联网生存法则 (二) 经典视频";
        [self.contentView addSubview:self.titleLabel];
    }
    return _titleLabel;
}


- (UILabel *)timelongLabel{
    if (!_timelongLabel) {
        _timelongLabel =[[UILabel alloc] init];
        _timelongLabel.textAlignment= NSTextAlignmentLeft;
        _timelongLabel.font = BWFont(11);
        _timelongLabel.text = @"时长:0.30.1";
        _timelongLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.timelongLabel];
    }
    return _timelongLabel;
}


- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel =[[UILabel alloc] init];
        _priceLabel.textAlignment= NSTextAlignmentRight;
        _priceLabel.font = BWFont(11);
        _priceLabel.text = @"免费课程";
        _priceLabel.textColor = BWColor(35, 159, 96, 1);
        [self.contentView addSubview:self.priceLabel];
    }
    return _priceLabel;
}









- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
