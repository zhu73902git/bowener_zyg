//
//  AccountViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/7.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView    *moneyTableView;
@property (nonatomic,strong) UILabel        *moneyLabel;
@property (nonatomic,strong) UIView         *acctHeaderView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UIButton       *acctDetails;

@end

@implementation AccountViewController

static NSString *MyAcctTableViewReuseID = @"MyAcctTableViewReuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
}
#pragma mark ==================== 加载所有子视图
- (void)loadSubViews{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"交易记录" style:UIBarButtonItemStylePlain target:self action:@selector(acctMsgButton)];
    [self addHeaderSubView];
    
}
#pragma mark ==================== 创建头视图
- (void)addHeaderSubView{
    // 账户余额 提示
    UILabel *label =[[UILabel alloc] init];
    label.textAlignment=NSTextAlignmentLeft;
    label.font = BWFont(16);
    label.text = @"账户余额";
    [self.acctHeaderView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@25);
        make.top.mas_equalTo(@30);
        make.size.mas_equalTo(CGSizeMake(kScreenW/3, 16));
    }];
    
     // 账户明细
    /*
     _acctDetails = [UIButton buttonWithType:UIButtonTypeCustom];
     [_acctDetails setTitle:@"账户明细" forState:UIControlStateNormal];
     [_acctDetails setTitleColor:SelecteCellColor forState:UIControlStateNormal];
     _acctDetails.titleLabel.font=BWFont(15);
     [_acctDetails addTarget:self action:@selector(acctMsgButton) forControlEvents:UIControlEventTouchUpInside];
     [self.acctHeaderView addSubview:_acctDetails];
     [self.acctDetails mas_makeConstraints:^(MASConstraintMaker *make) {
     make.centerY.mas_equalTo(label.mas_centerY).mas_equalTo(@0);
     make.right.mas_equalTo(@-20);
     make.size.mas_equalTo(CGSizeMake(80, 36));
     }];
    */
    
    // 账户余额  数值
    _moneyLabel = [[UILabel alloc] init];
    _moneyLabel.text =@"0.0";
    _moneyLabel.textColor = [UIColor blackColor];
    _moneyLabel.textAlignment = NSTextAlignmentLeft;
    _moneyLabel.font = [UIFont boldSystemFontOfSize:30];
    [self.acctHeaderView addSubview:_moneyLabel];
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).mas_equalTo(@10);
        make.left.mas_equalTo(@25);
        make.size.mas_equalTo(CGSizeMake(kScreenW/2, 35));
    }];
    
    self.moneyTableView.tableHeaderView=self.acctHeaderView;
    
}
- (UIView *)acctHeaderView{
    
    if (!_acctHeaderView) {
        _acctHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 120)];
        _acctHeaderView.backgroundColor = tabTitleColor;
    }
    return _acctHeaderView;
}

#pragma mark ==================== 创建tableView
- (UITableView *)moneyTableView{
    if (!_moneyTableView) {
        _moneyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
        _moneyTableView.delegate   = self;
        _moneyTableView.dataSource = self;
        _moneyTableView.showsHorizontalScrollIndicator=NO;
        _moneyTableView.backgroundColor = SelecteCellColor;
        
        [self.view addSubview:self.moneyTableView];
    }
    return _moneyTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IS_IPHONE5 ? 45 : 56;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:MyAcctTableViewReuseID];
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyAcctTableViewReuseID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }
    NSDictionary *dict =[self.dataSource objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[dict objectForKey:@"icon"]];
    cell.textLabel.text = [dict objectForKey:@"title"];
    cell.textLabel.font = BWFont(15);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        
        
    }else if (indexPath.row==1){
       
        
    }
}
#pragma mark ==================== 页面跳转
// 账户明细页面
- (void)acctMsgButton{
    
    
}
#pragma mark ====================
- (NSMutableArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@{@"icon":@"chongzhi",@"title":@"充值"},
                       @{@"icon":@"tixian",@"title":@"提现"}, nil];
    }
    return _dataSource;
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
