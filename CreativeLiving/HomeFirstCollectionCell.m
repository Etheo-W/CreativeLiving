//
//  HomeFirstCollectionCell.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/25.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeFirstCollectionCell.h"

@implementation HomeFirstCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, self.contentView.width, self.contentView.height - 10)];
        [self.contentView addSubview:_imageView];
        
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xzzm_Street_catTitleBg"]];
        _tipImageView.frame = CGRectMake(self.contentView.width - 125, 130, 125, 21);
        [self.contentView addSubview:_tipImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:_tipImageView.frame];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLabel];
    }
    
    return self;
}

@end
