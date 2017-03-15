//
//  EWImageView.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "EWImageView.h"

@implementation EWImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_bgImageView];
        
        UIView *priceLabelView = [[UIView alloc]initWithFrame:CGRectMake(self.width - 142, self.height - 38, 130, 25)];
        priceLabelView.backgroundColor = [UIColor clearColor];
        [self addSubview:priceLabelView];
        
        _priceLabelBgImageView = [[UIImageView alloc]initWithFrame:priceLabelView.frame];
        _priceLabelBgImageView.image = [UIImage imageNamed:@"xzzm_Commons_priceLabelBg"];
        [self addSubview:_priceLabelBgImageView];
        
        _priceLabel = [[UILabel alloc]initWithFrame:priceLabelView.frame];
        _priceLabel.font = [UIFont systemFontOfSize:15];
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
    [self.delegate EWImageViewTap:self];
}

@end
