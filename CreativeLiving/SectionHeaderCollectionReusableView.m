//
//  SectionHeaderCollectionReusableView.m
//  CreativeLiving
//
//  Created by Etheo W on 15/11/6.
//  Copyright (c) 2015年 Etheo W. All rights reserved.
//

#import "SectionHeaderCollectionReusableView.h"

@implementation SectionHeaderCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        _dateNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _dateNameLabel.textColor = [UIColor blackColor];
        _dateNameLabel.textAlignment = NSTextAlignmentCenter;
        _dateNameLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_dateNameLabel];
    }
    return self;
}

@end
