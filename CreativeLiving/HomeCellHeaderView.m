//
//  HomeCellHeaderView.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/27.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeCellHeaderView.h"

@implementation HomeCellHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {        
        UIImageView *shopHeaderViewBgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xzzm_Shop_headerBg"]];
        shopHeaderViewBgImageView.frame = CGRectMake(0, 0, systemWidth, 180);
        shopHeaderViewBgImageView.centerX = self.centerX;
        [self addSubview:shopHeaderViewBgImageView];
        
        UIView *shopHeaderImageViewBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, (shopHeaderImageViewCornerRadius + shopHeaderImageViewLineWidth) * 2, (shopHeaderImageViewCornerRadius + shopHeaderImageViewLineWidth) * 2)];
        shopHeaderImageViewBgView.layer.cornerRadius = shopHeaderImageViewCornerRadius + shopHeaderImageViewLineWidth;
        shopHeaderImageViewBgView.centerX = self.centerX;
        shopHeaderImageViewBgView.clipsToBounds = YES;
        shopHeaderImageViewBgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:shopHeaderImageViewBgView];
        
        _shopHeaderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(shopHeaderImageViewLineWidth, shopHeaderImageViewLineWidth, shopHeaderImageViewCornerRadius * 2, shopHeaderImageViewCornerRadius * 2)];
        [shopHeaderImageViewBgView addSubview:_shopHeaderImageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 93, self.width, 30)];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.centerX = self.centerX;
        [self addSubview:_nameLabel];
        
        UIView *tipLabelBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 140, systemWidth - 70, 16)];
        tipLabelBgView.centerX = self.centerX;
        tipLabelBgView.backgroundColor = [UIColor whiteColor];
        tipLabelBgView.layer.cornerRadius = 8;
        tipLabelBgView.layer.masksToBounds = YES;
        [self addSubview:tipLabelBgView];
        
        _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 0, tipLabelBgView.width - 44, 16)];
        _tipLabel.textColor = [UIColor getSystemColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.font = [UIFont systemFontOfSize:14];
        [tipLabelBgView addSubview:_tipLabel];
    }

    return self;
}

@end
