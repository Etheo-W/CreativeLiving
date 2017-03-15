//
//  ChannelCollectionCell.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/28.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "ChannelCollectionCell.h"

@implementation ChannelCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 0)];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        
        _priceLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        _priceLabel1.font = [UIFont systemFontOfSize:15];
        _priceLabel1.textColor = [UIColor redColor];
        _priceLabel1.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_priceLabel1];
        
        _goodsImageView = [[EWImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self.contentView addSubview:_goodsImageView];
        
        _priceMemoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        _priceMemoLabel.font = [UIFont systemFontOfSize:13];
        _priceMemoLabel.textColor = [UIColor redColor];
        _priceMemoLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_priceMemoLabel];
        
        _priceLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        _priceLabel2.font = [UIFont systemFontOfSize:15];
        _priceLabel2.textColor = [UIColor redColor];
        _priceLabel2.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_priceLabel2];
        
        _button1 = [EWURLButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(frame.size.width - 160, 0, 70, 30);
        [self.contentView addSubview:_button1];
        
        _button2 = [EWURLButton buttonWithType:UIButtonTypeCustom];
        _button2.frame = CGRectMake(frame.size.width - 80, 0, 70, 30);
        [self.contentView addSubview:_button2];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, 20)];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_timeLabel];
        
        _sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2, 0, frame.size.width / 2, 20)];
        _sourceLabel.textColor = [UIColor grayColor];
        _sourceLabel.textAlignment = NSTextAlignmentRight;
        _sourceLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_sourceLabel];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 2)];
        _lineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_lineView];
    }
    
    return self;
}

@end
