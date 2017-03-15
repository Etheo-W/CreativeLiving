//
//  FeedBackViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()
{
    UIImageView *_feedBackBoxTextViewBgImageView;
    
    UITextView *_feedBackBoxTextView;
}
@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    EWNavigationBar *barView = [[EWNavigationBar alloc]initWithTitle:@"意见反馈" WithView:self.view];
    barView.delegate = self;
    [self.view addSubview:barView];
    
    UIView *feedBackBoxView = [self createFeedBackBox];
    [self.view addSubview:feedBackBoxView];
    
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commitButton.frame = CGRectMake(0, 0, 100, 30);
    commitButton.centerX = self.view.centerX;
    commitButton.sd_layout.topSpaceToView(feedBackBoxView, 10).heightIs(30);
    [commitButton setBackgroundImage:[UIImage imageNamed:@"xzzm_Settings_feedbackCommitBtn"] forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(commitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
    
    UIImageView *bottomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.height - 100, 189, 45)];
    bottomImageView.centerX = self.view.centerX;
    bottomImageView.image = [UIImage imageNamed:@"xzzm_Settings_aboutBottom"];
    [self.view addSubview:bottomImageView];
    
}

- (UIView *)createFeedBackBox
{
    UIView *feedBackBoxView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.width *0.62)];
    
    UIImageView *feedBackBoxViewBgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Settings_feedbackBoxBg"]];
    feedBackBoxViewBgImageView.frame = CGRectMake(10, 3, self.view.width - 20, feedBackBoxViewBgImageView.width * 0.62);
    [feedBackBoxView addSubview:feedBackBoxViewBgImageView];
    
    _feedBackBoxTextViewBgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 35, 270,90)];
    _feedBackBoxTextViewBgImageView.centerX = self.view.centerX;
    _feedBackBoxTextViewBgImageView.image = [UIImage imageNamed:@"xzzm_Settings_feedbackPlaceholder"];
    [feedBackBoxView addSubview:_feedBackBoxTextViewBgImageView];
    
    _feedBackBoxTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, 30, 270,90)];
    _feedBackBoxTextView.centerX = self.view.centerX;
    _feedBackBoxTextView.backgroundColor = [UIColor clearColor];
    _feedBackBoxTextView.delegate = self;
    [feedBackBoxView addSubview:_feedBackBoxTextView];
    
    return feedBackBoxView;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        _feedBackBoxTextViewBgImageView.image = [UIImage imageNamed:@"xzzm_Settings_feedbackPlaceholder"];
    }
    else
    {
        _feedBackBoxTextViewBgImageView.image = nil;
    }
}

- (void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)commitButtonClick:(UIButton *)sender
{
    if (_feedBackBoxTextView.text.length == 0)
    {
        [UIAlertView oneButtonAlertViewWithTitle:@"提示" WithMessage:@"请输入需要反馈的内容~" WithButtonTitle:@"确定"];
    }
    else
    {
        [HttpManager commitFeedBackWithContent:_feedBackBoxTextView.text WithCompletionBlock:^(bool isSuccess)
        {
            if (isSuccess)
            {
                [UIAlertView oneButtonAlertViewWithTitle:@"提示" WithMessage:@"提交成功,感谢您的支持~" WithButtonTitle:@"确定"];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
