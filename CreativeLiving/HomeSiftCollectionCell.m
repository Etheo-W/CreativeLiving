//
//  HomeSiftCollectionCell.m
//  CreativeLiving
//
//  Created by Etheo W on 16/5/26.
//  Copyright © 2016年 Etheo W. All rights reserved.
//

#import "HomeSiftCollectionCell.h"

@implementation HomeSiftCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _bgImageView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
        [self.contentView addSubview:_bgImageView];
        
        UIView *whiteBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.height - 30, self.contentView.width, 30)];
        whiteBgView.backgroundColor = [UIColor whiteColor];
        whiteBgView.alpha = 0.7;
        [self.contentView addSubview:whiteBgView];
        
        _kindImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xzzm_SubjectList_subjectIcon"]];
        _kindImageView.frame = CGRectMake(10, 8, 32, 15);
        [whiteBgView addSubview:_kindImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 0, 120, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor blackColor];
        [whiteBgView addSubview:_titleLabel];
        
        _dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width - 120, 0, 120, 30)];
        _dataLabel.font = [UIFont systemFontOfSize:13];
        _dataLabel.textAlignment = NSTextAlignmentRight;
        _dataLabel.textColor = [UIColor getSystemColor];
        [whiteBgView addSubview:_dataLabel];
    }
    
    return self;
}

@end
