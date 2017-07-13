//
//  ZYGSelecteContinuePlayView.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/13.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "ZYGSelecteContinuePlayView.h"


@interface ZYGSelecteContinuePlayView ()


@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detaillabel;

@property (nonatomic,strong) UIButton   *continueButton;




@end

@implementation ZYGSelecteContinuePlayView



- (instancetype)init{
    self =[super init];
    if (self) {
        self.backgroundColor = BWColor(1, 1, 1, 0.95);
        [self loadSubViews];
    }
    return self;
}
- (void)setBackGroundColor:(UIColor *)backGroundColor{
    _backGroundColor = backGroundColor;
    self.backgroundColor = backGroundColor;
}

//
- (void)loadSubViews{
    
    [self.detaillabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(@-5);
        make.centerX.mas_equalTo(@0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_detaillabel.mas_top).mas_equalTo(@-10);
        make.centerX.mas_equalTo(@0);
    }];
    [self.continueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_detaillabel.mas_bottom).mas_equalTo(@10);
        make.centerX.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(66, 28));
    }];

}

#pragma mark   重写set方法
- (void)setDetailTitle:(NSString *)detailTitle{
    _detailTitle = detailTitle;
    _detaillabel.text = detailTitle;
}
- (void)setTitle:(NSString *)title{
    _title =title;
    _titleLabel.text = title;
}
- (void)setButtonTitle:(NSString *)buttonTitle{
    _buttonTitle= buttonTitle;
    [self.continueButton setTitle:@"点击重试" forState:UIControlStateNormal];
}



- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc] init];
        _titleLabel.textColor =[UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"正在使用非WIFI网络，播放将产生流量费用";
        [self addSubview:self.titleLabel];
    }
    return _titleLabel;
}
- (UILabel *)detaillabel{
    if (!_detaillabel) {
        _detaillabel =[[UILabel alloc] init];
        _detaillabel.textColor =[UIColor whiteColor];
        _detaillabel.font = [UIFont systemFontOfSize:12];
        _detaillabel.textAlignment = NSTextAlignmentCenter;
        _detaillabel.text = @"视频时长 02:10 I 流量 约10.20MB";
        [self addSubview:self.detaillabel];
    }
    return _detaillabel;
}
- (UIButton *)continueButton{
    if (!_continueButton) {
        _continueButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_continueButton setTitle:@"继续播放" forState:UIControlStateNormal];
        [_continueButton setTitle:@"继续播放" forState:UIControlStateSelected];
        _continueButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _continueButton.layer.masksToBounds= YES;
        _continueButton.layer.cornerRadius = 3;
        _continueButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _continueButton.layer.borderWidth = 1;
        [_continueButton addTarget:self action:@selector(continuePalyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.continueButton];
    }
    return _continueButton;
}
///  继续播放按钮响应事件
- (void)continuePalyButtonAction:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"点击重试"]) {
        [self hideTestSelecteView];
    }else{
       [self hideSelecteView];
    }
    
}

- (void)hideSelecteView{
    if (self.selBlock) {
        self.selBlock (YES);
    }
    if ([self.continueButton.titleLabel.text isEqualToString:@"继续播放"]) {
        
        [self removeFromSuperview];
    }
   
}
- (void)hideTestSelecteView{
    if (self.touchBlock) {
        self.touchBlock (YES);
    }
    [self removeFromSuperview];
}



@end
