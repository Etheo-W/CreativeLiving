//
//  EWButton.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "EWButton.h"

@implementation EWButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_bgImageView];
        
        UIView *priceLabelView = [[UIView alloc]initWithFrame:CGRectMake(self.width - 62, self.height - 23, 50, 13)];
        [self addSubview:priceLabelView];
        
        UIImageView *priceLabelBgImageView = [[UIImageView alloc]initWithFrame:priceLabelView.frame];
        priceLabelBgImageView.image = [UIImage imageNamed:@"xzzm_Commons_priceLabelBg"];
        [self addSubview:priceLabelBgImageView];
        
        _priceLabel = [[UILabel alloc]initWithFrame:priceLabelView.frame];
        _priceLabel.font = [UIFont systemFontOfSize:10];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.textColor = [UIColor whiteColor];
        [self addSubview:_priceLabel];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
    
    return self;
}

- (void)btnClick:(UIButton *)sender
{
    [self.delegate EWButtonClick:self];
}

@end
