//
//  SectionHeaderView.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UIImageView *bgImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2, 5, 16)];
        bgImageView1.image = [UIImage imageNamed:@"xzzm_ShopCategory_catTitleBgLeft"];
        [self addSubview:bgImageView1];
        
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 2, 11, 16)];
        _bgImageView.image = [[UIImage imageNamed:@"xzzm_ShopCategory_catTitleBgRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 4, 5, 10) resizingMode:UIImageResizingModeStretch];
        [self addSubview:_bgImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:_bgImageView.frame];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
    }
    
    return self;
}

@end
