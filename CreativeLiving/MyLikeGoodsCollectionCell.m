//
//  MyLikeGoodsCollectionCell.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/3.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "MyLikeGoodsCollectionCell.h"

@implementation MyLikeGoodsCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        [self.contentView addSubview:_imageView];
        
        _priceLabelView = [[UIView alloc]init];
        _priceLabelView.sd_layout.widthIs(50).heightIs(13).rightSpaceToView(self.contentView, 12).bottomSpaceToView(self.contentView, 10);
        [self.contentView addSubview:_priceLabelView];
        
        _priceLabelBgImageView = [[UIImageView alloc]initWithFrame:_priceLabelView.frame];
        _priceLabelBgImageView.image = [UIImage imageNamed:@"xzzm_Commons_priceLabelBg"];
        [_priceLabelView addSubview:_priceLabelBgImageView];
        
        _priceLabel = [[UILabel alloc]initWithFrame:_priceLabelView.frame];
        _priceLabel.font = [UIFont systemFontOfSize:10];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.textColor = [UIColor whiteColor];
        [_priceLabelView addSubview:_priceLabel];
    }
    return self;
}

@end
