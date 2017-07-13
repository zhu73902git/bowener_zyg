//
//  MainSearchViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/28.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MainSearchViewController.h"

@interface MainSearchViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *searchTextField;


@end

@implementation MainSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavigation];
    
    
}

- (void)setNavigation{
    
    self.navigationItem.titleView = self.searchTextField;
    
    ///  退出按钮
    UIButton *cancelButton =[UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame= CGRectMake(0, 0, 35, 35);
    cancelButton.titleLabel.font = BWFont(15);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelSearchAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    
}
#pragma mark   搜索
- (void)cancelSearchAction:(UIButton *)button{
    
    [self.searchTextField resignFirstResponder];
    
   [self dismissViewControllerAnimated:NO completion:^{
       
   }];
    
}

- (UITextField *)searchTextField{
    if (!_searchTextField) {
        _searchTextField =[[UITextField alloc] init];
        _searchTextField.frame = CGRectMake(0, 0, kScreenW*0.75, 32);
        _searchTextField.placeholder = @"输入关键词";
        _searchTextField.backgroundColor = BWColor(240, 240, 240, 1);
        _searchTextField.layer.masksToBounds = YES;
        _searchTextField.layer.cornerRadius = 16;
        _searchTextField.delegate = self;
        _searchTextField.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        _searchTextField.layer.borderWidth = 0.6;
        _searchTextField.font = BWFont(15);
        _searchTextField.returnKeyType = UIReturnKeySearch;
        UIView *imgView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 32)];
        UIImageView *imgV=[[UIImageView alloc] initWithFrame:CGRectMake(12, 7, 18, 18)];
        imgV.image =[UIImage imageNamed:@"tfSearchImg"];
        [imgView addSubview:imgV];
        _searchTextField.leftView= imgView;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _searchTextField;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if ([string isEqualToString:@"\n"]) {
        [self.searchTextField resignFirstResponder];
    }
    return YES;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.searchTextField resignFirstResponder];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
