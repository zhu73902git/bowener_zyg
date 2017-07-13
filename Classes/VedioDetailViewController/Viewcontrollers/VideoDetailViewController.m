//
//  VideoDetailViewController.m
//  XLVideoPlayer
//
//  Created by Shelin on 16/3/24.
//  Copyright © 2016年 GreatGate. All rights reserved.
//  https://github.com/ShelinShelin
//  博客：http://www.jianshu.com/users/edad244257e2/latest_articles

#import "VideoDetailViewController.h"
#import "XLVideoPlayer.h"
#import "VedioDetailTableView.h"


@interface VideoDetailViewController ()

@property (nonatomic, strong) XLVideoPlayer *player;




@property (nonatomic, strong) VedioDetailTableView     *tableView;
@property (nonatomic, strong) NSMutableArray  *dataSource;





@end

@implementation VideoDetailViewController

- (XLVideoPlayer *)player {
    if (!_player) {
        _player = [[XLVideoPlayer alloc] init];
        _player.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width*0.66);
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.videoTitle;
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player.videoUrl = self.mp4_url;
    [self.view addSubview:self.player];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (_player) {
        [self.player destroyPlayer];
        self.player = nil;

    }
}
- (VedioDetailTableView *)tableView{
    if (!_tableView) {
        _tableView =[[VedioDetailTableView alloc] initWithFrame:CGRectMake(0, kScreenW*0.66+64, kScreenW, kScreenH-kScreenW*0.66-64) style:UITableViewStyleGrouped];
        _tableView.backgroundColor =[UIColor whiteColor];
    }
    return _tableView;
}
///  加载子视图
- (void)loadSubViews{




}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
