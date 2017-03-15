//
//  EWNavigationBar.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/2.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "EWNavigationBar.h"

@implementation EWNavigationBar

- (id)initWithTitle:(NSString *)navigationTitle WithView:(UIView *)view
{
    self = [super init];
    
    if (self)
    {
        self.frame = CGRectMake(0, 20, view.width, 44);
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(10, 6, 30, 30);
        [backButton setImage:[UIImage imageNamed:@"xzzm_Commons_back"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(navigationBackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
        
        UILabel *navigationTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 12, [navigationTitle getRectWithSize:CGSizeMake(320, 0) WithSystemFontOfSize:17].size.width, 20)];
        navigationTitleLabel.centerX = view.centerX;
        navigationTitleLabel.text = navigationTitle;
        navigationTitleLabel.textColor = [UIColor getSystemColor];
        [self addSubview:navigationTitleLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, view.width, 1)];
        lineView.backgroundColor = [UIColor getSystemLightColor];
        [self addSubview:lineView];
    }
    
    return self;
}

- (id)initWithIsOpaque:(BOOL)opaque WithView:(UIView *)view
{
    self = [super init];
    
    if (self)
    {
        self.frame = CGRectMake(0, 20, view.width, 44);
        if (opaque)
        {
            self.backgroundColor = [UIColor whiteColor];
        }
        else
        {
            self.backgroundColor = [UIColor clearColor];
        }
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(10, 6, 30, 30);
        [backButton setImage:[UIImage imageNamed:@"xzzm_Commons_back"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(navigationBackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
    }
    
    return self;
}

- (void)navigationBackButtonClick:(UIButton *)sender
{
    [self.delegate backButtonClick:sender];
}

@end
