//
//  gridCollectionCell.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/29.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "gridCollectionCell.h"

@implementation gridCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 66)];
        [self.contentView addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 66, 90, 14)];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
    }
    
    return self;
}

@end
