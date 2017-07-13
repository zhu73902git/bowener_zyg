//
//  MainBannerDetailViewController.m
//  ZhiKuZaiXian
//
//  Created by zhujp on 2017/6/28.
//  Copyright © 2017年 zhuyonggang. All rights reserved.
//

#import "MainBannerDetailViewController.h"

@interface MainBannerDetailViewController ()<UIWebViewDelegate>
{
    UIWebView *webView;
}



@end

@implementation MainBannerDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    webView.backgroundColor = [UIColor whiteColor];
    webView.delegate = self;
    NSString *urlStr = self.urlStr;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
    
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [LoadingView showProgressHUD:@"正在加载"];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [LoadingView hideProgressHUD];
    [LoadingView showAlertHUD:@"连接错误" duration:1.5];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [LoadingView hideProgressHUD];
    
    
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
