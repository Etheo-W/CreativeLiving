//
//  AboutViewController.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    EWNavigationBar *barView = [[EWNavigationBar alloc]initWithTitle:@"关于" WithView:self.view];
    barView.delegate = self;
    [self.view addSubview:barView];
    
    UIImageView *logoImageView = [self addLogoImageViewWithView:barView];
    [self.view addSubview:logoImageView];
    
    [self addVersionNumberViewWithView:logoImageView];
    
    [self addBottomImageView];
}

- (UIImageView *)addLogoImageViewWithView:(EWNavigationBar *)barView
{
    UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 170, 106)];
    logoImageView.centerX = self.view.centerX;
    logoImageView.sd_layout.topSpaceToView(barView, 50).heightIs(106);
    logoImageView.image = [UIImage imageNamed:@"xzzm_Settings_aboutHeader"];
    
    return logoImageView;
}

- (void)addVersionNumberViewWithView:(UIView *)view
{
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.view.width - 20, 34)];
    bgImageView.sd_layout.topSpaceToView(view, 10).heightIs(34);
    bgImageView.image = [UIImage imageNamed:@"xzzm_Settings_aboutMessageBg"];
    [self.view addSubview:bgImageView];
    
    UILabel *versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 36)];
    versionLabel.font = [UIFont systemFontOfSize:15];
    versionLabel.text = @"版本";
    [bgImageView addSubview:versionLabel];
    
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 36)];
    numberLabel.font = [UIFont systemFontOfSize:15];
    numberLabel.text = VERSIONNUMBER;
    numberLabel.textAlignment = NSTextAlignmentRight;
    numberLabel.sd_layout.rightSpaceToView(bgImageView, 10).widthIs(100);
    [bgImageView addSubview:numberLabel];
}

- (void)addBottomImageView
{
    UIImageView *bottomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.height - 100, 189, 45)];
    bottomImageView.centerX = self.view.centerX;
    bottomImageView.image = [UIImage imageNamed:@"xzzm_Settings_aboutBottom"];
    [self.view addSubview:bottomImageView];
}

- (void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
