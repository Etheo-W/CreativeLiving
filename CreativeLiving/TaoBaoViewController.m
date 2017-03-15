//
//  TaoBaoViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/5.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "TaoBaoViewController.h"

@interface TaoBaoViewController ()

@end

@implementation TaoBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    EWNavigationBar *navigationBar = [[EWNavigationBar alloc]initWithIsOpaque:YES WithView:self.view];
    navigationBar.delegate = self;
    [self.view addSubview:navigationBar];
    
    UIWebView *detailWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.height - 64)];
    NSLog(@"self.view.width == %f",self.view.width);
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_requestURL == nil ? [NSString stringWithFormat:@"http://h5.m.taobao.com/awp/core/detail.htm?id=%@",self.goodsID] : _requestURL]];
    
    detailWebView.scalesPageToFit = YES;
    [self.view addSubview:detailWebView];
    [detailWebView loadRequest:request];
    
}

- (void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
